<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sales1.aspx.cs" Inherits="bramhacorp.sales1" %> 
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Bhumi World</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" id="metaViewport" content="user-scalable=no, initial-scale=1, width=device-width, viewport-fit=cover" data-tdv-general-scale="0.5"/>
    <link rel="preload" href="locale/en.txt?v=1617202466353" as="fetch" crossorigin="anonymous"/>
	<link rel="preload" href="script.js?v=1617202466353" as="script"/>
	<link rel="preload" href="media/panorama_AA943F34_EDC2_D8DD_41D1_528D24091156_0/r/3/0_0.jpg?v=1617202466353" as="image"/>
	<link rel="preload" href="media/panorama_AA943F34_EDC2_D8DD_41D1_528D24091156_0/l/3/0_0.jpg?v=1617202466353" as="image"/>
	<link rel="preload" href="media/panorama_AA943F34_EDC2_D8DD_41D1_528D24091156_0/u/3/0_0.jpg?v=1617202466353" as="image"/>
	<link rel="preload" href="media/panorama_AA943F34_EDC2_D8DD_41D1_528D24091156_0/d/3/0_0.jpg?v=1617202466353" as="image"/>
	<link rel="preload" href="media/panorama_AA943F34_EDC2_D8DD_41D1_528D24091156_0/f/3/0_0.jpg?v=1617202466353" as="image"/>
	<link rel="preload" href="media/panorama_AA943F34_EDC2_D8DD_41D1_528D24091156_0/b/3/0_0.jpg?v=1617202466353" as="image"/>
	<script>(function (i, s, o, g, r, a, m) { i["GoogleAnalyticsObject"] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) })(window, document, "script", "//www.google-analytics.com/analytics.js", "ga"); window["ga-disable-UA-190621997-1"] = true; ga("create", "UA-190621997-1", "auto"); ga("set", "anonymizeIp", true);</script>
	<meta name="description" content="Virtual Tour"/>
	<meta name="theme-color" content="#000000"/>
    <script src="lib/tdvplayer.js?v=1617202466353"></script>
    <script src="script.js?v=1617202466353"></script>
    <script type="text/javascript">
        var tour;
        var devicesUrl = { "general": "script_general.js?v=1617202466353" };

        (function () {
            var deviceType = ['general'];
            if (TDV.PlayerAPI.mobile)
                deviceType.unshift('mobile');
            if (TDV.PlayerAPI.device == TDV.PlayerAPI.DEVICE_IPAD)
                deviceType.unshift('ipad');
            var url;
            for (var i = 0; i < deviceType.length; ++i) {
                var d = deviceType[i];
                if (d in devicesUrl) {
                    url = devicesUrl[d];
                    break;
                }
            }
            if (typeof url == "object") {
                var orient = TDV.PlayerAPI.getOrientation();
                if (orient in url) {
                    url = url[orient];
                }
            }
            var link = document.createElement('link');
            link.rel = 'preload';
            link.href = url;
            link.as = 'script';
            var el = document.getElementsByTagName('script')[0];
            el.parentNode.insertBefore(link, el);
        })();

        function loadTour() {
            if (tour) return;

            var settings = new TDV.PlayerSettings();
            settings.set(TDV.PlayerSettings.CONTAINER, document.getElementById('viewer'));
            settings.set(TDV.PlayerSettings.WEBVR_POLYFILL_URL, 'lib/WebVRPolyfill.js?v=1617202466353');
            settings.set(TDV.PlayerSettings.HLS_URL, 'lib/Hls.js?v=1617202466353');
            settings.set(TDV.PlayerSettings.QUERY_STRING_PARAMETERS, 'v=1617202466353');

            tour = new TDV.Tour(settings, devicesUrl);
            tour.bind(TDV.Tour.EVENT_TOUR_INITIALIZED, onVirtualTourInit);
            tour.bind(TDV.Tour.EVENT_TOUR_LOADED, onVirtualTourLoaded);
            tour.bind(TDV.Tour.EVENT_TOUR_ENDED, onVirtualTourEnded);
            tour.load();
        }

        function pauseTour() {
            if (!tour)
                return;

            tour.pause();
        }

        function resumeTour() {
            if (!tour)
                return;

            tour.resume();
        }

        function onVirtualTourInit() {
            var updateTexts = function () {
                document.title = this.trans("tour.name")
            };

            tour.locManager.bind(TDV.Tour.LocaleManager.EVENT_LOCALE_CHANGED, updateTexts.bind(tour.locManager));

            if (tour.player.cookiesEnabled)
                enableCookies();
            else
                tour.player.bind('enableCookies', enableCookies);
        }

        function onVirtualTourLoaded() {
            disposePreloader();
        }

        function onVirtualTourEnded() {

        }

        function enableCookies() {
            window["ga-disable-UA-190621997-1"] = false;
            ga("send", "pageview");
        }

        function setMediaByIndex(index) {
            if (!tour)
                return;

            tour.setMediaByIndex(index);
        }

        function setMediaByName(name) {
            if (!tour)
                return;

            tour.setMediaByName(name);
        }

        function showPreloader() {
            var preloadContainer = document.getElementById('preloadContainer');
            if (preloadContainer != undefined)
                preloadContainer.style.opacity = 1;
        }

        function disposePreloader() {
            var preloadContainer = document.getElementById('preloadContainer');
            if (preloadContainer == undefined)
                return;

            var transitionEndName = transitionEndEventName();
            if (transitionEndName) {
                preloadContainer.addEventListener(transitionEndName, hide, false);
                preloadContainer.style.opacity = 0;
                setTimeout(hide, 500); //Force hide. Some cases the transitionend event isn't dispatched with an iFrame.
            }
            else {
                hide();
            }

            function hide() {

                preloadContainer.style.visibility = 'hidden';
                preloadContainer.style.display = 'none';
                var videoList = preloadContainer.getElementsByTagName("video");
                for (var i = 0; i < videoList.length; ++i) {
                    var video = videoList[i];
                    video.pause();
                    while (video.children.length)
                        video.removeChild(video.children[0]);
                }
            }

            function transitionEndEventName() {
                var el = document.createElement('div');
                var transitions = {
                    'transition': 'transitionend',
                    'OTransition': 'otransitionend',
                    'MozTransition': 'transitionend',
                    'WebkitTransition': 'webkitTransitionEnd'
                };

                var t;
                for (t in transitions) {
                    if (el.style[t] !== undefined) {
                        return transitions[t];
                    }
                }

                return undefined;
            }
        }

        function onBodyClick() {
            document.body.removeEventListener("click", onBodyClick);
            document.body.removeEventListener("touchend", onBodyClick);

        }

        function onLoad() {
            if (/AppleWebKit/.test(navigator.userAgent) && /Mobile\/\w+/.test(navigator.userAgent)) {
                var inIFrame = false;
                try {
                    inIFrame = (window.self !== window.top);
                }
                catch (e) {
                    inIFrame = true;
                }
                if (!inIFrame) {
                    var onResize = function (async) {
                        [0, 250, 1000, 2000].forEach(function (delay) {
                            setTimeout(function () {
                                var viewer = document.querySelector('#viewer');
                                var scale = window.innerWidth / document.documentElement.clientWidth;
                                var width = document.documentElement.clientWidth;
                                var height = Math.round(window.innerHeight / scale);
                                viewer.style.width = width + 'px';
                                viewer.style.height = height + 'px';
                                viewer.style.left = Math.round((window.innerWidth - width) * 0.5) + 'px';
                                viewer.style.top = Math.round((window.innerHeight - height) * 0.5) + 'px';
                                viewer.style.transform = 'scale(' + scale + ', ' + scale + ')';
                                window.scrollTo(0, 0);
                            }, delay);
                        });
                    };
                    var onTouchEnd = function () {
                        document.body.removeEventListener("touchend", onTouchEnd);
                        clearInterval(resizeIntervalId);
                        onResize();
                        if (/CriOS/.test(navigator.userAgent))
                            setInterval(onResize, 4000);
                    };
                    document.body.addEventListener("touchend", onTouchEnd);
                    var resizeIntervalId = setInterval(onResize, 300);
                    window.addEventListener('resize', onResize);
                    onResize();
                }
            }

            var params = getParams(location.search.substr(1));
            if (params.hasOwnProperty("skip-loading")) {
                loadTour();
                disposePreloader();
                return;
            }

            if (isOVRWeb()) {
                showPreloader();
                loadTour();
                return;
            }

            showPreloader();
            loadTour();
        }

        function playVideo(video) {
            function isSafariDesktopV11orGreater() {
                return /^((?!chrome|android|crios|ipad|iphone).)*safari/i.test(navigator.userAgent) && parseFloat(/Version\/([0-9]+\.[0-9]+)/i.exec(navigator.userAgent)[1]) >= 11;
            }

            function hasAudio(video) {
                return video.mozHasAudio ||
                    Boolean(video.webkitAudioDecodedByteCount) ||
                    Boolean(video.audioTracks && video.audioTracks.length);
            }

            function detectUserAction() {
                var onVideoClick = function (e) {
                    if (video.paused) {
                        video.play();
                    }
                    video.muted = false;
                    if (hasAudio(video)) {
                        e.stopPropagation();
                        e.stopImmediatePropagation();
                        e.preventDefault();
                    }

                    video.removeEventListener('click', onVideoClick);
                    video.removeEventListener('touchend', onVideoClick);
                };
                video.addEventListener("click", onVideoClick);
                video.addEventListener("touchend", onVideoClick);
            }

            if (isSafariDesktopV11orGreater()) {
                video.muted = true;
                video.play();
            } else {
                var canPlay = true;
                var promise = video.play();
                if (promise) {
                    promise.catch(function () {
                        video.muted = true;
                        video.play();
                        detectUserAction();
                    });
                } else {
                    canPlay = false;
                }

                if (!canPlay || video.muted) {
                    detectUserAction();
                }
            }
        }

        function isOVRWeb() {
            return window.location.hash.substring(1).split('&').indexOf('ovrweb') > -1;
        }

        function getParams(params) {
            var queryDict = {}; params.split("&").forEach(function (item) { var k = item.split("=")[0], v = decodeURIComponent(item.split("=")[1]); queryDict[k.toLowerCase()] = v });
            return queryDict;
        }

        document.addEventListener('DOMContentLoaded', onLoad);
    </script>
    <style type="text/css">
        html, body { width: 100%; height: 100%; margin: 0; padding: 0; padding: env(safe-area-inset-top) env(safe-area-inset-right) env(safe-area-inset-bottom) env(safe-area-inset-left); }

        #viewer { z-index:1; position:absolute; width: 100%; height: 100%; top: 0; }
        #preloadContainer { z-index:2; position:relative; width:100%; height:100%; opacity:0; background-color:rgba(0,0,0,1); transition: opacity 0.5s; -webkit-transition: opacity 0.5s; -moz-transition: opacity 0.5s; -o-transition: opacity 0.5s;}
    </style>
    <link rel="stylesheet" href="fonts.css?v=1617202466353">



    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="master.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <style type="text/css">
        /* close button*/
        .szlT0Q-5ko1Oc38i5nSTg .window button.close svg.close path
        {
            fill: transparent;
            stroke: black;
            stroke-linecap: round;
            stroke-width: 10;
        }
        /*right video*/
        ._3GLTSUMmisAV9UtE48vgAx
        {
            max-height: calc(100% - 10px);
            overflow-y: auto;
            padding: 5px;
            position: absolute;
            right: 15px;
            top: 13%;
        }
        /* ._31XmcsCF8_lRFsUEwGhUJV
        {
            top:0px !important;
            right:0px !important;
        }*/
        
        /*Calling*/
        ._31XmcsCF8_lRFsUEwGhUJV.initial
        {
                top: 3px !important; 
    
        }
        /*Calling Host*/
        ._1j1_nth99EBR23OceijLZh.initial
        {
            
            top: 3px !important; 
        }
        /*Calling Inside Host*/
        ._3Z7UjNgQXFKQDiq4Wyzrbn
        {
            left: auto !important;
            top: auto !important;
            padding: 0 calc(1.5 * var(--tdvvmin)) 0 calc(2.25 * var(--tdvvmin));
            position: relative;
        }
        
        /*for host & Slave */
        ._1j1_nth99EBR23OceijLZh.top-down
        {
        }
    </style>
</head>
<body style="background: #3e3e40;">
    <div id="preloadContainer"><div style="z-index: 4; position: absolute; left: 0%; top: 50%; width: 100.00%; height: 10.00%"><div style="text-align:left; color:#000; "><DIV STYLE="text-align:center;font-size:1.6666666666666663vmin;"><SPAN STYLE="display:inline-block; letter-spacing:0vmin; white-space:pre-wrap;color:#777777;font-size:1.67vmin;font-family:Arial, Helvetica, sans-serif;">Loading virtual tour. Please wait...</SPAN></DIV></div></div></div>
    <div id="viewer"></div>
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <div class="menuoverlay" style="display: none;">
    </div>
    <asp:LinkButton ID="lnklogoutbtn" OnClick="lnklogout_Click" class="float" Style="border: none;
        cursor: pointer;" runat="server">
<img src="images/logout.png" class="floatimg" />
    </asp:LinkButton>
    <div class="open" style="display: none;">
        <span class="cls"></span><span>
            <ul class="sub-menu ">
                <li><a data-toggle="modal" data-target="#myModal" title="Book Now">
                    <div style="display: block; line-height: 10px; font-size: 11px; color: #a69ca8">
                        Step 1</div>
                    Book Now</a> </li>
                <li style="margin-top: 5px;">
                    <asp:LinkButton ID="LinkButton2" OnClick="lnklogout_Click" Style="border: none; cursor: pointer;"
                        runat="server">
 <div style="display:block;line-height:10px;font-size:11px;color:#a69ca8">Step 2</div> Logout
                    </asp:LinkButton>
                </li>
            </ul>
        </span><span class="cls"></span>
    </div>
    <div style="position: fixed; width: 50px; height: 40px; top: 18px; left: 30px; right: 0;
        bottom: 0; /* background-color: rgba(255, 255, 255, 0.73); */
    z-index: 1; cursor: pointer; display: none">
        <img src="images/collection.png" style="width: 135px; opacity: 0.8">
    </div>
    <div style="position: fixed; top: 18px; right: 30px; bottom: 0; /* background-color: rgba(255, 255, 255, 0.73);
        */
    z-index: 1; cursor: pointer; display: none">
        <img src="loginscript/bramhasmall.png" style="width: 40px; opacity: 0.8">
    </div>
    <asp:UpdatePanel runat="server" ID="asfas">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <div class="preloader">
                        <img src="images/logo.png" class="preloadercss" style="width: 250px; position: fixed;
                            top: 40%; left: 50%; transform: translate(-50%, -50%); z-index: 11111; overflow: visible;" />
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <!-- Modal -->
            <div class="modal fade modalsmall102" id="myModal" role="dialog">
                <div class="modal-dialog modalsmall101" style="width: 97%; margin: 35px auto 0px auto;">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding: 0px;">
                            <button type="button" class="close" style="margin-top: -35px; font-size: 20px; background: #43a4f1;
                                color: white; border: none; opacity: 1; line-height: 15px; cursor: pointer; padding: 10px 10px;"
                                data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body" style="padding: 0px;">
                            <iframe id="iframeid" src="inventorytemp.aspx?uid=<%= Session["stringuid"].ToString()  %>"
                                frameborder="0" style="height: -webkit-fill-available; padding-bottom: 0.5%;
                                width: 100%; position: absolute; border: none; margin-top: -2px; margin-bottom: 0px;"
                                title="Bramhacorp Booking"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="lblusernamehidden" runat="server" />
    </form>
    <script src="logincss/script.js"></script>
    <%-- <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>--%>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script>

        $(document).ready(function () {
            $(document).delegate('.open', 'click', function (event) {
                $(this).addClass('oppenned');
                event.stopPropagation();
            })
            $(document).delegate('body', 'click', function (event) {
                $('.open').removeClass('oppenned');
            })
            $(document).delegate('.cls', 'click', function (event) {
                $('.open').removeClass('oppenned');
                event.stopPropagation();
            });
        });
    </script>
    <script>

        jQuery(document).ready(function ($) {
            $(window).load(function () {
                $('#preloader').fadeOut(500, function () {
                    $(this).remove();
                    var interval33 = setInterval(function () {
                        if ($("#18").length) {
                            if (document.getElementsByTagName("iframe")[0].src == "https://engage.bramhacorp.in/thecollection/login.aspx?v=1603096163932") {

                                var newsrc = "inventorytemp.aspx?uid=" + '<%= Session["stringuid"] %>';
                                $('#18 iframe').attr("src", newsrc);
                            }
                        }

                    }, 1000);
                    var interval33f = setInterval(function () {
                        if ($("#60").length) {
                            if (document.getElementsByTagName("iframe")[0].src == "https://engage.bramhacorp.in/thecollection/map.aspx?v=1603096163932") {

                                var newsrc = "map.aspx";
                                $('#60 iframe').attr("src", newsrc);
                            }
                        }
                    }, 1000);
                });

                //                $('#someButton').click(function () {
                //                    window.location.href = '/some/new/page';
                //                    return false;
                //                });

                $("#52").click(function () {
                    document.getElementById("lnklogoutbtn").click();
                    //                    $("#lnklogoutbtn").click(); 
                });
                //                $("#31 div div div").click(function () {
                //                    document.getElementById("lnklogoutbtn").click();
                //                });
                ////                $("#37").click(function () {
                ////                    document.getElementById("LinkButton1").click();
                ////                });

                var interval1 = setInterval(function () {



                    if ($("#v4").length) {
                        $('#v4 .name').val($("#lblusernamehidden").val());
                        $("#v4 .name").attr('readonly', 'readonly');

                    }

                }, 1000);
                var interval3 = setInterval(function () {
                    $('.title').text('Start live Guided Tour');
                    $('.text').text('Start live Guided Tour');
                }, 1000);


            });


        });

    </script>
</body>
</html>
