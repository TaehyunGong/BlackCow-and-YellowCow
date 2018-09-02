$(function () { //네비바 효과
    var lastScrollTop = 0,
        delta = 15;
        $(window).scroll(function (event) {
        	$('.hover-nav').css('height','0px').css('display','none');
        	
        	var st = $(this).scrollTop();

            if (st == 0){
            	$('.navbar').css('background-color','rgb(74, 158, 60, 1)');
            }else{
            	$('.navbar').css('background-color','rgb(74, 158, 60, 0.8)');
            }
            if ((st > lastScrollTop) && (lastScrollTop > 0)) {
                $(".navbar").css("top", "-80px");
            } else {
                $(".navbar").css("top", "0px");
            }
        lastScrollTop = st;
    });
    
    $('.navbar').hover(function(){
		$('.hover-nav').css('background-color','rgb(74, 158, 60)');
		$('.hover-nav').css('height','140px');//.css('opacity','1');
		$('.hover-nav').css('display','block');
		$('.hover-nav div a').css('display','block');
    },function(){
    	$('.hover-nav').css('height','0px');//.css('opacity','0');
    	$('.hover-nav').css('display','none');
    	$('.hover-nav div a').css('display','none');
    })
    
   /* $('#sign').mouseenter(function(){
    	$('.hover-nav').css('height','0px').css('opacity','0');
    })*/
});