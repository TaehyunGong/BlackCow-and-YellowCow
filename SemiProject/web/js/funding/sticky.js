/**
 * 
 */

// 탭 메뉴 스크롤
window.onscroll = function() {
	scrollFunction()
	myFunction()
	
};

var navbar = document.getElementById("tabMenu");
var sticky = navbar.offsetTop;


function myFunction() {
	if (window.pageYOffset >= sticky) {
		navbar.classList.add("sticky");
		
		
	} else {
		navbar.classList.remove("sticky");
	
		
	}
}
	
	function scrollFunction() {
	    if (document.body.scrollTop > 1200 || document.documentElement.scrollTop > 1200) {
	        document.getElementById("myBtn").style.display = "block";
	    } else {
	        document.getElementById("myBtn").style.display = "none";
	    }
	
	
}



// 메뉴 엑티브
function category(evt) {
	
    var i, tablinks;
  	tablinks = document.getElementsByClassName("tablinks");
  	
  	
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    
    evt.currentTarget.className += " active";

}




//메인 메뉴바와 안 겹치기
$(function () {
   
    var lastScrollTop = 0,
        delta = 15;
        $(window).scroll(function (event) {
        var st = $(this).scrollTop();

            if (st == 0){
               
                $("#tabMenu").show();
            }else{
              
                $("#tabMenu").show();
            }
            if ((st > lastScrollTop) && (lastScrollTop > 0)) {
            	
            	
            } else {
            	
            	
            	if(st <= 1200){
                	 $("#tabMenu").show();
                }else{
                	$("#tabMenu").fadeOut();
                }
                
                
                
            }
        lastScrollTop = st;
            console.log(lastScrollTop);
    });
    
});