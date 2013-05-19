<!DOCTYPE html>
<html class="not-ie csstransforms csstransforms3d csstransitions js" dir="ltr" lang="en-US"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- META TAGS -->
	<title>Victory.com</title>
		<meta name="description" content="Pastored by Sharon Daugherty in Tulsa, OK, Victory Christian Center is a church of love, acceptance and forgiveness for people of all denominations, races and nationalities." >
		<meta name="keywords" content="Victory Christian Center, church, VCC, Victory Tulsa, Tulsa Church, Daugherty, online church" >	<!-- END META TAGS -->
	
    <!-- STYLE SHEETS -->
    <link rel="stylesheet" id="dpSocialBar_headcss-css" href="https://www.victory.com/assets/v6/css/dpSocialBar.css" type="text/css" media="all">
    <link rel="stylesheet" id="ss-theme-styles-css" href="https://www.victory.com/assets/v6/css/style.css" type="text/css" media="all">
    <link rel="stylesheet" id="ss-main-heading-font-css" href="https://www.victory.com/assets/v6/css/css" type="text/css" media="all">
    <link rel="stylesheet" id="ss-blockquote-heading-font-css" href="https://www.victory.com/assets/v6/css/css(1)" type="text/css" media="all">
    <link rel="stylesheet" id="fancybox-css" href="https://www.victory.com/assets/v6/css/jquery.fancybox.min.css" type="text/css" media="all">
    <link rel="stylesheet" id="video-js-css" href="https://www.victory.com/assets/v6/css/video-js.min.css" type="text/css" media="all">
    <link rel="stylesheet" id="audioplayerv1-css" href="https://www.victory.com/assets/v6/css/audioplayerv1.min.css" type="text/css" media="all">
    <link rel="stylesheet" id="giving-css" href="https://www.victory.com/assets/v6/css/giving.css" type="text/css" media="all">
    <!-- Demo CSS -->
	<link rel="stylesheet" href="https://www.victory.com/assets/v6/css/slider-css/demo.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="https://www.victory.com/assets/v6/css/flexslider.css" type="text/css" media="screen" />

	<!-- END STYLE SHEETS -->
    
    <!-- JAVASCRIPT FILES -->
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/jquery.min.js'></script>
    <!--<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=1.7.2'></script>-->
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/jquery.countdown.min.js'></script>
	<script type='text/javascript' src='https://www.victory.com/assets/v6/js/jquery.dpSocialBar.js?ver=1.0'></script>
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/jquery.mouse.js?ver=0.1'></script>
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/jquery.jscrollpane.js?ver=0.1'></script>
    <script type='text/javascript' src='http://maps.google.com/maps/api/js?sensor=false&#038;ver=3.4.2'></script>
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/modernizr.custom.js?ver=3.4.2'></script>
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/video-js.min.js?ver=3.4.2'></script>
    <script type='text/javascript' src='https://www.victory.com/assets/v6/js/slider-js/modernizr.js'></script>
    <script type="text/javascript" src="https://www.victory.com/ckeditor/ckeditor.js"></script>
    <!--<script type="text/javascript" src="https://victory-a.akamaihd.net/assets/v5/js/script.js"></script> -->
    <script type="text/javascript" src="https://www.victory.com/assets/v6/js/giving_helper.js" charset="utf-8"></script>
<script type="text/javascript">
    //<![CDATA[
	$(function () {
		var days;
		var hours;
		var minutes;
		var seconds;
		var intervalId;

		function goLive() {
			$('#churchonline_counter .live').show();
			$('#churchonline_counter .time, #churchonline_counter .next_live').hide();
		}

		$.ajax({
			url: "http://victorytulsa.churchonline.org/event_times/next",
			dataType: "jsonp",
			success: function (data) {
				$('#churchonline_counter').show();

				if (typeof(data.current_timestamp) !== "undefined") {
					goLive();
				}
				else if (typeof(data.next_timestamp) !== "undefined") {
					$("#churchonline_counter .title").html("Live Next");
					//$(".menutop .description").html(data.next_description);

					var seconds_till = data.next_timestamp - (new Date().getTime() / 1000);

					days = Math.floor(seconds_till / 86400);
					hours = Math.floor((seconds_till % 86400) / 3600);
					minutes = Math.floor((seconds_till % 3600) / 60);
					seconds = Math.floor(seconds_till % 60);

					intervalId = setInterval(function () {
						if (--seconds < 0) {
							seconds = 59;
							if (--minutes < 0) {
								minutes = 59;
								if (--hours < 0) {
									hours = 23;
									if (--days < 0) {
										days = 0;
									}
								}
							}
						}

						$("#churchonline_counter .days").html((days.toString().length < 2) ? "0"+days : days);
						$("#churchonline_counter .hours").html((hours.toString().length < 2) ? "0"+hours : hours);
						$("#churchonline_counter .minutes").html((minutes.toString().length < 2) ? "0"+minutes : minutes);
						$("#churchonline_counter .seconds").html((seconds.toString().length < 2) ? "0"+seconds : seconds);

						if (seconds == 0 && minutes == 0 && hours == 0 && days == 0) {
							goLive();
							clearInterval(intervalId);
						}
					}, 1000);
				}
			}
		});
	});
    //]]>
</script>
  
    <!-- END JAVASCRIPT FILES -->
    
    
<style>
/* Main styles */
body {
	color: #303030;
	font: normal 15px/1.7 "Helvetica Neue", Arial, Helvetica, sans-serif;
}

::-moz-selection { background: #303030; color: #ffffff; text-shadow: none; }
::selection { background: #303030; color: #ffffff; text-shadow: none; }

/* Background (hex) */
body { background: #ffffff url(https://www.victory.com/assets/v6/uploads/2012/10/groovepaper1.png) repeat top center ; }

.tabs-nav li.active a,
.ss-slider, .ss-slider .slide-images-container,
.ss-slider .slide-bg-image, .ss-slider .buttons-container,
.projects-carousel img, #portfolio-items article img,
.comment .avatar,
.not-ie #footer:before { background-color: #ffffff; }

.button, input[type="submit"], input[type="reset"], button,
.button:hover, input[type="submit"]:hover, input[type="reset"]:hover, button:hover,
.dropcap.dark,
#main-nav ul ul a,
#main-nav ul ul a:hover, #main-nav ul ul .hover > a, #main-nav ul ul .current > a, #main-nav ul ul .current > a:hover,
.ss-slider .slide-button .dropcap,
.ss-slider .slide-content h1,
.ss-slider .slide-content h2,
.ss-slider .slide-content h3,
.ss-slider .slide-content h4,
.ss-slider .slide-content h5,
.ss-slider .slide-content h6,
.ss-slider .slide-content .button,
#portfolio-items-filter a { color: #ffffff; }

.tabs-nav li a { text-shadow: 0 1px 0 #ffffff; }

.tabs-nav li.active a { border-bottom-color: #ffffff; }

.ss-slider .slide-button, .no-js .ss-slider .slide-button:hover {
-webkit-box-shadow: 1px 0 0 #ffffff inset, 0 1px 0 0 #ffffff inset;
   -moz-box-shadow: 1px 0 0 #ffffff inset, 0 1px 0 0 #ffffff inset;
        box-shadow: 1px 0 0 #ffffff inset, 0 1px 0 0 #ffffff inset;
}

.ss-slider .slide:first-child .slide-button {
-webkit-box-shadow: 0 1px 0 0 #ffffff inset;
   -moz-box-shadow: 0 1px 0 0 #ffffff inset;
        box-shadow: 0 1px 0 0 #ffffff inset;
}

@media only screen and (max-width: 767px) { .ss-slider.fully-loaded, .ss-slider.fully-loaded .slide-images-container { background-color: #ffffff; } }

/* Background (rgb) */
.single-image .zoom, .image-gallery .zoom, .iframe .zoom,
.no-js .single-image:before, .no-js .image-gallery:before, .no-js .iframe:before {
	background: rgb(255,255,255);
	background: rgba(255,255,255, 0.4);
}


/* Main heading font*/
h1, h2, h3, h4, h5, h6,
.button, input[type="submit"], input[type="reset"], button,
.dropcap,
label, input, textarea, select,
#main-nav a,
.ss-slider .slide-button h5,
.projects-carousel, #portfolio-items,
.entry-meta { font-family: "Open Sans", "Helvetica Neue", Arial, Helvetica, sans-serif; }

#main-nav ul ul a, .entry-form label { font-family: "Helvetica Neue", Arial, Helvetica, sans-serif; }

@media only screen and (max-width: 959px) { .extended-pricing-table .features li:before { font-family: "Open Sans", "Helvetica Neue", Arial, Helvetica, sans-serif; } }

/* Blockquote font */
blockquote { font-family: "PT Serif", "Helvetica Neue", Arial, Helvetica, sans-serif; }

/* Color scheme (hex) */
.button, input[type="submit"], input[type="reset"], button,
.not-ie #main-nav .current_page_item:after, .not-ie #main-nav .current_page_parent:after, .not-ie #main-nav .current-menu-item:after,
#main-nav ul ul a:hover, #main-nav ul ul .hover > a,
#main-nav ul ul .current_page_item > a, #main-nav ul ul .current_page_item > a:hover,
#main-nav ul ul .current_page_parent > a, #main-nav ul ul .current_page_parent > a:hover,
#main-nav ul ul .current-menu-item > a, #main-nav ul ul .current-menu-item > a:hover,
.ss-slider .active-slide-bar,
.not-ie .projects-carousel a:hover:after, #portfolio-items > article:hover:after,
.not-ie .team-member:hover:after,
#portfolio-items-filter a  { background: #0CB0CF; }

a:hover, a > *:hover,
.button.no-bg:hover,
#main-nav a:hover, #main-nav .hover > a,
#main-nav .current_page_item > a, #main-nav .current_page_parent > a, #main-nav .current-menu-item > a,
.acc-trigger a:hover, .acc-trigger.active a, .acc-trigger.active a:hover,
.tabs-nav li a:hover, .tabs-nav li.active a,
.ss-slider .slide-button:hover, .ss-slider.fully-loaded .slide-button.active,
.ss-slider.fully-loaded .slide-button.active h5,
.ss-slider .slide-content a,
.projects-carousel a:hover .title, #portfolio-items > article:hover .title,
.entry-meta a:hover, .entry-meta a:hover time,
a:hover > .post-format,
.comment .author a:hover,
.comment .date a:hover, .comment .date a:hover time,
.pagination a:hover, .comments-pagination a:hover,
.single-portfolio .page-header a:hover,
.widget li a:hover,
#sidebar .tweets-feed li a, #footer .tweets-feed li a,
#footer a:hover, #footer-bottom a:hover  { color: rgba(13,176,207,0.91); }

.button:hover .arrow,
#back-to-top:hover, .touch-device #back-to-top:active,
.jcarousel-next:hover, .jcarousel-next:focus, .jcarousel-next:active,
.jcarousel-prev:hover, .jcarousel-prev:focus, .jcarousel-prev:active,
.not-ie .projects-carousel a:hover:after, .not-ie #portfolio-items > article:hover:after,
a:hover > .post-format { background-color: #303030; }

#main-nav a:hover, #main-nav .hover > a,
#main-nav .current_page_item > a, #main-nav .current_page_parent > a, #main-nav .current-menu-item > a,
.projects-carousel a:hover, #portfolio-items > article:hover,
.team-member:hover  { border-bottom-color: #303030; }

#main-nav a:hover, #main-nav .hover > a,
#main-nav .current_page_item > a, #main-nav .current_page_parent > a, #main-nav .current-menu-item > a,
.tabs-nav li.active a { border-top-color: #303030; }

@media only screen and (max-width: 959px) { .ss-slider.fully-loaded .slide-button.active { border-top-color: #303030; } }
@media only screen and (max-width: 767px) { #main-nav > ul > .current:last-child a { border-bottom-color: #303030; } }

/* Color scheme (rgb) */
.image-gallery-slider-nav a, .ss-slider .pagination-container a {
		background-color: rgba(48,48,48, 0.6);}

.image-gallery-slider-nav a:hover, .image-gallery-slider-nav a:active,
.ss-slider .pagination-container a:hover, .ss-slider.show-content-onhover:hover .pagination-container a:hover {
		background-color: rgba(48,48,48, 1);}

@media only screen and (max-width: 767px) {
	.ss-slider .pagination-container a, .ss-slider .pagination-container a:hover {
				background-color: rgba(48,48,48, 0.6);	}
}

#search {

}

#search input[type="text"] {
    background: url(https://www.victory.com/assets/v6/img/search_icon.png) 10px center no-repeat;
    border: 1px solid #D2D2D2;
    font: 12px Arial,Helvetica,Sans-serif;
    color: #868686;
    width: 120px;
    padding: 1px 15px 1px 45px;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    /*text-shadow: 0 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
    -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px rgba(0, 0, 0, 0.2) inset;*/
    -webkit-transition: all 0.7s ease 0s;
    -moz-transition: all 0.7s ease 0s;
    -o-transition: all 0.7s ease 0s;
    transition: all 0.7s ease 0s;
    }

#search input[type="text"]:focus {
    width: 170px;
    }
	
/* all styles under here need to be added to the css*/
		#footer #footer-nav {
			font-size: 12px;
			font-family: Helvetica, Arial, sans-serif;
			line-height: 2;
			padding: 10px 0 20px;
			text-decoration: none;
		}
		
		#footer #footer-nav dd {
			font-size:10px;
		}
		
		#footer #footer-nav dt, #footer #footer-nav dd {
			padding-left: 10px;
		}
		
		#footer #footer-nav dt {
			font-weight: bold;
			border-left: 2px solid #0cb0cf;
		}
		
		#footer #footer-nav dd, #footer #footer-nav a {
			text-decoration: none;
			color:#868686;
		}
		
		#footer #footer-nav dd, #footer #footer-nav a:hover {
			color:#0CB0CF;
		}
		
		
		/* gridframework */
		#footer #footer-nav dl, #footer #footer-nav .row {position:relative; margin-left:-20px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_1 .row {width: 140px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_2 .row {width: 360px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_3 .row {width: 540px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_4 .row {width: 720px;}
		
		#footer #footer-nav dl, #footer #footer-nav .col {margin-left:20px; padding-left:10px; float:left; position:relative;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_1{width: 120px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_2{width: 340px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_3{width: 520px;}
		#footer #footer-nav dl, #footer #footer-nav .footer-grid_4{width: 700px;}		
		
</style>    
	 
</head>
								
<body class="home page page-id-4 page-template-default">
<div id="login_container">
<div class="donate login-btn">
            <div class="next_live">
                <a href="https://www.victory.com/give">Donate</a>
            </div><!--end next_live-->
    </div><!--end donate-->
    
    <div class="login login-btn">
            <div class="next_live">
        	  <div>
          	<a href="https://www.victory.com/login">Login</a>
          </div>
        </div><!--end next_live-->
    </div><!--end login-->

	<!--<div class="login login-btn">
            <div class="next_live">
                
                <a href="https://www.victory.com/login">Login</a>            </div><!--end next_live-->
    <!--</div><!--end login-->
    
    
    
    <div id="churchonline_counter">
		<div class="live"><a href="http://victorytulsa.churchonline.org">Live Now!</a></div>
	<ul class="time">
		<li class="next_live"><span class="title"></span></li>
		<li><span class="days"></span> <span class="label">Days</span></li>
		<li><span class="hours"></span> <span class="label">Hrs</span></li>
		<li><span class="minutes"></span> <span class="label">Min</span></li>
		<li><span class="seconds"></span> <span class="label">Secs</span></li>
	</ul>
</div><!--end churchonline_counter-->
</div><!--end login_container-->

<header id="header" class="container clearfix">
	
	<a href="https://www.victory.com/" id="logo" title="Victory.com">
					<img src="https://www.victory.com/assets/v6/img/vcc-web-logo-ret.png" alt="Victory.com" height="36px" width="178px">
			</a>
            
<nav id="main-nav">

<ul id="menu-main-menu" class="menu">

<li class="menu-item current-menu-item"><a href="https://www.victory.com/" target="_parent">Home</a>

    	<ul class="sub-menu">
							            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/events" target="_parent">Events</a>

    	<ul class="sub-menu">
							            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/get-involved/volunteer" target="_parent">Get Involved</a>

    	<ul class="sub-menu">
							            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/get-involved/volunteer" target="_parent">Volunteer</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/get-involved/volunteer#connect" target="_parent">Connect Groups</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/contact" target="_parent">Contact Us</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/new" target="_parent">New to Victory?</a>

    	<ul class="sub-menu">
							            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/who-we-are" target="_parent">About</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/watch/foundations" target="_parent">Foundations</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/ministries/care" target="_parent">Help & Care</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/about/pastors" target="_parent">Our Pastors</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/" target="_parent">Ministries</a>

    	<ul class="sub-menu">
							            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/" target="_parent">Kids/Youth</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/ministries/victory-kidz" target="_parent">Victory Kids (6wk-5th)</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/247" target="_parent">24-7 Youth (13-18)</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/" target="_parent">Adult Life</a>
                    
                    <ul class="sub-menu">
                    						                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/IIID" target="_parent">3D Young Adults (18-29)</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/ministries/singles" target="_parent">Singles (29+)</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/ministries/men" target="_parent">Men</a></li>
                        						                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/ministries/women" target="_parent">Women</a></li>
                        						                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/ministries/keenagers" target="_parent">Keenagers (66+)</a></li>
                        						                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/" target="_parent">Local Outreach</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/outreach/bus-minstry/vk-bus" target="_parent">Community Outreach</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="http://www.tulsadreamcenter.org/" target="_blank">Dream Center</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/ministries/international-connect-ministry/about" target="_parent">International</a></li>
                        						                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/jobs" target="_parent">Jobs</a></li>
                        						                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/" target="_parent">Global Outreach</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/missions/world-missions/outreaches" target="_parent">World Missions</a></li>
                        						                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/missions/vtm" target="_parent">Teen Missions</a></li>
                        						                							                							                							                							                							                							                							                                                    <li class="menu-item"><a href="https://www.victory.com/missions/homes-for-haiti" target="_parent">Homes for Haiti</a></li>
                        						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				                    <li class="menu-item"><a href="https://www.victory.com/outreach/fellowship-of-ministries" target="_parent">V.F.M.</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				                    <li class="menu-item"><a href="http://www.victory.com/campvictory" target="_blank">Camp Victory</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/" target="_parent">Schools</a>

    	<ul class="sub-menu">
							            				                    <li class="menu-item"><a href="https://www.victory.com/kidscare" target="_parent">Day Care</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="http://www.vcstulsa.org/" target="_blank">Victory Christian School</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				                    <li class="menu-item"><a href="http://www.vbitulsa.com" target="_blank">Victory Bible Institute</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				                    <li class="menu-item"><a href="http://www.vbitulsa.com/programs/in-ministry-training/" target="_blank">In Ministry Training</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/missions/vwmtc" target="_parent">Missions Training</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/outreach/ivbi" target="_parent">International VBI</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/" target="_parent">Media</a>

    	<ul class="sub-menu">
							            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/watch" target="_parent">Victory TV</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="http://victorytulsa.churchonline.org/" target="_blank">Online Church</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				            				            				            				            				            				                    <li class="menu-item"><a href="https://itunes.apple.com/us/podcast/victory-tulsa/id596194747?mt=2" target="_blank">Podcasts</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				            				                    <li class="menu-item"><a href="https://www.victory.com/store" target="_parent">Online Store</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				            				                    <li class="menu-item"><a href="http://www.360life.tv/" target="_blank">360 Degree Life</a>
                    
                    <ul class="sub-menu">
                    						                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                							                	                    </ul>
                    
                    </li>
                            				            				            				            				                    </ul>
    
</li>
<li class="menu-item"><a href="https://www.victory.com/media/resources" target="_parent">Resources</a>

    	<ul class="sub-menu">
							            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				            				                    </ul>
    
</li>

</ul>

	<!--<select class="responsive-nav"><option value="" selected="">Navigate...</option><option value="https://www.victory.com/"> Home</option><option value="https://www.victory.com/events/"> Events</option><option value="#"> Get Involved</option><option value="https://www.victory.com/connect-groups/"> -  Connect Groups</option><option value="https://www.victory.com/volunteer/"> -  Volunteer</option><option value="https://www.victory.com/prayer/"> -  Prayer</option><option value="https://www.victory.com/contact-2/"> -  Contact</option><option value="https://www.victory.com/new/"> NEW TO VICTORY?</option><option value="https://www.victory.com/about/"> -  About</option><option value="https://www.victory.com/our-pastor-2/"> -  Our Pastor</option><option value="https://www.victory.com/beliefs/"> -  Beliefs</option><option value="#"> MINISTRIES</option><option value="#"> -  Kids/Teens</option><option value="https://www.victory.com/nursery/"> -  -  Nursery</option><option value="https://www.victory.com/mothers-day-out/"> -  -  Mother’s Day Out</option><option value="https://www.victory.com/childrens-church-6-12/"> -  -  Children’s Church (6-12)</option><option value="https://www.victory.com/kids-care/"> -  -  Kids Care</option><option value="https://www.victory.com/24-7-youth-13-18/"> -  -  24-7 Youth (13-18)</option><option value="#"> -  Adult Life</option><option value="https://www.victory.com/iiid/"> -  -  3D Young Adults (18-29)</option><option value="https://www.victory.com/singles-29/"> -  -  Singles (29+)</option><option value="https://www.victory.com/single-parents/"> -  -  Single Parents</option><option value="https://www.victory.com/men/"> -  -  Men</option><option value="https://www.victory.com/women/"> -  -  Women</option><option value="https://www.victory.com/married-couples/"> -  -  Married Couples</option><option value="https://www.victory.com/keenagers-66/"> -  -  Keenagers (66+)</option><option value="https://www.victory.com/vmo/"> -  -  Victory Marketplace Outreach</option><option value="https://www.victory.com/prayer/"> -  -  Prayer</option><option value="#"> -  Outreaches</option><option value="https://www.victory.com/mobile-kids-club/"> -  -  Victory Kids Outreach</option><option value="https://www.victory.com/chosen/"> -  -  Chosen</option><option value="https://www.victory.com/camp-victory/"> -  -  Camp Victory</option><option value="https://www.victory.com/dream-center/"> -  -  Dream Center</option><option value="https://www.victory.com/vfm/"> -  -  Victory Fellowship Ministries</option><option value="https://www.victory.com/international/"> -  -  International</option><option value="https://www.victory.com/missions/"> -  Missions</option><option value="https://www.victory.com/world-missions/"> -  -  World Missions</option><option value="https://www.victory.com/teen-missions/"> -  -  Teen Missions</option><option value="https://www.victory.com/homes-for-haiti/"> -  -  Homes for Haiti</option><option value="#"> MEDIA</option><option value="https://www.victory.com/bulletin/"> -  Bulletin</option><option value="https://www.victory.com/podcasts/"> -  Podcasts</option><option value="https://www.victory.com/online-church/"> -  Online Church</option><option value="https://www.victory.com/watch/"> -  Watch</option><option value="#"> RESOURCES</option><option value="https://www.victory.com/connect-lessons/"> -  Connect Lessons</option><option value="https://www.victory.com/confessions/"> -  Confessions</option><option value="https://www.victory.com/bible-reading-plan/"> -  Bible Reading Plan</option><option value="https://www.victory.com/foundations/"> -  Foundations</option><option value="https://www.victory.com/fasting/"> -  Fasting</option><option value="https://www.victory.com/stewardship-services/"> -  Stewardship Services</option><option value="https://www.victory.com/online-store/"> -  Online Store</option><option value="http://www.360life.tv/"> -  360 Degree Life</option><option value="#"> SCHOOLS</option><option value="http://www.vcstulsa.org/"> -  Victory Christian School</option><option value="http://www.vbitulsa.com/"> -  Victory Bible Institute</option><option value="https://www.victory.com/in-ministry-training/"> -  In Ministry Training</option><option value="https://www.victory.com/vwmtc/"> -  World Missions Training Center</option><option value="https://www.victory.com/international-vbi/"> -  International VBI</option></select>-->
	</nav><!-- end #main-nav -->
	
</header><!-- end #header -->
<section id="content" class="clearfix " style="min-height: 414px; ">

	<div class="container">

<section class="slider">
        <div class="flexslider">
          <ul class="slides">
          	   <li>
  	    	      <a href="wex.victory.com"><img src="https://www.victory.com/assets/v6/img/slider-images/wex13-vcc-web.jpg" /></a>
  	    	   </li>
          	   <li>
  	    	      <img src="https://www.victory.com/assets/v6/img/slider-images/services-banner.jpg" />
  	    	   </li>
          	   <li>
  	    	      <a href="https://www.victory.com/watch/vij"><img src="https://www.victory.com/assets/v6/img/slider-images/victorytv-slider.jpg" /></a>
  	    	   </li>
  	    		<!--<li>
  	    	    <img src="https://www.victory.com/assets/v6/img/slider-images/welcome-slider.jpg" />
  	    		</li>-->
          </ul>
        </div>
</section>

   
<div class="one-third">
<a href="https://www.victory.com/connect/about-victory/new-to-victory"><img class="home-img" src="https://www.victory.com/assets/v6/img/home/welcome-thumb.jpg" width="300px" height="188px" /></a>
<div class="home-thumb">
&nbsp;
<h2>New to Victory?</h2><p>Learn more about Victory and where we came from. Also find a list of our beliefs and vision statement.</p>
<p><a class="button" href="https://www.victory.com/connect/about-victory/new-to-victory">More Info</a></p></div>
</div><!--end one-third-->

<div class="one-third">
<a href="https://www.victory.com/connect/get-involved/connect-groups"><img class="home-img" src="https://www.victory.com/assets/v6/img/home/get-involved-thumb1.jpg" width="300px" height="188px" /></a>
<div class="home-thumb">
&nbsp;
<h2>Get Involved</h2><p>Volunteering is a great way to meet people, grow, and feel like part of the family. Find an area that fits you best.</p>
<p><a class="button" href="https://www.victory.com/connect/get-involved/connect-groups">More Info</a></p></div>
</div><!--end one-third-->

<div class="one-third last">
<a href="https://www.victory.com/watch/vij"><img class="home-img" src="https://www.victory.com/assets/v6/img/home/watch-thumb1.jpg" width="300px" height="188px" /></a>
<div class="home-thumb">
&nbsp;
<h2>Watch Online</h2><p style="text-align:center">Missed a service or out of town? Don't worry we've got live streaming and an online video archive.</p><p><a class="button" href="https://www.victory.com/watch/vij">More Info</a></p></div>
</div><!--end one-third-->

<div class="clear"></div>

    
	</div><!-- end .container -->
	
</section><!-- end #content --><footer id="footer" class="clearfix">

		<div class="container">

			<div class="one-third aligncenter">
            <img src="https://www.victory.com/assets/v6/img/vcc-web-logo-ret.png" alt="Victory.com" height="36px" width="178px">
	           			
			<div id="text-20" class="widget widget_text"><span style="font-weight:bold;">Services</span><div style="font-size:11px;">Saturday 5pm<br>Sunday 9am 11am &amp; 6pm<br>
Wednesday 7pm</div>
			</div>

        <form method="post" action="https://www.victory.com/search" id="search">
                <input title="Press enter to submit" type="text" name="q" value="Search Victory.com" id="search" 
                onblur="if(value=='') value = 'Search Victory.com'" 
                onfocus="if(value=='Search Victory.com') value = ''"
                />
                <!--<input type="submit" name="search" value="Search" />-->
        	</form>
		
			</div><!-- end .one-fourth -->
			
			<div class="two-third last">
            	<div class="aligncenter">
            		<ul class="social-footer">
	            		<li><a href="http://facebook.com/victorytulsa" title="Facebook"><img src="https://www.victory.com/assets/v6/img/social-icons/facebook-icon.png" width="35px" height="35px"></a></li>
	            		<li><a href="http://twitter.com/victorytulsa" title="Twitter"><img src="https://www.victory.com/assets/v6/img/social-icons/twitter-icon.png" width="35px" height="35px"></a></li>
	            		<li><a href="http://instagram.com/victorytulsa" title="Instagram"><img src="https://www.victory.com/assets/v6/img/social-icons/instagram-icon.png" width="35px" height="35px"></a></li>
	            		<li><a href="http://vimeo.com/victorytulsa" title="Vimeo"><img src="https://www.victory.com/assets/v6/img/social-icons/vimeo-icon.png" width="35px" height="35px"></a></li>
	            		
	            		<li><a href="https://itunes.apple.com/us/podcast/victory-tulsa/id596194747?mt=2" title="Podcasts"><img src="https://www.victory.com/assets/v6/img/social-icons/podcast-icon.png" width="35px" height="35px"></a></li>
	            		
	            		<li><a href="http://open.spotify.com/user/1224674094/playlist/3WGOdBL2QvG9xKxNSqMHu7" target="_blank" title="Spotify Playlist"><img src="https://www.victory.com/assets/v6/img/social-icons/spotify-icon.png" width="35px" height="35px"></a></li>
            		</ul>
            	</div>
            <div id="footer-nav">
            
			                                                                                                                                                                        <dl class="footer-grid_1">
            <dt><a href="https://www.victory.com/get-involved/volunteer" target="_parent">Get Involved</a></dt>
            
                                                                            <dd><a href="https://www.victory.com/get-involved/volunteer" target="_parent">Volunteer</a></dd>
                                                                                                                                                    <dd><a href="https://www.victory.com/get-involved/volunteer#connect" target="_parent">Connect Groups</a></dd>
                                                                                                                                                                                                            <dd><a href="https://www.victory.com/contact" target="_parent">Contact Us</a></dd>
                                                                                                                                                                                    
            </dl>
                                                                                                                                                                        <dl class="footer-grid_1">
            <dt><a href="https://www.victory.com/new" target="_parent">New to Victory?</a></dt>
            
                                                                                                                                    <dd><a href="https://www.victory.com/who-we-are" target="_parent">About</a></dd>
                                                                                                                                                    <dd><a href="https://www.victory.com/watch/foundations" target="_parent">Foundations</a></dd>
                                                                                                                                                                                                                                        <dd><a href="https://www.victory.com/about/pastors" target="_parent">Our Pastors</a></dd>
                                                                                                
            </dl>
                                                                                                <dl class="footer-grid_1">
            <dt><a href="https://www.victory.com/" target="_parent">Schools</a></dt>
            
                                                <dd><a href="http://www.vcstulsa.org/" target="_blank">Victory Christian School</a></dd>
                                                                                                                                                    <dd><a href="http://www.vbitulsa.com" target="_blank">Victory Bible Institute</a></dd>
                                                                                                                                                                                                            <dd><a href="https://www.victory.com/missions/vwmtc" target="_parent">Missions Training</a></dd>
                                                                                                                                                                                                                
            </dl>
                                                <dl class="footer-grid_1">
            <dt><a href="https://www.victory.com/" target="_parent">Media</a></dt>
            
                                                                                                        <dd><a href="https://www.victory.com/watch" target="_parent">Victory TV</a></dd>
                                                                                                                                                                                                            <dd><a href="http://victorytulsa.churchonline.org/" target="_blank">Online Church</a></dd>
                                                                <dd><a href="https://itunes.apple.com/us/podcast/victory-tulsa/id596194747?mt=2" target="_blank">Podcasts</a></dd>
                                                                                                                                                    <dd><a href="https://www.victory.com/store" target="_parent">Online Store</a></dd>
                                                                                                                            
            </dl>
                                    
            <div class="clearfix"></div>
            </div><!--footer-nav end-->

			</div><!-- end .three-fourth -->
			
		</div><!-- end .container -->

	</footer><!-- end #footer -->



	<footer id="footer-bottom" class="clearfix">

		<div class="container">

            
<ul>
<li>&copy; Copyright Victory 2013. All Rights Reserved.</li>
<li><a href="http://goo.gl/maps/b7xUt">Location</a></li>
</ul>
		</div><!-- end .container -->

	</footer><!-- end #footer-bottom -->

<!-- JAVASCRIPT -->	
<!--<script type="text/javascript" src="./home_files/jquery.form.min.js"></script>-->
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/scripts.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.ui.widget.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/respond.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.easing-1.3.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.cycle.all.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.smartStartSlider.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/audioplayerv1.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="https://www.victory.com/assets/v6/js/custom.js"></script>

  <!-- FlexSlider -->
  <script defer src="https://www.victory.com/assets/v6/js/jquery.flexslider.js"></script>
  <script src="https://www.victory.com/assets/v6/js/jquery.fittext.js"></script>
	<script type="text/javascript">
		$(".responsive_header").fitText(1);
	</script>
  <script type="text/javascript">
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
  
  <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-31877244-1']);
  _gaq.push(['_setDomainName', 'victory.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- END JAVASCRIPT -->	

<a href="https://www.victory.com/#" id="back-to-top" title="Back to Top">Back to Top</a></body></html>