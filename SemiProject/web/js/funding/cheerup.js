/**
 * 
 */


$(function() {
    $('.replyContent').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.7) + 'em');
        $('#counter').html(content.length + '/500');
    });
    $('#content').keyup();
});


/*function replyWrite(num){
	
	var re = document.getElementById("replynumber" + num);
	
	
	if(re.style.display == 'none'){
		 re.style.display = "block";
		 location.href=""
    } else {
        re.style.display = "none";
    }
}*/




