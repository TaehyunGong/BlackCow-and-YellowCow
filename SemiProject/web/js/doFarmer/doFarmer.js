/**
 * 
 */


	function oneCheck(val) {

			var obj = document.getElementsByName("checkbox1");
			

			for (var i = 0; i < obj.length; i++) {

				if (obj[i] != val) {

					obj[i].checked = false;

				}

			}

		}

		function checkForm() {
			var form = document.forms.check;
			var sel = "";

		
			for (var i = 0; i < form.length; i++) {
				if (form[i].type == "checkbox") {
					
				if(form[i].value == "동의"){
					
					if (form[i].checked == true) {
						sel++;
					}
				}
					
					
				}
			}

			if (!sel) {
				alert("약관동의 후 신청이 가능합니다.");
				return false;
			}
			
			
		}