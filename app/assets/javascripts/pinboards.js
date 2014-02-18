var readmoreLogTriggered = false;
var Pinboard = function() {
	var cls = this;
	cls.location;
	cls.secondPath;
	cls.ID;
	cls.appURL;
	cls.loading = false;
	cls.tileCount = 0;
	cls.type;
	cls.limit;
	cls.unitCount;
	cls.pdata;
	cls.offset;
	cls.imageLoadingArray = new Array();
	cls.imageLoadingIndex = 0;
	cls.unitidArray = new Array();
	cls.lastScrollTop;
	cls.lastScrollPosition = 0;
	cls.manuallyScrolled = false;
	cls.artid = false;
	cls.isArticlePage = false;
	cls.pushOffset = 0;
	cls.firstChannelLoad = true;
	cls.finishedPinboard = false;
	cls.pushURL = baseURL;
	cls.excludeids;
	cls.tryingToDisplayPinboardUnit = false;
	cls.hiddenPinboardUnits = new Array();
	cls.showLimitedInfiniteScroll = false;
	cls.ignoreAssemblyPrevention = false;

	cls.sponsoredLocations = new Array(5,1,3,1,4,0,4,3,1);//no 2's right now
	cls.sponsoredLocationsIndex = 0;

	cls.processStructure = function(structure) {
		if (narrowflag.toLowerCase() != 'true') {
			var normalIndices = new Array();
			for (var i = 0; i < structure.length; i++) {
				if (typeof structure[i].cellclass !== 'undefined' && structure[i].cellclass == 'normal') {
					normalIndices.push(i);
				}
			}
			for (var i = 0; i < normalIndices.length; i++) {
				if (cls.sponsoredLocations[cls.sponsoredLocationsIndex] == i) {
					structure[normalIndices[i]].cellclass = 'sponsored';
				}
				if (cls.unitCount == 0 && cls.sponsoredLocations[cls.sponsoredLocationsIndex]*2 == i) {
					structure[normalIndices[i]].cellclass = 'sponsored';
				}
			}
			cls.sponsoredLocationsIndex++;
			if (cls.sponsoredLocationsIndex == cls.sponsoredLocations.length) {
				cls.sponsoredLocationsIndex = 0;
			}
		}

		return structure;
	}

	cls.channelheaderstructure = new Array(
							{
								cellclass:'mainfeature',
								cellwidth:3
							},
							{
								cellclass:'subfeature',
								cellwidth:1
							},
							{
								cellclass:'subfeature',
								cellwidth:1
							},
							{
								cellclass:'subfeature',
								cellwidth:1
							}

						);
	cls.firstadunitstructure = new Array(
							{
								cellclass:'firstwideadunit',
								cellwidth:3
							}
						);
	cls.initialstructure = new Array(
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'imubig',
								cellwidth:1
							},
							{
								cellclass:'text',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'row1x3',
								cellwidth:3
							},
							{
								cellclass:'portrait',
								cellwidth:1
							},
							{
								cellclass:'imusmall',
								cellwidth:1
							},
							{
								cellclass:'text',
								cellwidth:1
							},
							{
								cellclass:'blank',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'row1x3',
								cellwidth:3
							}
						);
	cls.afterstructure = new Array(
							{
								cellclass:'wideadunit',
								cellwidth:3
							},
							{
								cellclass:'row1x3',
								cellwidth:3
							},
							{
								cellclass:'portrait',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'imubig',
								cellwidth:1
							},
							{
								cellclass:'blank',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'row1x3',
								cellwidth:3
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'imusmall',
								cellwidth:1
							},
							{
								cellclass:'text',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'normal',
								cellwidth:1
							},
							{
								cellclass:'row1x3',
								cellwidth:3
							}
						);

	cls.init = function(pinboardLocation,pinboardID,applicationURL,secondPath,type) {
		cls.location = pinboardLocation;
		cls.secondPath = secondPath;
		cls.ID = '#'+pinboardID;
		cls.appURL = applicationURL;
		cls.loading = true;
		cls.type = type;
		cls.unitCount = 0;
		cls.offset = 0;
		cls.pdata = new Array();
		cls.lastScrollTop = $(window).scrollTop();

		if (typeof abgrp !== 'undefined' && parseInt(abgrp) >= 0 && parseInt(abgrp) <= 6) {
			cls.showLimitedInfiniteScroll = true;
		}

		if (typeof incid !== 'undefined' && incid != 0) {
			cls.isArticlePage = true;
		}

		if (cls.type != 'popularsidebar' && !cls.isArticlePage) {
			if (localStorageSupported) {
				var incPinboardSorting = $.parseJSON(localStorage.getItem('incPinboardSorting'));
			}
			else {
				var incPinboardSorting = {home:'notset',channel:'notset'};
			}

			if (op == 'home' && incPinboardSorting.home != 'notset') {
				cls.type = incPinboardSorting.home;
			}
			else if (op == 'channel' && incPinboardSorting.channel != 'notset') {
				cls.type = incPinboardSorting.channel;
			}
			if (cls.type == 'latest') {
				$('#pinboardSortLatest').css('z-index',5);
			}
			else if (cls.type == 'popular') {
				$('#pinboardSortPopular').css('z-index',5);
			}
			$('#pinboardSortHeader').css('visibility','visible');
		}

		if (cls.type == 'popularsidebar') {
			$(cls.ID).attr('id','particlepinboardsidebar').removeClass('homepinboard').addClass('articlepinboard');
			cls.ID = '#particlepinboardsidebar';
			//check with Sean what this is trying to do !!
			//particlepinboardsidebar = phomepinboard;

		}

		if (!cls.showLimitedInfiniteScroll) {
			$(cls.ID).append('<div class="ajaxloader"><img src="http://images.inc.com/ajaxloader/ajax-loader.gif"></img></div>');
		}

		if (cls.secondPath != '') {
			cls.location += '/'+cls.secondPath.split('_')[0];
		}

		if (cls.location == 'home' || cls.location.search('channel') == 0 || cls.type == 'popularsidebar') {
			$('#backtotopbutton').click(_.throttle(function(e) {
				$('html, body').animate({
					scrollTop: 0
				},
				{
					complete: function() {
						cls.scrollPosition = 0;
						cls.lastScrollPosition = 0;
						history.replaceState(null,null,cls.pushURL);
						cls.updateLocalStorage(0,cls.pushURL,cls.artid);
					}
				}, 500);
			}, 501));

			if (pushStateValue != '' && localStorageSupported) {
				cls.loading = false;
				$(cls.ID+' .ajaxloader').remove();
				var localStorageArray = $.parseJSON(localStorage.getItem('incPinboardData'));
				for (var i = localStorageArray.length-1; i >= 0; i--) {
					if (localStorageArray[i].href == cls.pushURL) {
						if (typeof localStorageArray[i].data !== 'undefined') {
							for (var j = 0; j < localStorageArray[i].data.length; j++) {
								cls.pdata.push(localStorageArray[i].data[j]);
							}

							if (typeof localStorageArray[i].artid !== 'undefined' && localStorageArray[i].artid) {
								cls.artid = localStorageArray[i].artid;
							}
							break;
						}
						else {
							pushStateValue = '';
							history.replaceState(null,null,cls.pushURL);
							ignorePushState = true;
							$(window).scroll(cls.processScrollPosition);
							cls.loadData();
							return;
						}
					}
				}

				for (var i = 0; i < cls.pdata.length; i++) {
					for (var j = 0; j < cls.pdata[i].length; j++) {
						if (typeof cls.pdata[i][j].cellclass !== 'undefined') {
							if (typeof cls.pdata[i][j].type === 'undefined' && cls.pdata[i][j].cellclass != 'blank' && cls.pdata[i][j].cellclass != 'wideadunit' && cls.pdata[i][j].cellclass != 'firstwideadunit' && cls.pdata[i][j].cellclass != 'sponsored' && cls.pdata[i][j].cellclass != 'imusmall' && cls.pdata[i][j].cellclass != 'imubig' && cls.pdata[i][j].cellclass != 'imubigsidebar') {
								cls.offset++;
							}
						}
					}
				}

				cls.ignoreAssemblyPrevention = true;
				for (var i = 0; i < cls.pdata.length-cls.pushOffset; i++) {
					if (i > 1) {
						cls.imageLoadingArray.push(false);
					}
					cls.assemblePinboard();
				}
				cls.ignoreAssemblyPrevention = false;

				var idToUse;
				if (!cls.isArticlePage || (cls.isArticlePage && pushStateValue >= cls.pushOffset)) {
					idToUse = cls.ID;
				}
				else {
					idToUse = '#particlepinboardsidebar';
				}

				scrollToArt = function() {
					if ($(idToUse+' .pin'+cls.artid).length > 0 && parseInt(pushStateValue) == parseInt($(idToUse+' .pin'+cls.artid).parent().parent().attr('id').replace(idToUse.replace('#','')+'Unit',''))) {
						if (!cls.manuallyScrolled) {
							$(window).scrollTop($(idToUse+' .pin'+cls.artid).offset().top-300);
							for (var i = cls.lastScrollPosition+1; i < cls.unitidArray.length; i++) {
								if ($(window).scrollTop() > $(cls.unitidArray[i]).offset().top - 200) {
									cls.lastScrollPosition = i;
									if (i == 0) {
										history.replaceState(null,null,cls.pushURL);
									}
									else {
										history.replaceState(null,null,cls.pushURL+'/'+i);
									}
									cls.updateLocalStorage(cls.lastScrollPosition,cls.pushURL,cls.artid);
									break;
								}
							}
							setTimeout(function(){scrollToArt()},300);
						}
					}
					else {
						scrollToPinUnit();
					}
				}

				scrollToPinUnit = function() {
					if (!cls.manuallyScrolled) {
						$(window).scrollTop($(idToUse+'Unit'+pushStateValue).offset().top);
						for (var i = cls.lastScrollPosition+1; i < cls.unitidArray.length; i++) {
							if ($(window).scrollTop() > $(cls.unitidArray[i]).offset().top - 200) {
								cls.lastScrollPosition = i;
								if (i == 0) {
									history.replaceState(null,null,cls.pushURL);
								}
								else {
									history.replaceState(null,null,cls.pushURL+'/'+i);
								}
								cls.updateLocalStorage(cls.lastScrollPosition,cls.pushURL);
								break;
							}
						}
						setTimeout(function(){scrollToPinUnit()},300);
					}
				}

				if ($(idToUse+'Unit'+pushStateValue).length > 0) {
					if (cls.artid) {
						scrollToArt();
					}
					else {
						scrollToPinUnit();
					}
				}
				else {
					pushStateValue = '';
					history.replaceState(null,null,cls.pushURL);
					ignorePushState = true;
				}
			}

			$(window).scroll(cls.processScrollPosition);

			// thanks Mottie!! http://stackoverflow.com/users/145346/mottie
			$('body,html').bind('scroll mousedown wheel DOMMouseScroll mousewheel keyup', function(e){
				if ( e.which > 0 || e.type == "mousedown" || e.type == "mousewheel"){
					cls.manuallyScrolled = true;
					ignorePushState = true;
				}
			});
		}

		if (pushStateValue == '' || cls.location == 'article/readmore') {
			cls.loadData();
		}
	}

	cls.processScrollPosition = _.throttle(function() {
		if (cls.showLimitedInfiniteScroll) {
			if (!cls.tryingToDisplayPinboardUnit && !cls.finishedPinboard && !cls.loading && $(window).scrollTop() >= $(document).height() - $(window).height() - 2000 && cls.type != 'popularsidebar') {
				if ($('#loadMoreContainer').length == 0) {
					$(cls.ID).append('<div id="loadMoreContainer"><div class="loadMoreButtonPadding"><div class="loadMoreButton"><span class="loadMoreText">LOAD MORE</span></div></div></div>');
					$('#loadMoreContainer .loadMoreButtonPadding').click(function(e) {
						$('#loadMoreContainer').remove();
						$(cls.ID).append('<div class="ajaxloader"><img src="http://images.inc.com/ajaxloader/ajax-loader.gif"></img></div>');
						cls.loading = true;
						cls.tryingToDisplayPinboardUnit = true;
						cls.assemblePinboard();
						cls.loadData();

						$(this).remove();
					});
				}
			}
		}
		else {
			if (!cls.finishedPinboard && !cls.loading && $(window).scrollTop() >= $(document).height() - $(window).height() - 2000 && cls.type != 'popularsidebar') {
				cls.loading = true;
				$(cls.ID).append('<div class="ajaxloader"><img src="http://images.inc.com/ajaxloader/ajax-loader.gif"/></div>');
				cls.loadData();
			}
		}

		var idToUse = cls.ID;
		if (cls.isArticlePage && $('#particlepinboardsidebar').length > 0) {
			idToUse = '#particlepinboardsidebar';
		}

		if ($(idToUse).length > 0 && (cls.location.search('channel') == 0 && cls.isArticlePage) || cls.type == 'popularsidebar') {
			if ($('#backtotopbutton').css('display') == 'none' && $(window).scrollTop() > $(idToUse).offset().top + 500) {
				$('#backtotopbutton').fadeIn(700);
			}
			else if ($('#backtotopbutton').css('display') == 'block' && $(window).scrollTop() <= $(idToUse).offset().top + 500) {
				$('#backtotopbutton').fadeOut(700);
			}
		}
		else {
			if ($('#backtotopbutton').css('display') == 'none' && $(window).scrollTop() > $(idToUse+' .firstwideadunitrow').offset().top) {
				$('#backtotopbutton').fadeIn(700);
			}
			else if ($('#backtotopbutton').css('display') == 'block' && $(window).scrollTop() <= $(idToUse+' .firstwideadunitrow').offset().top) {
				$('#backtotopbutton').fadeOut(700);
			}
		}

		if (cls.isArticlePage && cls.location != 'article/readmore' && !readmoreLogTriggered && $('#particlepinboardreadmore').length > 0 && $(window).scrollTop() > $('#particlepinboardreadmore').offset().top-$(window).height()
			&& $(window).scrollTop() < $('#particlepinboardreadmore').offset().top) {
			readmoreLogTriggered = true;
			var incids = new Array();
			for (var i = 0; i < particlepinboardreadmore.pdata[0].length; i++) {
				incids.push(particlepinboardreadmore.pdata[0][i].id);
			}
			$.post(cls.appURL+'pinboardlog', { 'cnlid':'','incid':incid,'position':'readmore','scroll':cls.lastScrollPosition,'incids[]': incids});
		}

		if (cls.lastScrollTop < $(window).scrollTop()) {
			for (var i = cls.lastScrollPosition+1; i < cls.unitidArray.length; i++) {
				if ($(cls.unitidArray[i]).length > 0) {
					var extraSub;
					if (cls.showLimitedInfiniteScroll) {
						extraSub = 400;
					}
					else {
						extraSub = 0;
					}

					if ($(window).scrollTop() > $(cls.unitidArray[i]).offset().top-$(window).height()-extraSub) {
						if (cls.unitidArray[i].search('particle') === -1 && cls.type != 'popularsidebar') {
							triggerAds(i-cls.pushOffset,i,adUnitArray,cls);
						}
						else {
							triggerAds(i,i,sidebarAdUnitArray,cls);
						}
					}
					if ($(window).scrollTop() > $(cls.unitidArray[i]).offset().top - 200) {
						cls.lastScrollPosition = i;
						if (i == 0) {
							history.replaceState(null,null,cls.pushURL);
						}
						else {
							history.replaceState(null,null,cls.pushURL+'/'+i);
						}
						cls.updateLocalStorage(cls.lastScrollPosition,cls.pushURL);
						break;
					}
				}
			}
		}
		else {
			for (var i = cls.lastScrollPosition; i > 0; i--) {
				if ($(cls.unitidArray[i-1]).length > 0) {
					if ($(window).scrollTop() < $(cls.unitidArray[i-1]).offset().top + $(cls.unitidArray[i-1]).height()) {
						if (cls.unitidArray[i-1].search('particle') === -1 && cls.type != 'popularsidebar') {
							triggerAds(i-1-cls.pushOffset,i-1,adUnitArray,cls);
						}
						else {
							triggerAds(i-1,i-1,sidebarAdUnitArray,cls);
						}
					}
					if ($(window).scrollTop() < $(cls.unitidArray[i-1]).offset().top + $(cls.unitidArray[i-1]).height() - 400) {
						cls.lastScrollPosition = i-1;
						if (i-1 == 0) {
							history.replaceState(null,null,cls.pushURL);
						}
						else {
							history.replaceState(null,null,cls.pushURL+'/'+(i-1));
						}
						cls.updateLocalStorage(cls.lastScrollPosition,cls.pushURL);
						break;
					}
				}
			}

			if (cls.lastScrollPosition == 1 && $(window).scrollTop() < $(cls.unitidArray[0]).offset().top - 520) {
				cls.lastScrollPosition = 0;
				if (!cls.isArticlePage && cls.type != 'popularsidebar') {
					triggerAds(cls.lastScrollPosition,cls.lastScrollPosition,adUnitArray,cls);
				}
				else {
					triggerAds(cls.lastScrollPosition,cls.lastScrollPosition,sidebarAdUnitArray,cls);
				}
				history.replaceState(null,null,cls.pushURL);
			}
		}

		cls.lastScrollTop = $(window).scrollTop();
	},100);

	cls.updateLocalStorage = function(scrollPosition,pageURL,artid) {
		if (localStorageSupported) {
			var localStorageArray = $.parseJSON(localStorage.getItem('incPinboardData'));
			var alreadyRecordedIndex;
			for (var i = localStorageArray.length-1; i >= 0; i--) {
				if (localStorageArray[i].href == pageURL) {
					alreadyRecordedIndex = i;
					break;
				}
			}

			if (typeof alreadyRecordedIndex === 'undefined') {
				localStorageArray.push({timestamp: new Date().getTime(),href: pageURL});
				if (localStorageArray.length > 20) {
					localStorageArray.shift();
				}
			}
			else {
				var splicedItem = localStorageArray.splice(alreadyRecordedIndex,1)[0];
				localStorageArray.push(splicedItem);
				localStorageArray[localStorageArray.length-1].timestamp = new Date().getTime();
			}

			localStorageArray[localStorageArray.length-1].data = cls.pdata;
			if (typeof artid !== 'undefined' && artid) {
				localStorageArray[localStorageArray.length-1].artid = artid;
			}
			localStorageArray[localStorageArray.length-1].scrollPosition = scrollPosition;
			localStorage.setItem('incPinboardData',JSON.stringify(localStorageArray));
		}
	}

	// Thanks Dimitar Christoff !! http://fragged.org/preloading-images-using-javascript-the-right-way-and-without-frameworks_744.html
    cls.imageLoader = function(imagesArray) {
        var images = imagesArray.slice(), // dereference original
            expected = images.length,
            loaded = [],
            errors = [];

        var loadOne = function(src) {
            var image = new Image();

            image.onerror = image.onabort = function(){
                errors.push(src);
                checkProgress();
            };

            image.onload = function(){
                loaded.push(this.src);
                checkProgress();
                // clean up
                image = image.onload = image.onabort = image.onerror = null;
            };

            image.src = src;
        };

        var checkProgress = function() {
        	//console.log(loaded.length+'/'+errors.length+'/'+expected);
            if (loaded.length + errors.length == expected) {
            	cls.imageLoadingArray[cls.imageLoadingIndex] = false;
            	if (cls.showLimitedInfiniteScroll && cls.tryingToDisplayPinboardUnit) {
            		cls.assemblePinboard();
            	}
            	cls.imageLoadingIndex++;
            }
        };

        while (images.length) {
            loadOne(images.shift());
        }
    };

	cls.loadData = function() {
		if (!cls.finishedPinboard) {
			cls.limit = 2;
			var cheight;
			if ($('#maincolumn').length > 0) {
				cheight = $('#maincolumn').height()-328;
			}
			else {
				cheight = $('#articlecontent').height()-328;
			}
			if ($('#select_services').length == 0) {
				cheight += 656;
			}
			while (cheight > 1414) {
				cls.limit++;
				cheight -= 328;
			}

			var restURL;
			if (cls.location == 'home') {
				restURL = cls.appURL+'rest/pinboard/'+cls.location+'/'+cls.type+'?pinunit='+cls.unitCount+'&offset='+cls.offset;
				if (cls.pdata.length == 0) {
					var structure = $.parseJSON(JSON.stringify(cls.firstadunitstructure.concat(cls.initialstructure,new Array(new Array()),cls.afterstructure)));
				}
				else {
					var structure = $.parseJSON(JSON.stringify(cls.afterstructure));
				}
				restURL += '&structure='+encodeURIComponent(JSON.stringify(cls.processStructure(structure)));
			}
			else if (cls.location == 'article/readmore') {
				restURL = cls.appURL+'rest/pinboard/'+cls.location+'/'+incid;
			}
			else {
				if (cls.isArticlePage) {
					if (cls.pdata.length == 0) {
						restURL = cls.appURL+'rest/pinboard/'+cls.location+'/'+cls.type+'?pinunit='+cls.unitCount+'&incid='+incid+'&offset='+cls.offset+'&limit='+cls.limit;
						if (getCookie('incid')) {
							restURL += '&usrid='+getCookie('incid').split(':')[0];
						}
						var structure = $.parseJSON(JSON.stringify(cls.firstadunitstructure.concat(cls.initialstructure,new Array(new Array()),cls.afterstructure)));
					}
					else {
						restURL = cls.appURL+'rest/pinboard/'+cls.location+'/'+cls.type+'?pinunit='+cls.unitCount+'&incid='+incid+'&offset='+cls.offset;
						var structure = $.parseJSON(JSON.stringify(cls.afterstructure));
					}

					if (hasSidebar == 'false') {
						restURL += '&hasSidebar=false';
					}

					restURL += '&structure='+encodeURIComponent(JSON.stringify(cls.processStructure(structure)));
				}
				else {
					restURL = cls.appURL+'rest/pinboard/'+cls.location+'/'+cls.type+'?pinunit='+cls.unitCount+'&offset='+cls.offset;
					if (cls.unitCount == 0) {
						var structure = $.parseJSON(JSON.stringify(cls.channelheaderstructure.concat(cls.firstadunitstructure,cls.initialstructure,new Array(new Array()),cls.afterstructure)));
						restURL += '&structure='+encodeURIComponent(JSON.stringify(cls.processStructure(structure)));
					}
					else {
						var structure = $.parseJSON(JSON.stringify(cls.afterstructure));
						restURL += '&structure='+encodeURIComponent(JSON.stringify(cls.processStructure(structure)));
					}
				}
			}

			// temp channel only until cachedstats fixed
			/*if (typeof abgrp !== 'undefined' || parseInt(abgrp)%2 == 1) {
				restURL += '&useCachedStats=true';
			}*/

			if (cls.type == 'popularsidebar') {
				cls.finishedPinboard = true;
				$(cls.ID+' .ajaxloader').remove();
				restURL += '&limit='+cls.limit;
			}

			if (typeof cls.excludeids !== 'undefined') {
				restURL += '&excludeids='+cls.excludeids.join(',');
			}

			$.ajax({
				dataType: 'json',
				url: restURL
			})
			.done(function(response) {
				var data = response.tiledata;

				if (typeof response.info !== 'undefined' && typeof response.info.offset !== 'undefined' && typeof response.info.changeto !== 'undefined' && typeof response.info.excludeids !== 'undefined') {
					cls.offset = response.info.offset;
					cls.type = response.info.changeto;
					cls.excludeids = response.info.excludeids;
				}

				if (cls.pdata.length != 0 && cls.location.search('article') != 0) {
					cls.imageLoadingArray.push(true);
				}

				for (var i = 0; i < data.length; i++) {
					if (typeof data[i].cellclass !== 'undefined') {
						if (typeof data[i].type === 'undefined' && data[i].cellclass != 'blank' && data[i].cellclass != 'wideadunit' && data[i].cellclass != 'firstwideadunit' && data[i].cellclass != 'sponsored' && data[i].cellclass != 'imusmall' && data[i].cellclass != 'imubig' && data[i].cellclass != 'imubigsidebar') {
							cls.offset++;
						}
					}
				}

				var imagesToLoad = cls.processData(data);
				if (cls.showLimitedInfiniteScroll) {
					cls.imageLoader(imagesToLoad);

					if (cls.pdata.length == 2 || cls.location == 'article/readmore' || (cls.isArticlePage && cls.location.search('channel') == 0) || cls.type == 'popularsidebar') {
						cls.assemblePinboard();
					}

					if (data.length == 0 || (cls.pdata.length > 0 && data.length < 15) && cls.location != 'article/readmore') {
						cls.finishedPinboard = true;
						cls.assemblePinboard();
						$(cls.ID+' .ajaxloader').remove();
						$('#loadMoreContainer').remove();
					}
				}
				else {
					if (!cls.imageLoadingArray[cls.imageLoadingIndex-1]) {
						cls.assemblePinboard();
					}
					cls.imageLoader(imagesToLoad);

					if (data.length == 0 || (cls.pdata.length > 0 && data.length < 15)) {
						cls.finishedPinboard = true;
						cls.assemblePinboard();
						$(cls.ID+' .ajaxloader').remove();
					}
				}
			});
		}
	}

	cls.processData = function(data) {
		var dataArray = new Array();
		if (cls.pdata.length == 0 && cls.location.search('article') != 0) {
			var tarray = new Array();
			for (var i = 0; i < data.length; i++) {
				if (typeof data[i].cellclass !== 'undefined') {
					tarray.push(data[i]);
					if (i == data.length-1) {
						cls.pdata.push(tarray);
						cls.imageLoadingArray.push(false);
						cls.imageLoadingIndex++;
					}
				}
				else {
					cls.pdata.push(tarray);
					tarray = new Array();
				}
			}

			if (!cls.isArticlePage) {
				dataArray = cls.pdata[cls.pdata.length-1].slice();
			}
			else {
				for (var j = 0; j < cls.pdata.length-2; j++) {
					for (var k = 0; k < cls.pdata[j].length; k++) {
						dataArray.push(cls.pdata[j][k]);
					}
				}
				dataArray = dataArray.slice();
				cls.unitCount = cls.pdata.length-2;
				cls.pushOffset = cls.unitCount;
			}
		}
		else {
			cls.pdata.push(data);
			dataArray = data.slice();
		}

		var imagesToLoad = new Array();
		for (var i = 0; i < dataArray.length; i++) {
			if (typeof dataArray[i].cellclass !== 'undefined') {
				if (dataArray[i].cellclass != 'blank' && dataArray[i].cellclass != 'wideadunit' && dataArray[i].cellclass != 'imusmall' && dataArray[i].cellclass != 'imubig' && dataArray[i].cellclass != 'imubigsidebar' && dataArray[i].cellclass != 'subfeature') {
					if (dataArray[i].cellclass == 'row1x3' || dataArray[i].cellclass == 'mainfeature') {
						if (dataArray[i].featureimage) {
							imagesToLoad.push(dataArray[i].featureimage);
						}
					}
					else {
						if (dataArray[i].tilefeatureimage) {
							imagesToLoad.push(dataArray[i].tilefeatureimage);
						}
					}
				}
			}
		}
		return imagesToLoad;
	}

	cls.intentionIntercept = function(newLocation,scrollPosition,position,tiletype,thattype,toopt,tooptid) {
		var postParams = {};
		postParams.scroll = scrollPosition;
		postParams.position = position;
		postParams.tiletype = tiletype;
		postParams.thattype = thattype;

		if (postParams.tiletype == 'subfeature') {
			postParams.tiletype += ($(cls.ID+' [href="'+newLocation+'"]').index()+1);
		}

		if (cls.isArticlePage) {
			postParams.thisincid = incid;
			postParams.thistype = 'article';
		}
		else if (cls.location.search('channel') == 0) {
			postParams.thiscnlid = cls.location.split('/')[1];
			postParams.thistype = 'channel';
		}

		if (adinfo.cms.search('aut') != -1) {
			postParams.thisautid = adinfo.cms.replace('aut','');
			postParams.thistype = 'author';
		}

		if (cls.location == 'home' && cls.type != 'popularsidebar') {
			postParams.thistype = 'homepage';
		}

		if (adinfo.cms.search('col') == 0 && adinfo.video) {
			postParams.thistype = 'series';
			postParams.thisserid = adinfo.cms.replace('col','');
		}

		if (typeof toopt !== 'undefined' && typeof tooptid !== 'undefined') {
			switch (toopt) {
				case 'article':
					postParams.thatincid = tooptid;
					break;
				case 'channel':
					if (tooptid.search('series') == 0) {
						postParams.thattype = 'series';
						postParams.thatserid = tooptid.replace('series','');
					}
					else {
						postParams.thatcnlid = tooptid;
					}
					break;
				case 'author':
					postParams.thatautid = tooptid;
					break;
			}
		}

		$.post(cls.appURL+'rest/intentionintercept',postParams)
			.done(function() {
				location.href = newLocation;
			})
			.fail(function() {
				location.href = newLocation;
			});
	}

	cls.assemblePinboard = function() {
		if (!cls.ignoreAssemblyPrevention && cls.showLimitedInfiniteScroll) {
			if (cls.imageLoadingArray[cls.imageLoadingIndex] && !(((cls.isArticlePage && cls.location.search('channel') == 0) || cls.type == 'popularsidebar') && cls.firstChannelLoad)) {
				return;
			}
		}

		var currentRowWidth = 0;
		if (((cls.isArticlePage && cls.location.search('channel') == 0) || cls.type == 'popularsidebar') && cls.firstChannelLoad) {
			cls.firstChannelLoad = false;
			var j = 0;
			var x = cls.pdata[0].length;
			while (x < 10) {
				$('#particlepinboardsidebar .pinboardContent').append('<div id="particlepinboardsidebarUnit'+j+'"><div>');
				cls.unitidArray.push('#particlepinboardsidebarUnit'+j);
				var row = $('<div class="fluidrow"></div>').appendTo($('#particlepinboardsidebarUnit'+j));
				sidebarAdUnitSubCounter = 0;
				for (var i = 0; i < cls.pdata[j].length; i++) {
					currentRowWidth = 0;

					cls.pdata[j][i].pinVar = cls.ID.replace('#','');
					if (cls.type == 'popularsidebar') {
						cls.pdata[j][i].pos = 'popularsidebar';
					}
					else {
						cls.pdata[j][i].pos = 'sidebar';
					}

					if (cls.pdata[j][i].seriesid != 'NULL') {
						cls.pdata[j][i].channelid = 'series'+cls.pdata[j][i].seriesid;
					}

					if (!cls.pdata[j][i].inc_headline) {
						cls.pdata[j][i].inc_headline = '';
					}
					if (!cls.pdata[j][i].inc_deck) {
						cls.pdata[j][i].inc_deck = '';
					}

					cls.pdata[j][i].colnumber = currentRowWidth+1;
					cls.pdata[j][i].unitCount = j;
					cls.pdata[j][i].counter = cls.tileCount;
					cls.pdata[j][i].historyScript = "";
					if (typeof cls.pdata[j][i].id !== 'undefined') {
						shownArticles.push(cls.pdata[j][i].id);
						if (j == 0) {
							cls.pdata[j][i].historyScript += "history.replaceState(null,null,'"+cls.pushURL+"');"+cls.ID.replace('#','')+".updateLocalStorage("+j+',\''+cls.pushURL+"',"+cls.pdata[j][i].id+");";
						}
						else {
							cls.pdata[j][i].historyScript += "history.replaceState(null,null,'"+cls.pushURL+"/"+j+"');"+cls.ID.replace('#','')+".updateLocalStorage("+j+',\''+cls.pushURL+"',"+cls.pdata[j][i].id+");";
						}
					}

					row.append(_.template($('#'+cls.pdata[j][i].cellclass+'PTemplate').html(),cls.pdata[j][i]));
					currentRowWidth += cls.pdata[j][i].cellwidth;

					cls.tileCount++;
				}

				sidebarAdUnitCounter++;

				$('particlepinboardsidebarUnit'+j+' .pshares').sharrre({
					share: {
						facebook: true,
						twitter: true,
						linkedin: true,
						googlePlus: true
					},
					template: '<span class="psharecount">{total}</span> SHARES',
					enableHover: false,
					urlCurl: cls.appURL+'sharrre.php'
				});

				if (pushStateValue != '') {
					cls.unitCount++;
					cls.pushOffset = cls.unitCount;
				}

				j++;
				if (typeof cls.pdata[j] !== 'undefined') {
					x = cls.pdata[j].length;
				}
				else {
					break;
				}
			}

			cls.loading = false;
			$(cls.ID+' .ajaxloader').remove();
			if (pushStateValue == '') {
				triggerAds(0,0,sidebarAdUnitArray,cls);
				if (cls.type != 'popularsidebar') {
					cls.assemblePinboard();
				}
			}
			return;
		}

		if (typeof cls.pdata[cls.unitCount] === 'undefined') {
			return;
		}

		if (!cls.ignoreAssemblyPrevention && cls.showLimitedInfiniteScroll && cls.tryingToDisplayPinboardUnit && cls.location != 'article/readmore') {
			$(cls.ID+' .pinboardContent').append('<div id="'+cls.ID.replace('#','')+'Unit'+cls.unitCount+'" style="display: none;"><div>');
			cls.hiddenPinboardUnits.push(cls.ID+'Unit'+cls.unitCount)
			setTimeout(function() {
				$(cls.hiddenPinboardUnits.shift()).show();
				cls.tryingToDisplayPinboardUnit = false;
				$(cls.ID+' .ajaxloader').remove();
			},1500);
		}
		else {
			$(cls.ID+' .pinboardContent').append('<div id="'+cls.ID.replace('#','')+'Unit'+cls.unitCount+'"><div>');
		}
		cls.unitidArray.push(cls.ID+'Unit'+cls.unitCount);
		rowcount = 0;

		for (var i = 0; i < cls.pdata[cls.unitCount].length; i++) {
			if (currentRowWidth == 0 || currentRowWidth > 2) {
				if (cls.pdata[cls.unitCount][i].cellclass != 'wideadunit' && cls.pdata[cls.unitCount][i].cellclass != 'firstwideadunit' && cls.pdata[cls.unitCount][i].cellclass != 'mainfeature') {
					var row = $('<div class="fluidrow row'+rowcount+'"></div>').appendTo($(cls.ID+'Unit'+cls.unitCount));
					rowcount++;
				}
				else {
					var row = $('<div class="fluidrow '+cls.pdata[cls.unitCount][i].cellclass+'row row'+rowcount+'"></div>').appendTo($(cls.ID+'Unit'+cls.unitCount));
					rowcount++;
				}
				currentRowWidth = 0;
			}

			cls.pdata[cls.unitCount][i].pinVar = cls.ID.replace('#','');
			if (cls.location == 'article/readmore') {
				cls.pdata[cls.unitCount][i].pos = 'readmore';
			}
			else if (cls.location.search('channel') == 0 && !cls.isArticlePage && cls.unitCount == 0) {
				cls.pdata[cls.unitCount][i].pos = 'featured';
			}
			else {
				cls.pdata[cls.unitCount][i].pos = cls.type+'pinboard';
			}

			if (cls.pdata[cls.unitCount][i].seriesid != 'NULL') {
				cls.pdata[cls.unitCount][i].channelid = 'series'+cls.pdata[cls.unitCount][i].seriesid;
			}

			if (!cls.pdata[cls.unitCount][i].inc_headline) {
				cls.pdata[cls.unitCount][i].inc_headline = '';
			}
			if (!cls.pdata[cls.unitCount][i].inc_deck) {
				cls.pdata[cls.unitCount][i].inc_deck = '';
			}
			
			cls.pdata[cls.unitCount][i].colnumber = currentRowWidth+1;
			cls.pdata[cls.unitCount][i].unitCount = cls.unitCount;
			cls.pdata[cls.unitCount][i].counter = cls.tileCount;
			cls.pdata[cls.unitCount][i].historyScript = "";
			if (typeof cls.pdata[cls.unitCount][i].id !== 'undefined' && (cls.location == 'home' || cls.location.search('channel') == 0)) {
				if (cls.unitCount == 0) {
					cls.pdata[cls.unitCount][i].historyScript += "history.replaceState(null,null,'"+cls.pushURL+"');"+cls.ID.replace('#','')+".updateLocalStorage("+cls.unitCount+',\''+cls.pushURL+"',"+cls.pdata[cls.unitCount][i].id+");";
				}
				else {
					cls.pdata[cls.unitCount][i].historyScript += "history.replaceState(null,null,'"+cls.pushURL+"/"+cls.unitCount+"');"+cls.ID.replace('#','')+".updateLocalStorage("+cls.unitCount+',\''+cls.pushURL+"',"+cls.pdata[cls.unitCount][i].id+");";
				}
			}

			if (typeof cls.pdata[cls.unitCount][i].id !== 'undefined') {
				shownArticles.push(cls.pdata[cls.unitCount][i].id);
			}

			if (typeof cls.pdata[cls.unitCount][i].cellclass !== 'undefined') {
				row.append(_.template($('#'+cls.pdata[cls.unitCount][i].cellclass+'PTemplate').html(),cls.pdata[cls.unitCount][i]));
				currentRowWidth += cls.pdata[cls.unitCount][i].cellwidth;

				cls.tileCount++;
			}
		}


		$(cls.ID+'Unit'+cls.unitCount+' .pshares').sharrre({
			share: {
				facebook: true,
				twitter: true,
				linkedin: true,
				googlePlus: true
			},
			template: '<span class="psharecount">{total}</span> SHARES',
			enableHover: false,
			urlCurl: cls.appURL+'sharrre.php'
		});

		if (cls.location == 'home' || cls.location.search('channel') == 0) {
			adUnitCounter++;
			adUnitSubCounter = 0;

			if (pushStateValue == '' && (cls.unitCount == 0 || ignorePushState)) {
				if ((!cls.isArticlePage || (hasSidebar == 'false' && cls.isArticlePage)) && cls.type != 'popularsidebar') {
					triggerAds(0,0,adUnitArray,cls);
				}
				else {
					triggerAds(0,0,sidebarAdUnitArray,cls);
				}
			}
			else if (cls.unitCount == parseInt(pushStateValue)) {
				if ((!cls.isArticlePage || (cls.isArticlePage && pushStateValue >= cls.pushOffset)) && cls.type != 'popularsidebar') {
					triggerAds(parseInt(pushStateValue)-cls.pushOffset,parseInt(pushStateValue),adUnitArray,cls);
				}
				else {
					triggerAds(parseInt(pushStateValue),parseInt(pushStateValue),sidebarAdUnitArray,cls);
				}
			}
		}

		if (cls.showLimitedInfiniteScroll && cls.tryingToDisplayPinboardUnit) {
			for (var i = cls.lastScrollPosition+1; i < cls.unitidArray.length; i++) {
				if ($(cls.unitidArray[i]).length > 0) {
					if ($(window).scrollTop() > $(cls.unitidArray[i]).offset().top-$(window).height()-400) {
						if (cls.unitidArray[i].search('particle') === -1 && cls.type != 'popularsidebar') {
							triggerAds(i-cls.pushOffset,i,adUnitArray,cls);
						}
						else {
							triggerAds(i,i,sidebarAdUnitArray,cls);
						}
					}
				}
			}
		}

		cls.unitCount++;
		cls.loading = false;
		if (!cls.showLimitedInfiniteScroll) {
			$(cls.ID+' .ajaxloader').remove();
		}
	}
}
