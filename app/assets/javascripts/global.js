$(document).ready(function () {
if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
  $('#backtotopbutton').css({'display':'none'});
  $('#prev').css({'display':'none'});
  $('#next').css({'display':'none'});
  $('head').append('<script type="text/javascript" src="http://www.inc.com/lib/jquery-cycle2/jquery.cycle2.carousel.min.js"></script>');
}
});

function getCookie(c_name) {
	var i,x,y,ARRcookies=document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++) {
		x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
		y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
		x=x.replace(/^\s+|\s+$/g,"");
		if (x==c_name) {
			return unescape(y);
		}
	}
}

function setCookie(name,value,expires, options) {
	if (options===undefined) { options = {}; }
	if ( expires ) {
		var expires_date = new Date();
		expires_date.setHours(expires_date.getHours() + (expires*24))
	}
	document.cookie = name+'='+escape( value ) +
	( ( expires ) ? ';expires='+expires_date.toGMTString() : '' ) + 
	( ( options.path ) ? ';path=' + options.path : '' ) +
	( ( options.domain ) ? ';domain=' + options.domain : '' ) +
	( ( options.secure ) ? ';secure' : '' );
}


function deleteCookie( name, path, domain ) {
	if ( getCookie( name ) ) document.cookie = name + '=' +
	( ( path ) ? ';path=' + path : '') +
	( ( domain ) ? ';domain=' + domain : '' ) +
	';expires=Thu, 01-Jan-1970 00:00:01 GMT';
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');

	for(var i=0;i < ca.length;i++) {
		var c = ca[i];

		while (c.charAt(0)==' ')
			c = c.substring(1,c.length);

		if (c.indexOf(nameEQ) == 0)
			return c.substring(nameEQ.length,c.length);
	}
	return null;
}

if(!getCookie('incun') && !getCookie('incrnd')) {
	var randomnumber=Math.floor(Math.random()*99999999);
	setCookie('incrnd',randomnumber,360, { "path" : "/", "domain" : ".inc.com" });
}
var abgrp = 0;
if(getUrlVars()['abgrp']) {
	var abgrp=getUrlVars()['abgrp'];
	setCookie('incab',abgrp,1, { "path" : "/", "domain" : ".inc.com" });
} else {
if(!getCookie('incab')) {
	var abgrp=Math.floor(Math.random()*12)+1;
	setCookie('incab',abgrp,1, { "path" : "/", "domain" : ".inc.com" });
} else {
	var abgrp=getCookie('incab');
}
}
var usrid=0;var username='';var jobid='';var indid='';var sizid='';var revid='';var subexp='';
if(getCookie('incid')) {
	var demo = getCookie('incid');
	if(demo.indexOf(":")>-1) { var n=demo.split(":");usrid = n[0];username=n[1];jobid=n[2];indid=n[3];sizid=n[4];revid=n[5];subexp=n[6];}else{usrid = demo;}
}

jobtitle = new Array();jobtitle['1'] = 'Chairperson';jobtitle['2'] = 'Board member';jobtitle['3'] = 'Owner/Partner';jobtitle['4'] = 'CEO';jobtitle['5'] = 'CFO';jobtitle['6'] = 'CIO/CTO';jobtitle['7'] = 'COO';jobtitle['8'] = 'CMO';jobtitle['9'] = 'President';jobtitle['10'] = 'Managing Director';jobtitle['11'] = 'Senior Vice President/Executive Vice President';jobtitle['12'] = 'Vice President';jobtitle['13'] = 'General Manager';jobtitle['15'] = 'Controller/Treasurer';jobtitle['16'] = 'Technical staff/Information Systems';jobtitle['17'] = 'Director';jobtitle['18'] = 'Sales Representative/Account Executive';jobtitle['19'] = 'Manager';jobtitle['20'] = 'Consultant';jobtitle['21'] = 'Professional';jobtitle['22'] = 'Clerical/Support staff/Administrator';jobtitle['23'] = 'Coordinator/Assistant';jobtitle['24'] = 'Government/Public Official';jobtitle['25'] = 'Teacher/Lecturer';jobtitle['26'] = 'Student';jobtitle['27'] = 'Not employed';jobtitle['28'] = 'Retired';
industry = new Array();industry['1'] = 'Accounting';industry['2'] = 'Academic';industry['3'] = 'Aerospace';industry['4'] = 'Agriculture';industry['5'] = 'Architecture';industry['6'] = 'Arts/Entertainment/Media';industry['7'] = 'Automotive';industry['8'] = 'Banking, Financial Services, Insurance';industry['9'] = 'Biotechnology & Pharmaceutical';industry['10'] = 'Construction & Manufacturing';industry['11'] = 'Consulting';industry['12'] = 'Consumer Packaged Goods';industry['13'] = 'Design';industry['14'] = 'Education & Training';industry['15'] = 'Electronics';industry['16'] = 'Engineering';industry['17'] = 'Event Management & Conferences';industry['18'] = 'Food service';industry['19'] = 'Government';industry['20'] = 'Healthcare/HMOs';industry['21'] = 'Human Resources/Recruiting';industry['22'] = 'Internet, New Media, E-commerce';industry['23'] = 'Law';industry['24'] = 'Materials & Life Sciences';industry['25'] = 'Military and Defense';industry['26'] = 'Mining, Oil and Gas';industry['27'] = 'Nonprofits & Associations';industry['28'] = 'Marketing, PR & Advertising';industry['29'] = 'Real Estate';industry['30'] = 'Retail';industry['31'] = 'Sales, Marketing, & Public Relations';industry['32'] = 'Technology';industry['33'] = 'Telecommunications';industry['34'] = 'Travel, Tourism & Lodging';industry['35'] = 'Transport, Logistics & Shipping';industry['36'] = 'Utilities & Energy Services';industry['37'] = 'Not employed';industry['38'] = 'Retired';
companysize = new Array();companysize['1'] = '1';companysize['2'] = '2-5';companysize['3'] = '6-10';companysize['4'] = '11-25';companysize['5'] = '26-50';companysize['6'] = '51-200';companysize['7'] = '201-1000';companysize['8'] = '1001-10000';companysize['9'] = '10001+';
companyrevenue = new Array();companyrevenue['1'] = 'Under $100,000';companyrevenue['2'] = '100k-500k';companyrevenue['3'] = '500k-1M';companyrevenue['4'] = '1M-5M';companyrevenue['5'] = '5M-10M';companyrevenue['6'] = '10M-100M';companyrevenue['7'] = '100M-500M';companyrevenue['8'] = '500M-1B';companyrevenue['9'] = '1B+';

function intentionintercept(thistype,thisid,thattype,thatid,position,slot,linktype,url) {
	$.post("http://www.inc.com/intentionintercept", { thistype: thistype, thisid: thisid, thattype: thattype, thatid: thatid, position: position, slot: slot, linktype: linktype} );
	if(position=='popular') { position = 'pop'; }
	if(position=='related') { position = 'next'; }
	if(url) { 
		if(abgrp==13) {
			$('#maincolumn_inner').load(url.replace('http://www.inc.com/','http://www.inc.com/quick/'));
		} else {
			document.location.href=url+'?nav='+position; 
		}
		return false; 
	}
}
function registrationintercept() {
	var s=s_gi(s_account); 
	s.linkTrackVars='events'; 
	s.linkTrackEvents='event4'; 
	s.events='event4'; 
	s.tl(this,'o','Registration');
}
function newsletterintercept(newsletters) {
	var s=s_gi(s_account); 
	s.linkTrackVars='eVar40,events,list1'; 
	s.linkTrackEvents='event16'; 
	s.eVar40=newsletters; 
	s.list1 = s.eVar40;
	s.events='event16'; 
	s.tl(this,'o','Newsletter Subscription');
}

/* New Welcome/Interstitial Ad Code*/

$(document).ready(function () {
  	var doc_width = document.body.clientWidth + "px";
	var doc_height = document.body.clientHeight + "px";

	$(".bgCover").css({
		width: doc_width,
		height: doc_height
	});
        
        // User Login - Registration
        if(getCookie('incun')) {
		$('#welcome_loggedout').hide();
		$('#welcome').show();
                //$('#topbar').show();
	} else {
		$('#welcome_loggedout').show();
		$('#welcome').hide();
	}
        
        $('#newsletter_chex td.newsletter_title').hover(function(){
            $('#newsletter-desc').html( $('div[name="'+$(this).attr('id')+'"]').html() );
        });
});

var overlayAdOpen = new Boolean();
var triggerAd = false;
var fadeSpeed = "slow";

function overlay_ad(){
	// Check to see if cookie exists/url is a partner page
	var cookieExists = readCookie('inc_splash');
	var current_url =  this.location.href;
	var partner_page = current_url.indexOf("?partner=");

	// If cookie exists/it's a partner page, do nothing; otherwise set cookie and show welcome ad
	if(partner_page>0){
		return;
	} else if(cookieExists) {
		return;
	} else {
		var referrer = document.referrer;
		if (getCookie('inc_splash') != 1) {
		  setCookie('inc_splash',1,0.5, { "path" : "/", "domain" : ".inc.com" });
		  //createCookie('inc_splash', 1, 4);
		  top.location = "http://www.inc.com/welcome.html?destination=" + encodeURI(window.location.href);
		}
	}
}

//var target = new Date();
//var target_time = Date.parse(target)/1000;
var counter = 16;
// Display 15 second countdown, then redirects
function countdown(){
	//var current = new Date();
	//current_time = Date.parse(current)/1000;

	var x = counter - 1;
	counter = x;

	$("#sec_count").html(x);

	if(x > 0){
		setTimeout(countdown, 1000);
	} else {
		hideAdOverlay();
	}
}

/* Async ad delivery functions */

ord=Math.random()*100000000000000000;
tilenum=1;
var rasegs='';

var adpositions=new Array(); 
adpositions[1]="interstitial_wrapper";
adpositions[2]="leaderboard_ad";       
adpositions[3]="ad_pencil";
adpositions[4]="channellogo";
adpositions[5]="advt_imu_js";
adpositions[6]="ad_partners";
adpositions[7]="advt_imu2_js";

function replace_advt( loadTime, id, url ) {
    if( arguments.length < 3 ) return;
    var element = document.getElementById( id );
    if( !element ) {
        if (loadTime >= 2000) return;
        var args = loadTime + 50;
        for( var i = 1; i < arguments.length; i++ ) args += "," + "'" + arguments[i] + "'";
        setTimeout( "replace_advt(" + args + ")", 50 );                
        return;
    }
    try
    {
        if( !element.ad_done ) element.ad_done = true; else return;
         
        var iframe = document.createElement("iframe");
        iframe.scrolling="no";
        iframe.marginHeight = 0;
        iframe.marginWidth = 0;
        iframe.frameBorder = 0;
        iframe.allowTransparency = true;
        iframe.vspace=0;
        iframe.hspace=0;
        if( navigator.appName == "Microsoft Internet Explorer" ) iframe.src = "javascript:false";
        else iframe.src = "";
        

        (iframe.frameElement || iframe).style.cssText = "width: 0px; height: 0px; border: 0; padding: 0; margin: 0; background:transparent;";
        var iframes = element.getElementsByTagName("iframe");
        if (iframes.length) element.removeChild(iframes[0]);
        var fdoc = element.appendChild(iframe).contentWindow.document;
        fdoc = fdoc.open();
        fdoc.c = function() {
            var scrollH = this.documentElement.scrollHeight;
            if( scrollH == 0 && this.body.scrollHeight > 0 ) scrollH = this.body.scrollHeight;
            var h = Math.max(scrollH ,Math.max(this.body.offsetHeight, this.documentElement.offsetHeight),Math.max(this.body.clientHeight, this.documentElement.clientHeight));
            if(h <= 0 ) return;
            var scrollW = this.documentElement.scrollWidth;
            if( scrollW == 0 && this.body.scrollWidth > 0 ) scrollW = this.body.scrollWidth;
            var w = Math.max(scrollW,Math.max(this.body.offsetWidth, this.documentElement.offsetWidth),Math.max(this.body.clientWidth, this.documentElement.clientWidth));
            if( w <= 0 ) 
            {
                if( navigator.appName == "Opera" ) {
                    for( var i = 0; i < this.body.children.length; i++ ) w = Math.max( w, this.body.children[i].scrollWidth, this.body.children[i].offsetWidth );
                    if( w <= 0 ) return;
                }
                else return;
            }
            if( h < 30 || w < 30 ) {
                var imgs = this.getElementsByTagName("img");
                for( var i = 0; i< imgs.length; i++) if( !imgs[i].complete ) return; 
            }
            h = h + "px";
            w = w + "px";
            if( (iframe.frameElement || iframe).style.height == h && (iframe.frameElement || iframe).style.width == w )
            {
                this._cnt = 10000;
            }
            else
            {
                (iframe.frameElement || iframe).style.height = h;
                (iframe.frameElement || iframe).style.width = w;
            }
        }
        if( arguments.length > 3 ) {
            fdoc.nxt_args = [loadTime];
            for( var i = 3; i < arguments.length; i++ ) fdoc.nxt_args.push( arguments[i] );
            fdoc.nxt = function() {delete this.nxt; window.parent.replace_advt.apply( window.parent, this.nxt_args );};
        }
        var async = "async";
        if( navigator.vendor && navigator.vendor.indexOf("Apple") >= 0 ) async = "";
        if( navigator.userAgent.indexOf("Firefox") >= 0 ) async = "";
        fdoc.write('<style type=\"text/css\">img {border: none;} a img {border: none;}<\/style><script '+async+' type=\"text/javascript\" src=\"' + url + '\"><\/script><script>document._cnt=0;if(document.nxt) document.nxt();function a() { if(document._cnt++ < 200 ) {if( document.body ) document.c();setTimeout(\"a();\",100);} else {document.close();} }; a();<\/script>');
    }
    catch(e) {}
}

function target_me(kvp) {
    window.target_me = function (kvp) {};
    try {
        var ads = [0];
        for (var i = 0; i < target_spots.length; i++) {
                ads.push( target_spots[i].substr(0,target_spots[i].indexOf(";")) );
                ads.push( target_base + kvp + target_spots[i].substr(target_spots[i].indexOf(";")) + ord );
        }
        if( !window.targeted_me )
        {
            window.targeted_me = true;
            replace_advt.apply( this, ads );
        }
    }
    catch(e) {}
}


/* Function which allows Internet Explorer to natively support .indexOf */
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (searchElement /*, fromIndex */ ) {
        "use strict";
        if (this == null) {
            throw new TypeError();
        }
        var t = Object(this);
        var len = t.length >>> 0;
        if (len === 0) {
            return -1;
        }
        var n = 0;
        if (arguments.length > 0) {
            n = Number(arguments[1]);
            if (n != n) { // shortcut for verifying if it's NaN
                n = 0;
            } else if (n != 0 && n != Infinity && n != -Infinity) {
                n = (n > 0 || -1) * Math.floor(Math.abs(n));
            }
        }
        if (n >= len) {
            return -1;
        }
        var k = n >= 0 ? n : Math.max(len - Math.abs(n), 0);
        for (; k < len; k++) {
            if (k in t && t[k] === searchElement) {
                return k;
            }
        }
        return -1;
    }
}

// Read a page's GET URL variables and return them as an associative array.
function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

/* 
 * User Login --------
 *
 */

function openLogin(){
    //alert('lets login! clyde');
    
    $('.close').click(function() {
        $('#login').fadeOut();
        $('#top-black-bar').animate({'height': '55px'},100);
        $('#search-bar').animate({'margin-top': '0px'},100);
        closeForgotPass();
    });
    
    $('#login_submit').click(function() {
        doAjaxLogin();
        
        return false;
    });
    
    $('#register').fadeOut(function() {            
    });
    $('#top-black-bar').animate({'height': '70px'},100);
    $('#search-bar').animate({'margin-top': '7px'},100);
    $('#login').fadeIn();
    return false;
}

function doAjaxLogin(){
    	//var returnurl = $('#inc_return_url').val();
	var returnurl = "http://www.inc.com";
        var entered_email = $('#email').val();
	var entered_pass = $('#password').val();
	var geo_country_name = geoip_country_name();
	var geo_city_name = geoip_city();
	var geo_region_name = geoip_region_name();
	var geo_lat = geoip_latitude();
	var geo_long = geoip_longitude();
        var geo_zip = geoip_postal_code();
		
	if(!isValidEmailAddress(entered_email)){
		alert('Please enter a valid email address');
		return false;
	}else{
		$('#password').css('border-color','');
		
		/*if(geo_country_name != "United States"){
		    setCookie('nus',1,3600, { "path" : "/", "domain" : ".inc.com" });
		}*/
		
		postLogin('type=account&increturl=' + encodeURI(returnurl) + '&email=' + encodeURI(entered_email) + '&password1=' + encodeURI(entered_pass) + '&geocountry=' + encodeURI(geo_country_name) + '&geocity=' + encodeURI(geo_city_name) + '&geozip=' + encodeURI(geo_zip) + '&georegion=' + encodeURI(geo_region_name) + '&geolat=' + encodeURI(geo_lat) + '&geolong=' + encodeURI(geo_long));
	}
        
        return true;
}

function postLogin(params) {

    var request = new XMLHttpRequest();
    request.onreadystatechange=function(){
    console.log(request.responseText);
        if (request.readyState==4){
            //postflag = false;
            if (request.status==200 || window.location.href.indexOf("http")==-1){
				
		//alert(request.responseText);
                var theresponse = request.responseText;
                
		var responseArray = theresponse.split("-");
                		
                var x = parseInt(responseArray[0]);

                if (x == 20) {
		    //alert('success!');
		    
                    $('#login').fadeOut();
                    $('#welcome_loggedout').fadeOut();
                    $('#welcome #memberlink').html(responseArray[1]);
                    $('#welcome').fadeIn();
                    
                    if (getCookie('incusertempcomment')) {
                        comments.deleteCookie('incusertempcomment','/','.inc.com');
                        comments.postComment();
                        $(window).scrollTop($('#divvy').offset().top-100);
                    }
		    
                    var nluser_cookie_val = getCookie('incid');
                    var nluser_id = nluser_cookie_val.substr(0, nluser_cookie_val.indexOf(':'));
                    
                    if($('div#newsletters_inc').length > 0){
                        var usremail = $('input#email').val();
                        //console.log('allowed!');
                        $('div#please_login').hide();
                        $('input#mc-embedded-subscribe').show();
                        $('input#emailz2').attr("value",usremail);
                        $('input[name="letteroption[]"]').removeAttr('disabled');
                    }else{
                        //console.log('no go!');
                    }
                    
                    registrationintercept();
                }
                else if (x == 10) {
                	window.location.reload();
                }
		else if (x == 11){
            var the_return_locale = $('#inc_return_url').val();

            if(the_return_locale == "" ){
                window.location = 'http://www.inc.com';
            }else{
                window.location = $('#inc_return_url').val();
            }
		}
                else if (x == 1) {
                    alert('Sorry, but something seems to be wrong with your E-Mail address. ');
                }
                else if (x == 2) {
                    alert('Sorry, but the E-Mail address you entered is already registered with us.');
                }
                else if (x == 3) {
		    $('#password1').css('border-color','red');
                    alert('Sorry, but the Password you entered is incorrect.');
                }
            }
            else{
                errorlog = '';
                //alert('An error has occured making the request.<br /><br />Please check your connection status, and try again in a moment.');
            }
        }
    }

    request.open("POST", "/validate.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.withCredentials = "true";
    //request.overrideMimeType('text/javascript');
    request.send(params);
}

function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
	return pattern.test(emailAddress);
}


/* 
 * User Registration --------
 *
 */

function openRegistration(){
    
    $('div#theajaxregpull').load( "http://www.inc.com/overlay_reg", function() {
        console.log( "Load was performed." );
        $('.close').click(function() {$('#register').fadeOut();$('#top-black-bar').css({'height': '55px'});$('#slimlogonav').addClass('navselected');});
        $('#login').fadeOut(function() {
                    $('#register').fadeIn(function() {
                    $('#top-black-bar').animate({'height': '320px'},100);
                    $('#slimlogonav').removeClass('navselected');
                    $('#slimlogonav').css({'display': 'none'});
                            $('.pane2').hide(); $('.pane3').hide(); $('.pane4').hide(function() {
                                    $('.pane1').fadeIn();
                            });
                            $('#b1').click(function() {
                                doAjaxRegister();
                            });
                    });
            });
        return false;
    });
    
    
    return false;
}

function doAjaxRegister(){
    	//var returnurl = $('#inc_return_url').val();
	var returnurl = "http://www.inc.com";
        var entered_fname = $('#reg_fname').val();
        var entered_lname = $('#reg_lname').val();
        var entered_email = $('#reg_email').val();
	var entered_pass = $('#reg_password').val();
	var geo_country_name = geoip_country_name();
	var geo_city_name = geoip_city();
	var geo_region_name = geoip_region_name();
	var geo_lat = geoip_latitude();
	var geo_long = geoip_longitude();
        var geo_zip = geoip_postal_code();
		
	if(!isValidEmailAddress(entered_email)){
		alert('Please enter a valid email address');
		return false;
	}else{
		$('#password').css('border-color','');
		
		/*if(geo_country_name != "United States"){
		    setCookie('nus',1,3600, { "path" : "/", "domain" : ".inc.com" });
		}*/
		
		postRegister('type=account&increturl=' + encodeURI(returnurl) + '&efname=' + encodeURI(entered_fname) + '&elname=' + encodeURI(entered_lname) + '&email=' + encodeURI(entered_email) + '&password1=' + encodeURI(entered_pass) + '&geocountry=' + encodeURI(geo_country_name) + '&geocity=' + encodeURI(geo_city_name) + '&geozip=' + encodeURI(geo_zip) + '&georegion=' + encodeURI(geo_region_name) + '&geolat=' + encodeURI(geo_lat) + '&geolong=' + encodeURI(geo_long));
	}
        
        return true;
}

function postRegister(params) {

    var request = new XMLHttpRequest();
    request.onreadystatechange=function(){
    console.log(request.responseText);
        if (request.readyState==4){
            //postflag = false;
            if (request.status==200 || window.location.href.indexOf("http")==-1){
				
				//alert(request.responseText);
				
                var x = parseInt(request.responseText);
                if (x == 20) {
			//alert('the zero position');
			//$('div#overlay_form1').toggle('slide');
			//$('div#overlay_form2').toggle('slide');
			var email = $('#reg_email').val();
			var email_parts = email.split('@');
			
			$('#welcome_loggedout').hide();
			//$('#welcome').html('<li class="first">Welcome <a href="{$application_url}member" rel="nofollow">'+email_parts[0]+'</a></li><li>&nbsp;&nbsp;|&nbsp;<a href="{$application_url}logout" rel="nofollow">Logout</a></li>');
			//$('#welcome').html('Welcome <strong><a href="/member" rel="nofollow" id="memberlink">'+email_parts[0]+'</a></strong> | <a href="/logout?ret=" rel="nofollow">Log Out</a>');
                        $('#welcome #memberlink').html(email_parts[0]);
                        $('#welcome').show();
			$('input#emailz').val($('#reg_email').val());

                    if (getCookie('incusertempcomment')) {
                        $('#register .close').click();
                        comments.deleteCookie('incusertempcomment','/','.inc.com');
                        comments.postComment();
                        $(window).scrollTop($('#divvy').offset().top-100);
                    }
                    else {
                        $('.pane1').fadeOut(function() {
                            $('.pane2').fadeIn();
                        });

                        $('#gb2').click(function() {
                            $('.pane2').hide(); $('.pane3').hide(); $('.pane4').hide(function() {
                                $('.pane1').fadeIn();
                            });
                        });
                        
                        var nluser_cookie_val = getCookie('incid');
                        var nluser_id = nluser_cookie_val.substr(0, nluser_cookie_val.indexOf(':'));
                        
                        if($('div#newsletters_inc').length > 0){
                            console.log('allowed!');
                            $('input#mc-embedded-subscribe').show();
                            $('div#please_login').hide();
                            $('input#emailz2').attr("value",email);
                            $('input[name="letteroption[]"]').removeAttr('disabled');
                        }else{
                            console.log('no go!');
                        }

                        //do b2 click
                        $('#b2').click(function() {
                            
                            var justgo = false;
                
                            var zipcode = $("#demo_zip").val();
                            var coname = $("#demo_companyname").val();
                            var employeecount = $("#demo_employeenum").val();
                            var countryname = $("#demo_usercountry").val();
                            var jobtitle = $("#demo_jobtitle").val();
                            //var display_zip = $('#demo_zip').prop('disabled');		
                            
                            // CHECK THAT AT LEAST 1 NEWSLETTER IS CHECKED FOR SUBSCRIBING
                            
                            if(zipcode == ""){
                                    $('.success').hide();
                                    $('.error').html("Please enter your zipcode.");
                                    $('.error').show();
                            }
                            else if(coname == "")
                            {
                                    $('.success').hide();
                                    $('.error').html("Please enter your company name.");
                                    $('.error').show();
                            }
                            else if(employeecount == "nope")
                            {
                                    $('.success').hide();
                                    $('.error').html("Please choose number of employees.");
                                    $('.error').show();
                            }
                            else if(countryname == "nope")
                            {
                                    $('.success').hide();
                                    $('.error').html("Please choose your country.");
                                    $('.error').show();
                            }
                            else if(jobtitle == "nope")
                            {
                                    $('.success').hide();
                                    $('.error').html("Please choose your job title.");
                                    $('.error').show();
                            }
                            else{
                                    //dataString = 'tests=passed&zipcode='+zipcode+'&coname='+coname+'&employeecount='+employeecount;
                                    justgo = true;
                            }
            
                            if(justgo){
                                    doAjaxDemo();
                            }
                            return false;
                            
                        });
                    }

			//registrationintercept();
                }
                else if (x == 10) {
                	window.location.reload();
                }
		else if (x == 11){
			window.location = $('#inc_return_url').val();
		}
                else if (x == 1) {
                    alert('Sorry, but something seems to be wrong with your E-Mail address. ');
                }
                else if (x == 2) {
                    alert('Sorry, but the E-Mail address you entered is already registered with us.');
                }
                else if (x == 3) {
		    $('#password1').css('border-color','red');
                    alert('Sorry, but the Password you entered is incorrect.');
                }
            }
            else{
                errorlog = '';
                //alert('An error has occured making the request.<br /><br />Please check your connection status, and try again in a moment.');
            }
        }
    }

    request.open("POST", "/validate.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.withCredentials = "true";
    //request.overrideMimeType('text/javascript');
    request.send(params);
}

function doAjaxDemo(){
	//var entered_email = $('#email1').val();
        var incid_cookie_val = getCookie('incid');
	var loggedin_id = incid_cookie_val.substr(0, incid_cookie_val.indexOf(':'));
	//var demo_firstname = $('#demo_firstname').val();
        //var demo_lastname = $('#demo_lastname').val();        
	//var demo_username = demo_firstname+" "+demo_lastname;
	var demo_zip = $('#demo_zip').val();
	var demo_companyname = $('#demo_companyname').val();
	var demo_employeenum = $("#demo_employeenum").val();
	var demo_usercountry = $("#demo_usercountry").val();
	var demo_jobtitle = $("#demo_jobtitle").val();
	
        //$('#demo_fullname').val(demo_username)
        
	postDemo('type=demo&loggedinid=' + encodeURI(loggedin_id) + '&zipcode=' + encodeURI(demo_zip) + '&coname=' + encodeURI(demo_companyname) + '&employeenum=' + encodeURI(demo_employeenum) + '&usercountry=' + encodeURI(demo_usercountry) + '&userjobtitle=' + encodeURI(demo_jobtitle));
}

function postDemo(params) {

    var request = new XMLHttpRequest();
    request.onreadystatechange=function(){
	console.log(request.responseText);
        if (request.readyState==4){
            //postflag = false;
            if (request.status==200 || window.location.href.indexOf("http")==-1){
				
				//alert(request.responseText);
				
                var x = parseInt(request.responseText);
                if (x == 0) {
                	//alert('the zero position');
					//$('div#overlay_form2').toggle('slide');
					//$('div#overlay_form3').toggle('slide');
                                        $('input#firstnamez').val($('#reg_fname').val());
					$('input#lastnamez').val($('#reg_lname').val());
                                        $('input#fullnamez').val($('#reg_fname').val()+" "+$('#reg_lname').val());
					//$('#allforms_wrapper').cycle('next');
                                        
                                        $('.pane2').fadeOut(function() {$('.pane3').fadeIn()});
                                        
                                        $('#gb3').click(function() {
                                            $('.pane1').hide(); $('.pane3').hide(); $('.pane4').hide(function() {
                                                $('.pane2').fadeIn();
                                            });
                                        });
                                        
                                        $('#b3').click(function() {
                                            doNewsletterSignup();
                                        });
                }
                else if (x == 1) {
                    alert('Sorry, there was a problem. ');
                }else{
                	alert('no idea');
                }
            }
            else{
                errorlog = '';
                //alert('An error has occured making the request.<br /><br />Please check your connection status, and try again in a moment.');
            }
        }
    }

    request.open("POST", "/validate.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //request.overrideMimeType('text/javascript');
    request.send(params);
}

function doNewsletterSignup(){
	var allVals = [];
	$('#newsletter_chex :checked').each(function() {
	        allVals.push($(this).val());
	});
	
	//alert(allVals);
	//var groupy = $("#mc_grouping").val();
	var emailz = $("#emailz").val();
	var firstnamez = $("#firstnamez").val();
        var lastnamez = $("#lastnamez").val();
        var fullnamez = $("#fullnamez").val();
	//var returnurl = $('#inc_return_url').val();
        var returnurl = "http://www.inc.com";
	
	//var dataString = 'fullnamez='+ fullnamez +'emailz='+ emailz +'&grouping='+ allVals;
	
	
	// CHECK THAT AT LEAST 1 NEWSLETTER IS CHECKED FOR SUBSCRIBING
	if(allVals == ""){
        $('.success').hide();
        $('.error').html("Please choose at least 1 newsletter.");
        $('.error').show();
	}
	else
	{
	    //send message to Omniture with list of checked newsletters
	    //newsletterintercept(allVals);
	    //alert(encodeURI(emailz));
	    postNewsletter('type=newsletter&increturl=' + encodeURI(returnurl) + '&useremail=' + encodeURI(emailz) + '&userlastname=' + encodeURI(lastnamez) + '&userfirstname=' + encodeURI(firstnamez) + '&userfullname=' + encodeURI(fullnamez) + '&newsletterchoices=' + encodeURI(allVals));
	}
}

function postNewsletter(params) {

    var request = new XMLHttpRequest();
    request.onreadystatechange=function(){
        if (request.readyState==4){
            //postflag = false;
            if (request.status==200 || window.location.href.indexOf("http")==-1){
				
				//alert(request.responseText);
				
                var x = parseInt(request.responseText);
                if (x == 0) {
                	//alert('Success!');
					//$('div#overlay_form2').toggle('slide');
					//$('div#overlay_form3').toggle('slide');
					//$('input#fullnamez').val($('#demo_fullname').val());
					//$('#allforms_wrapper').cycle('next');
                                        $('.pane3').fadeOut(function() {$('.pane4').fadeIn()});
                                        
                                        $('#b4').click(function() {
                                            $('#register').fadeOut();
                                        });
                }
                else if (x == 1) {
                    alert('Sorry, there was a problem. ');
		}
                else if (x == 2) {
                    window.location = $('#inc_return_url').val();
                }else{
                	alert('no idea');
                }
            }
            else{
                errorlog = '';
                //alert('An error has occured making the request.<br /><br />Please check your connection status, and try again in a moment.');
            }
        }
    }

    request.open("POST", "/validate.php", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //request.overrideMimeType('text/javascript');
    request.send(params);
}



// Start: Pinboard Sort Header
$(function(){
    $('#pinboardSortLatestClicker').click(function(e) {
        if (localStorageSupported) {
            var incPinboardSorting = $.parseJSON(localStorage.getItem('incPinboardSorting'));
        }
        else {
            var incPinboardSorting = {home:'notset',channel:'notset'};
        }

        if (parseInt($('#pinboardSortLatest').css('z-index')) < 5) {
            $('#pinboardSortLatest').css('z-index',5);
            $('#pinboardSortPopular').css('z-index',0);

            if (op == 'home') {
                incPinboardSorting.home = 'latest';
            }
            else if (op == 'channel') {
                incPinboardSorting.channel = 'latest';
            }

            if (localStorageSupported) {
                localStorage.setItem('incPinboardSorting',JSON.stringify(incPinboardSorting));
            }

            location.href = baseURL;
        }
    });

    $('#pinboardSortPopularClicker').click(function(e) {
        if (localStorageSupported) {
            var incPinboardSorting = $.parseJSON(localStorage.getItem('incPinboardSorting'));
        }
        else {
            var incPinboardSorting = {home:'notset',channel:'notset'};
        }

        if (parseInt($('#pinboardSortPopular').css('z-index')) < 5) {
            $('#pinboardSortPopular').css('z-index',5);
            $('#pinboardSortLatest').css('z-index',0);

            if (op == 'home') {
                incPinboardSorting.home = 'popular';
            }
            else if (op == 'channel') {
                incPinboardSorting.channel = 'popular';
            }

            if (localStorageSupported) {
                localStorage.setItem('incPinboardSorting',JSON.stringify(incPinboardSorting));
            }

            location.href = baseURL;
        }
    });
});
// End: Pinboard Sort Header

function openForgotPass(){
    $('div#forgot_login_form').fadeIn();
}

function closeForgotPass(){
    $('div#forgot_login_form').fadeOut();
}
