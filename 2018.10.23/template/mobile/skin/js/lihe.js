$(function(){
	var swiper=new Swiper('.swiper-container',{
        pagination:'.swiper-pagination',
        paginationClickable: true,
        loop:true
    });
    $(".hsrh-btn").click(function(event){
    	$(".type").toggle();
    });
})