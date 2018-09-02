
$(function () { //네비바 효과
    $('.navbar').css('background-color','rgba(0, 0, 0,0.2)');
    var lastScrollTop = 0,
        delta = 15;
        $(window).scroll(function (event) {
        var st = $(this).scrollTop();

            if (st == 0/*Math.abs(lastScrollTop - st) <= delta*/){
            	$('.navbar').css('background-color','rgba(0, 0, 0,0.2)');
            }else{
                $('.navbar').css('background-color','transparent');
            }
            if ((st > lastScrollTop) && (lastScrollTop > 0)) {
                $(".navbar").css("top", "-80px");
            } else {
                $(".navbar").css("top", "0px");
            }
        lastScrollTop = st;
            console.log(lastScrollTop);
    });
    
});
