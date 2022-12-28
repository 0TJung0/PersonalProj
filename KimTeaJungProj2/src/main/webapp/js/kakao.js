window.onload=function(){
	Kakao.init('1562cf0d70610228c4bb3f46255ade38'); 
  //function kakaoLogin() {
	var btn=document.querySelector("#kakao-login-btn");
	btn.addEventListener("click",function(){
	    window.Kakao.Auth.login({
	        scope: 'account_ci,profile_nickname,profile_image,account_email, age_range, birthday,phone_number', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
	        success: function(response) {
	            console.log(response) // 로그인 성공하면 받아오는 데이터
	            window.Kakao.API.request({ // 사용자 정보 가져오기 
	                url: '/v2/user/me',
	                success: (res) => {
	                    var kakao_account = res.kakao_account;
	                    var email = res.kakao_account.email;
	                    var age_range = res.kakao_account.age_range;
	                    
	                    console.log(kakao_account);
	                    console.log(email);
	                    console.log(age_range);
	                    location.href="#";
	                }
	            });
	            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
	        },
	        fail: function(error) {
	            console.log(error);
	        }
	    });
	});
}