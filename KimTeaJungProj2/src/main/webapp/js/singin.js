window.onload=function(){
	var pass_regEx=new RegExp(/^.*(?=^.{8,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
	var email_regExp =new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	var phone_regEx=new RegExp(/010([0-9]{4})([0-9]{4})$/);
	/*
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
			
			console.log($(this).val().length)
			if(phone_regEx.test($(this).val())){
				$(this).addClass('bg-success');
				$(this).removeClass('bg-warning');
			}else{
				$(this).addClass('bg-warning');
				$(this).removeClass('bg-success');
			}
	});
	
	$('#password').on('focusout',function(){
			
			if(pass_regEx.test($(this).val())){
				$(this).addClass('bg-success');
				$(this).removeClass('bg-warning');
			}else{
				$(this).addClass('bg-warning');
				$(this).removeClass('bg-success');
			}
	});
	$('#passwordConfirmation').on('focusout',function(){
		if($(this).val()==$('#password').val()){
				$(this).addClass('bg-success');
				$(this).removeClass('bg-warning');
			}else{
				$(this).addClass('bg-warning');
				$(this).removeClass('bg-success');
			}	
		
	});
	$('input[name=gender]').on('change',function(){
		console.log($(this).val())
	});
	
	$('input[name=inter]').on('click',function(){
		var g="";
		
		$('input[name=inter]').each(function(){
			
			if($('input[name=inter]').is("checked") == true) {
				console.log($('input[name=inter]').val());
				g+=item+",";
			}
			
		});
		
		$('input:checkbox[name=inter]:checked').each(function(){
			
			console.log($(this).val());
		})
		
		//($('input:checkbox[name=inter]').val());
	});
	*/
	$('input[type=submit]').on('click',function(e){
		
		if(!email_regExp.test($('#email').val())){
			alert("이메일을 확인해 주세요");
			$('#email').focus();
			e.preventDefault();
		}else if(!phone_regEx.test($('#phoneNumber').val())){
			console.log(phone_regEx.test($('#phoneNumber').val()))
			alert("전화번호를 확인해 주세요");
			$('#phone').focus();
			e.preventDefault();
		}else if(!$('#name').length){
			alert("이름을 입력하세요");
			$('#name').focus();
			e.preventDefault();
		}else if(!pass_regEx.test($('#password').val())){
			alert("비밀번호는 !@#$%^&+=을포함 8자 이상을 작성해주세요");
			$('#password').focus();
			e.preventDefault();
		}else if(!($('#password').val()==$('#passwordConfirmation').val())){
			alert("비밀번호가 같지 않습니다");
			$('#passwordConfirmation').focus();
			e.preventDefault();
			console.log($('input:checkbox[name=inter]:checked').val())
		}else if($('input[name=gender]:checked').val()==undefined){
			alert("성별을 선택해주세요");
			e.preventDefault();
		}else if($('input:checkbox[name=inter]:checked').val()==undefined){
			alert("관심사항을 선택해주세요");
			e.preventDefault();
		}else if($("textarea[name=self]").val().length==0){
			alert("자기소개를 작성해주세요");
			e.preventDefault();
		}
			
	});
}