<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sale Details</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .email-container {
            width: 100%;
            padding: 20px 0;
            background-color: #f4f4f4;
        }

        .email-content {
            max-width: 650px;
            margin: auto;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
        }

        .email-header {
            background-color: #007BFF;
            color: #ffffff;
            padding: 25px 20px;
            text-align: center;
        }

        .email-header img {
            max-width: 160px;
            height: auto;
        }

        .email-header h1 {
            margin: 0;
            font-size: 22px;
        }

        .email-body {
            padding: 25px 20px;
            color: #333333;
        }

        .email-body h1 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #007BFF;
        }

        .email-body h3 {
            margin-top: 30px;
            margin-bottom: 10px;
            font-size: 16px;
            color: #007BFF;
        }

        .email-body p {
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 8px;
        }

        .email-body table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 14px;
        }

        .email-body th,
        .email-body td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .email-body th {
            background-color: #f1f1f1;
            font-weight: 600;
        }

        .email-body tbody tr:nth-child(even) {
            background-color: #fafafa;
        }

        .loyalty-box {
            margin-top: 20px;
            padding: 15px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        .email-footer {
            background-color: #333333;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            font-size: 13px;
        }

        @media only screen and (max-width: 600px) {
            .email-content {
                width: 95%;
            }

            .email-header h1,
            .email-body h1 {
                font-size: 18px;
            }

            .email-body p,
            .email-body table {
                font-size: 13px;
            }
        }
    </style>
</head>

<body>
    <div class="email-container">
        <div class="email-content">
            <div class="email-header">
                @if($general_setting->site_logo)
                    <a href="{{url('/')}}"><img src="{{url('logo', $general_setting->site_logo)}}" alt="Logo"></a>
                @else
                    <h1>{{$general_setting->site_title}}</h1>
                @endif
            </div>
            <div class="email-body">
                <h1>Sale Details</h1>
                <p><strong>Customer Name:</strong> {{$sale_data['name']}}</p>
                <p><strong>Member No:</strong> {{$sale_data['member_no']}}</p>
                <p><strong>Accumulated Points:</strong> {{$sale_data['points']}}</p>
                <p><strong>Outstanding INPL:</strong> {{$sale_data['inpl']}}</p>

                <div class="loyalty-box">
                    <h3>Loyalty Points Information</h3>
                    <div>
                        @php
                            $taxRates = $sale_data['tax_rates'] ?? [];
                            $totalPoints = $sale_data['points'];
                            $taxDescToName = [];

                            foreach ($taxRates as $tax) {
                                $taxDescToName[$tax->TAX_SHORT_DESC] = $tax->name;
                            }

                            $taxTableRows = '';

                            foreach ($taxRates as $tax) {
                                if ($tax->TAX_SHORT_DESC == 'BLS') {
                                    $taxAmount = $totalPoints;
                                    $taxDisplay = number_format($taxAmount, 2);
                                    $taxTableRows .= "<tr><td><strong>" . $taxDescToName[$tax->TAX_SHORT_DESC] . "</strong></td><td><strong>". $tax->rate ." (%) </strong></td> <td><strong>" . $taxDisplay . "</strong></td></tr>";
                                    break;
                                }
                            }

                            foreach ($taxRates as $tax) {
                                if ($tax->TAX_SHORT_DESC != 'BLS') {
                                    if ($tax->TAX_SHORT_DESC == 'INPL') {
                                        $taxDisplay = $sale_data['inpl'] < 0 ? number_format($sale_data['inpl'], 2) : 'No INPL';
                                    } else {
                                        $taxAmount = $sale_data['inpl'] < 0 ? 0 : ($totalPoints * $tax->rate) / 100;
                                        $taxDisplay = number_format($taxAmount, 2);
                                    }

                                    $taxTableRows .= "<tr><td><strong>" . $taxDescToName[$tax->TAX_SHORT_DESC] . "</strong></td><td><strong>". $tax->rate ." (%) </strong></td> <td><strong>" . $taxDisplay . "</strong></td></tr>";;
                                }
                            }
                        @endphp

                        <table>
                            <thead>
                                <tr>
                                    <th>Description</th>
                                    <th>Percentange (%)</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                {!! $taxTableRows !!}
                            </tbody>
                        </table>
                    </div>
                </div>

                <p style="margin-top: 30px;">Thank you for your business!</p>
            </div>
            <div class="email-footer">
                &copy; {{$general_setting->site_title}} {{date('Y')}}
            </div>
        </div>
    </div>
</body>

</html>
