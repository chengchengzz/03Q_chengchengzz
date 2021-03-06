(function($){$.fn.lightBox=function(settings){settings=jQuery.extend({overlayBgColor:'#000',overlayOpacity:0.8,fixedNavigation:false,imageLoading:'',imageBtnPrev:'',imageBtnNext:'',imageBtnClose:'',imageBlank:'',containerBorderSize:10,containerResizeSpeed:400,txtImage:'Image',txtOf:'of',keyToClose:'c',keyToPrev:'p',keyToNext:'n',imageArray:[],activeImage:0},settings);var jQueryMatchedObj=this;function _initialize(){_start(this,jQueryMatchedObj);return false}function _start(objClicked,jQueryMatchedObj){$('embed, object, select').css({'visibility':'hidden'});_set_interface();settings.imageArray.length=0;settings.activeImage=0;if(jQueryMatchedObj.length==1){settings.imageArray.push(new Array(objClicked.getAttribute('href'),objClicked.getAttribute('title')))}else{for(var i=0;i<jQueryMatchedObj.length;i++){settings.imageArray.push(new Array(jQueryMatchedObj[i].getAttribute('href'),jQueryMatchedObj[i].getAttribute('title')))}}while(settings.imageArray[settings.activeImage][0]!=objClicked.getAttribute('href')){settings.activeImage++}_set_image_to_view()}function _set_interface(){$('body').append('<div id="jquery-overlay"></div><div id="jquery-lightbox"><div id="lightbox-container-image-box"><div id="lightbox-container-image"><img id="lightbox-image"><div style="" id="lightbox-nav"><a href="#" id="lightbox-nav-btnPrev"></a><a href="#" id="lightbox-nav-btnNext"></a></div><div id="lightbox-loading"><a href="#" id="lightbox-loading-link"><img src="'+settings.imageLoading+'"></a></div></div></div><div id="lightbox-container-image-data-box"><div id="lightbox-container-image-data"><div id="lightbox-image-details"><span id="lightbox-image-details-caption"></span><span id="lightbox-image-details-currentNumber"></span></div><div id="lightbox-secNav"><a href="#" id="lightbox-secNav-btnClose"><img src="'+settings.imageBtnClose+'"></a></div></div></div></div>');var arrPageSizes=___getPageSize();$('#jquery-overlay').css({backgroundColor:settings.overlayBgColor,opacity:settings.overlayOpacity,width:arrPageSizes[0],height:arrPageSizes[1]}).fadeIn();var arrPageScroll=___getPageScroll();$('#jquery-lightbox').css({top:arrPageScroll[1]+(arrPageSizes[3]/10),left:arrPageScroll[0]}).show();$('#jquery-overlay,#jquery-lightbox').click(function(){_finish()});$('#lightbox-loading-link,#lightbox-secNav-btnClose').click(function(){_finish();return false});$(window).resize(function(){var arrPageSizes=___getPageSize();$('#jquery-overlay').css({width:arrPageSizes[0],height:arrPageSizes[1]});var arrPageScroll=___getPageScroll();$('#jquery-lightbox').css({top:arrPageScroll[1]+(arrPageSizes[3]/10),left:arrPageScroll[0]})})}function _set_image_to_view(){$('#lightbox-loading').show();if(settings.fixedNavigation){$('#lightbox-image,#lightbox-container-image-data-box,#lightbox-image-details-currentNumber').hide()}else{$('#lightbox-image,#lightbox-nav,#lightbox-nav-btnPrev,#lightbox-nav-btnNext,#lightbox-container-image-data-box,#lightbox-image-details-currentNumber').hide()}var objImagePreloader=new Image();objImagePreloader.onload=function(){$('#lightbox-image').attr('src',settings.imageArray[settings.activeImage][0]);_resize_container_image_box(objImagePreloader.width,objImagePreloader.height);objImagePreloader.onload=function(){}};objImagePreloader.src=settings.imageArray[settings.activeImage][0]};function _resize_container_image_box(intImageWidth,intImageHeight){var intCurrentWidth=$('#lightbox-container-image-box').width();var intCurrentHeight=$('#lightbox-container-image-box').height();var intWidth=(intImageWidth+(settings.containerBorderSize*2));var intHeight=(intImageHeight+(settings.containerBorderSize*2));var intDiffW=intCurrentWidth-intWidth;var intDiffH=intCurrentHeight-intHeight;$('#lightbox-container-image-box').animate({width:intWidth,height:intHeight},settings.containerResizeSpeed,function(){_show_image()});if((intDiffW==0)&&(intDiffH==0)){if($.browser.msie){___pause(250)}else{___pause(100)}}$('#lightbox-container-image-data-box').css({width:intImageWidth});$('#lightbox-nav-btnPrev,#lightbox-nav-btnNext').css({height:intImageHeight+(settings.containerBorderSize*2)})};function _show_image(){$('#lightbox-loading').hide();$('#lightbox-image').fadeIn(function(){_show_image_data();_set_navigation()});_preload_neighbor_images()};function _show_image_data(){$('#lightbox-container-image-data-box').slideDown('fast');$('#lightbox-image-details-caption').hide();if(settings.imageArray[settings.activeImage][1]){$('#lightbox-image-details-caption').html(settings.imageArray[settings.activeImage][1]).show()}if(settings.imageArray.length>1){$('#lightbox-image-details-currentNumber').html(settings.txtImage+' '+(settings.activeImage+1)+' '+settings.txtOf+' '+settings.imageArray.length).show()}}function _set_navigation(){$('#lightbox-nav').show();$('#lightbox-nav-btnPrev,#lightbox-nav-btnNext').css({'background':'transparent url('+settings.imageBlank+') no-repeat'});if(settings.activeImage!=0){if(settings.fixedNavigation){$('#lightbox-nav-btnPrev').css({'background':'url('+settings.imageBtnPrev+') left 15% no-repeat'}).unbind().bind('click',function(){settings.activeImage=settings.activeImage-1;_set_image_to_view();return false})}else{$('#lightbox-nav-btnPrev').unbind().hover(function(){$(this).css({'background':'url('+settings.imageBtnPrev+') left 15% no-repeat'})},function(){$(this).css({'background':'transparent url('+settings.imageBlank+') no-repeat'})}).show().bind('click',function(){settings.activeImage=settings.activeImage-1;_set_image_to_view();return false})}}if(settings.activeImage!=(settings.imageArray.length-1)){if(settings.fixedNavigation){$('#lightbox-nav-btnNext').css({'background':'url('+settings.imageBtnNext+') right 15% no-repeat'}).unbind().bind('click',function(){settings.activeImage=settings.activeImage+1;_set_image_to_view();return false})}else{$('#lightbox-nav-btnNext').unbind().hover(function(){$(this).css({'background':'url('+settings.imageBtnNext+') right 15% no-repeat'})},function(){$(this).css({'background':'transparent url('+settings.imageBlank+') no-repeat'})}).show().bind('click',function(){settings.activeImage=settings.activeImage+1;_set_image_to_view();return false})}}_enable_keyboard_navigation()}function _enable_keyboard_navigation(){$(document).keydown(function(objEvent){_keyboard_action(objEvent)})}function _disable_keyboard_navigation(){$(document).unbind()}function _keyboard_action(objEvent){if(objEvent==null){keycode=event.keyCode;escapeKey=27}else{keycode=objEvent.keyCode;escapeKey=objEvent.DOM_VK_ESCAPE}key=String.fromCharCode(keycode).toLowerCase();if((key==settings.keyToClose)||(key=='x')||(keycode==escapeKey)){_finish()}if((key==settings.keyToPrev)||(keycode==37)){if(settings.activeImage!=0){settings.activeImage=settings.activeImage-1;_set_image_to_view();_disable_keyboard_navigation()}}if((key==settings.keyToNext)||(keycode==39)){if(settings.activeImage!=(settings.imageArray.length-1)){settings.activeImage=settings.activeImage+1;_set_image_to_view();_disable_keyboard_navigation()}}}function _preload_neighbor_images(){if((settings.imageArray.length-1)>settings.activeImage){objNext=new Image();objNext.src=settings.imageArray[settings.activeImage+1][0]}if(settings.activeImage>0){objPrev=new Image();objPrev.src=settings.imageArray[settings.activeImage-1][0]}}function _finish(){$('#jquery-lightbox').remove();$('#jquery-overlay').fadeOut(function(){$('#jquery-overlay').remove()});$('embed, object, select').css({'visibility':'visible'})}function ___getPageSize(){var xScroll,yScroll;if(window.innerHeight&&window.scrollMaxY){xScroll=window.innerWidth+window.scrollMaxX;yScroll=window.innerHeight+window.scrollMaxY}else if(document.body.scrollHeight>document.body.offsetHeight){xScroll=document.body.scrollWidth;yScroll=document.body.scrollHeight}else{xScroll=document.body.offsetWidth;yScroll=document.body.offsetHeight}var windowWidth,windowHeight;if(self.innerHeight){if(document.documentElement.clientWidth){windowWidth=document.documentElement.clientWidth}else{windowWidth=self.innerWidth}windowHeight=self.innerHeight}else if(document.documentElement&&document.documentElement.clientHeight){windowWidth=document.documentElement.clientWidth;windowHeight=document.documentElement.clientHeight}else if(document.body){windowWidth=document.body.clientWidth;windowHeight=document.body.clientHeight}if(yScroll<windowHeight){pageHeight=windowHeight}else{pageHeight=yScroll}if(xScroll<windowWidth){pageWidth=xScroll}else{pageWidth=windowWidth}arrayPageSize=new Array(pageWidth,pageHeight,windowWidth,windowHeight);return arrayPageSize};function ___getPageScroll(){var xScroll,yScroll;if(self.pageYOffset){yScroll=self.pageYOffset;xScroll=self.pageXOffset}else if(document.documentElement&&document.documentElement.scrollTop){yScroll=document.documentElement.scrollTop;xScroll=document.documentElement.scrollLeft}else if(document.body){yScroll=document.body.scrollTop;xScroll=document.body.scrollLeft}arrayPageScroll=new Array(xScroll,yScroll);return arrayPageScroll};function ___pause(ms){var date=new Date();curDate=null;do{var curDate=new Date()}while(curDate-date<ms)};return this.unbind('click').click(_initialize)}})(jQuery);
// JavaScript Document

jQuery(function(){
	
	//init kv and teasers
	(function(){
		var $kv = jQuery('.js_nf_hp_kv')
		var $kv_window = $kv.find('.js_window');
		var $kv_items = $kv.find('.kv_item')
		var $kv_nav = jQuery('.js_nav ul');
		var $kv_prev = jQuery('.js_btn_prev');
		var $kv_next = jQuery('.js_btn_next');
		var kv_items_count = $kv_items.length;
		
		var $ts = jQuery('.js_nf_hp_teaser_c3x')
		var $ts_groups = $ts.find('.js_t_group');
		
		var animate_dur = 500;
		var play_dur = 5000;
		
		var stop_flag = false;
		
		var $window = jQuery(window);
		
		var cur_idx = 0;
		
		
				
		$kv_items.hide();
		$ts_groups.find('.t_item').hide();
		var goto = function( idx ){
			
			cur_idx = idx;
			
			//idx from 0
			var $kv_visible = $kv_items.filter(':visible');

			if ( $kv_visible.length ){
				$kv_visible.fadeOut(animate_dur);
				$kv_items.eq(idx).fadeIn(animate_dur);
			}else{
				$kv_items.eq(idx).show();
			}
			
			$ts_groups.each(function(g_idx){
				var $ts_group = jQuery(this);
				var $ts_items = $ts_group.find('.t_item');
				var $ts_visible = $ts_items.filter(':visible');

				if ( $ts_visible.length ){
					$ts_visible.css({'z-index':99});
					
					window.setTimeout(function(){
						$ts_items.eq(idx).css({'top':'158px','z-index':100}).show().animate({'top':0},animate_dur,function(){
							$ts_visible.hide();
						});
					}, 80*g_idx );
					
				}else{
					$ts_items.eq(idx).show();
				}
			});
			
			$kv_nav.find('li').eq(idx).addClass('active').siblings().removeClass('active');
			
		}
		
		//init $kv_prev $kv_next
		$kv_prev.click(function(){
			var next_idx = cur_idx - 1;
			if ( next_idx < 0 ){
				next_idx = kv_items_count - 1;
			}
			goto( next_idx );
		});

		$kv_next.click(function(){
			var next_idx = cur_idx + 1;
			if ( next_idx >= kv_items_count ){
				next_idx = 0;
			}
			goto( next_idx );
		});		
		
		//init $nav
		for ( var i=0; i<kv_items_count; i++ ){
			var $li = jQuery('<li><a href="javascript:;">'+ ( i+1 ) +'</a></li>');
			
			(function(){
				var cur_idx = i;
				$li.click(function(){
					goto(cur_idx);
				});
			})();
			
			$kv_nav.append($li);
			//$li.css('width',100/(kv_items_count)-0.4+'%')
		}
		//$kv_nav.css('margin-left',-(kv_items_count*10));
		
		//init kv_item
		$kv_items.each(function(){
			var $this_kv_item = jQuery(this);
			var this_bg = $this_kv_item.data('bg');
			$this_kv_item.css('background-image','url('+this_bg+')').css('background-position','center top');
		});
		
		//init btn_nav
		var repos_btn_nav = function(){
			var offset = $kv.offset();
			//$kv_prev.css( 'left',-60 );
			//$kv_next.css( 'right',600 );
			
//			$kv_prev.css( 'left',-offset.left );
//			$kv_next.css( 'right',-offset.left );
		}
		$window.resize(function(){
			repos_btn_nav();
		});
		


		$kv.hover(function(){
			stop_flag = true;
		},function(){
			stop_flag = false;
		});

		$ts.hover(function(){
			stop_flag = true;
		},function(){
			stop_flag = false;
		});	
		
		window.setInterval(function(){
			if ( !stop_flag ){
				$kv_next.click();
			}
		},play_dur);
		
		
		
		repos_btn_nav();
		goto(cur_idx);
		
	})();
	
	
	/* js_nf_ts_dot_tab */
	jQuery('.js_nf_ts_dot_tab').each(function(){
		var $_root = jQuery(this);
		var $tabs = $_root.find('.js_dt_tabs > a');
		var $contents = $_root.find('.js_dt_contents .dt_content').hide();
		
		$tabs.each(function(idx){
			var $this_tab = jQuery(this);
			var $this_content = $contents.eq(idx);
			$this_tab.click(function(){
				$this_content.show().siblings().hide();
				$this_tab.addClass('active').siblings().removeClass('active');
			});
		}).eq(0).click();
	});

	/* js_nf_ts_text_tab */
	jQuery('.js_nf_ts_text_tab').each(function(){
		var $_root = jQuery(this);
		var $tabs = $_root.find('.js_tt_tabs > a');
		var $contents = $_root.find('.js_tt_contents .tt_content').hide();
		
		$tabs.each(function(idx){
			var $this_tab = jQuery(this);
			var $this_content = $contents.eq(idx);
			$this_tab.click(function(){
				$this_content.show().siblings().hide();
				$this_tab.addClass('active').siblings().removeClass('active');
			});
		}).eq(0).click();
	});	
	
	
})