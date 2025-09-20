@extends('layouts.app') {{-- Adjust to your layout --}}

@section('content')
<div class="container">
    <h2>Send Email to Customer</h2>

    @if(session('success'))
        <div style="color: green;">{{ session('success') }}</div>
    @endif

    <form method="POST" action="{{ route('email.send') }}">
        @csrf
        <div>
            <label>Email:</label>
            <input type="email" name="email" required>
        </div>

        <div>
            <label>Subject:</label>
            <input type="text" name="subject" required>
        </div>

        <div>
            <label>Message:</label>
            <textarea name="message" rows="5" required></textarea>
        </div>

        <button type="submit">Send Email</button>
    </form>
</div>
@endsection
