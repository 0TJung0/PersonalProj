window.onload=function(){
	$('#name').on('focusout',function(){
		console.log($(this).val().length)
		if($(this).val().length==0){
			//$(this).addClass('wrongInput');
			//alert('이름을좀 입력하셈');
			$(this).css("background-color","red");
		}else{
			//$(this).removeClass('wrongInput');
			$(this).css("background-color","green");
		}
		
	});	
	$('#phoneNumber').on('focusout',function(){
			var regEx=/010([0-9]{4})([0-9]{4})$/;
			console.log($(this).val().length)
			if(regEx.text($(this).val())){
				$(this).addClass('bg-success');
				$(this).removeClass('bg-warning');
			}else{
				$(this).addClass('bg-warning');
				$(this).removeClass('bg-success');
			}
	});
}