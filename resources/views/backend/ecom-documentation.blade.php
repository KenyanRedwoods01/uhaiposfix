<!doctype html>
<!--[if IE 6 ]><html lang="en-us" class="ie6"> <![endif]-->
<!--[if IE 7 ]><html lang="en-us" class="ie7"> <![endif]-->
<!--[if IE 8 ]><html lang="en-us" class="ie8"> <![endif]-->
<!--[if (gt IE 7)|!(IE)]><!-->
<html lang="en-us">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <title>{{$general_setting->site_title}}</title>
    <meta name="description" content="">
    <meta name="author" content="{{$general_setting->developed_by}}">
    <meta name="copyright" content="{{$general_setting->developed_by}}">
    <meta name="generator" content="Documenter v2.0 http://rxa.li/documenter">
    <meta name="date" content="2017-04-26T00:00:00+02:00">
    <link rel="icon" type="image/png" href="{{url('logo', $general_setting->site_logo)}}" />
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:400,700">
    <link rel="stylesheet" href="read_me/assets/css/documenter_style.css" media="all">
    <link rel="stylesheet" href="read_me/assets/css/jquery.mCustomScrollbar.css" media="all">

    <script src="read_me/assets/js/jquery.js"></script>
    <script src="read_me/assets/js/jquery.scrollTo.js"></script>
    <script src="read_me/assets/js/jquery.easing.js"></script>
    <script src="read_me/assets/js/jquery.mCustomScrollbar.js"></script>
    <script>
    document.createElement('section');
    var duration = '500',
        easing = 'swing';
    </script>
    <script src="read_me/assets/js/script.js"></script>
</head>

<body>
    <div id="documenter_sidebar">
    	<a href="{{ URL::previous() }}"><img src="{{url('logo', $general_setting->site_logo)}}" style="border: none;margin: 20px 20px 0;width: 180px"></a>
        <ul id="documenter_nav">
            <li><a href="#install">Install</a></li>
            <li><a href="#update">Software Update</a></li>
            <li><a href="#product">Product</a></li>
            <li><a href="#category">Category</a></li>
            <li><a href="#brand">Brand</a></li>
            <li><a href="#slider">Slider</a></li>
            <li><a href="#menu">Menu</a></li>
            <li><a href="#collection">Collection</a></li>
            <li><a href="#pages">Pages</a></li>
            <li><a href="#widget">Widgets</a></li>
            <li><a href="#faq">FAQs</a></li>
            <li><a href="#social">Social Links</a></li>
            <li><a href="#payment">Payment Gateways</a></li>
            <li><a href="#setting">Setting</a></li>
            <li><a href="#video_tutorial">Video Tutorial</a></li>
            <li><a href="#support">Support</a></li>
        </ul>
    </div>
    
    <script type="text/javascript">
    	$("#documenter_sidebar").mCustomScrollbar({
            theme: "light",
            scrollInertia: 200
        });
    </script>
</body>

</html>
