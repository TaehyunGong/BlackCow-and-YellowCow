/**
 * 
 */


var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demo");

			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";

		}
		
		
		// 찜 버튼
		
		$(function(){
			
			
			
			$(".dofunding i[name=heart]").data("flag","false");

			$(".dofunding i[name=heart]").click(function(){
				
	
						var bflag = $(".dofunding i[name=heart]").data("flag");
						
						if(bflag == "false"){
							bflag = "true";
							$(".dofunding i[name=heart]").removeClass("far fa-heart");
							$(".dofunding i[name=heart]").addClass("fas fa-heart");
						}else{
							bflag = "false";
							$(".dofunding i[name=heart]").removeClass("fas fa-heart");
							$(".dofunding i[name=heart]").addClass("far fa-heart");
						}
						
						$(".dofunding i[name=heart]").data("flag",bflag);
		
				
			});
		});