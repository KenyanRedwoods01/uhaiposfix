<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Notification; // Add this if you have a Notification model
use App\Notifications\SendNotification;
use Auth;
use Illuminate\Support\Facades\Validator;
use DB;
use Spatie\Permission\Models\Role;

class NotificationController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        
        if($role->hasPermissionTo('all_notification')) {
            // Multi-tenancy: Only show notifications for current user's pos_accnt_id
            $pos_accnt_id = Auth::user()->pos_accnt_id;
            
            $lims_notification_all = DB::table('notifications')
                                    ->where('pos_accnt_id', $pos_accnt_id)
                                    ->orderBy('created_at', 'desc') // Add ordering for better UX
                                    ->get();
            
            return view('backend.notification.index', compact('lims_notification_all'));
        }
        else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }
    }
    
    public function store(Request $request)
    {
        // Validate required fields
        $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'title' => 'required|string|max:255',
            'message' => 'required|string',
        ]);
        
        // Add pos_accnt_id from the authenticated user to ensure multi-tenancy
        $request->merge(['pos_accnt_id' => Auth::user()->pos_accnt_id]);
        
        // Handle document upload
        $document = $request->document;
        if($document) {
            $v = Validator::make(
                [
                    'extension' => strtolower($document->getClientOriginalExtension()),
                ],
                [
                    'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
                ]
            );
            
            if ($v->fails()) {
                return redirect()->back()->withErrors($v->errors());
            }
            
            $documentName = date('Ymdhis').'.'.$document->getClientOriginalExtension();
            $document->move(public_path('documents/notification'), $documentName);
            $request->merge(['document_name' => $documentName]);
        }
        
        // Multi-tenancy check: Only allow sending to users within same pos_accnt_id
        $user = User::where('id', $request->receiver_id)
                   ->where('pos_accnt_id', Auth::user()->pos_accnt_id)
                   ->first();
        
        if($user) {
            // Send notification
            $user->notify(new SendNotification($request));
            
            // Optional: Store in notifications table for your custom queries
            DB::table('notifications')->insert([
                'id' => \Illuminate\Support\Str::uuid(),
                'type' => SendNotification::class,
                'notifiable_type' => User::class,
                'notifiable_id' => $user->id,
                'data' => json_encode($request->except(['_token', 'document'])),
                'pos_accnt_id' => Auth::user()->pos_accnt_id, // Ensure multi-tenancy
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            
            return redirect()->back()->with('message', 'Notification sent successfully');
        }
        
        return redirect()->back()->with('error', 'Unable to send notification. User not found or access denied.');
    }
    
    public function markAsRead()
    {
        // Multi-tenancy: Only mark notifications as read for current pos_accnt_id
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        // Mark Laravel notifications as read
        Auth::user()->unreadNotifications
            ->where('data.reminder_date', date('Y-m-d'))
            ->where('data.pos_accnt_id', $pos_accnt_id)
            ->markAsRead();
            
        // Also mark custom notifications table records as read
        DB::table('notifications')
            ->where('notifiable_id', Auth::user()->id)
            ->where('pos_accnt_id', $pos_accnt_id)
            ->whereNull('read_at')
            ->update(['read_at' => now()]);
            
        return response()->json(['success' => true]);
    }
    
    /**
     * Get notifications for current user's tenant (pos_accnt_id)
     */
    public function getUserNotifications()
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        $notifications = DB::table('notifications')
                          ->where('pos_accnt_id', $pos_accnt_id)
                          ->where('notifiable_id', Auth::user()->id)
                          ->orderBy('created_at', 'desc')
                          ->paginate(10);
                          
        return response()->json($notifications);
    }
    
    /**
     * Delete notification (with tenant check)
     */
    public function destroy($id)
    {
        $pos_accnt_id = Auth::user()->pos_accnt_id;
        
        $deleted = DB::table('notifications')
                    ->where('id', $id)
                    ->where('pos_accnt_id', $pos_accnt_id)
                    ->delete();
                    
        if($deleted) {
            return redirect()->back()->with('message', 'Notification deleted successfully');
        }
        
        return redirect()->back()->with('error', 'Notification not found or access denied');
    }
}