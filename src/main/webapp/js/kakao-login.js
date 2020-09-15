function kakaoLogin() {
	if (Kakao.isInitialized()) {
		console.log("카카오 연동에 성공했습니다.");
		
		Kakao.Auth.login({
			success: function(res) {
				console.log("카카오 로그인 성공", res);
				
				getKakaoAccountInfo(res);
			},
			fail: function(err) {
				console.log("카카오 로그인 실패", err);
			}
		});
	} else {
		alert("카카오 연동에 실패했습니다.");
	}
}

function getKakaoAccountInfo(res) {
	Kakao.API.request({
		url: "/v2/user/me",
		success: function(response) {
			console.log("카카오 로그인 정보 요청 성공", response);
			response.access_token = res.access_token;
			
			checkKakaoAccount(response);
		},
		fail: function(error) {
			console.log("카카오 로그인 정보 요청 실패", error);
		}
	});
}

function checkKakaoAccount(kakao_res) {
	var request = $.ajax({
		url: "/user/checkKakaoAccount.do",
		method: "get",
		data: kakao_res
	});
	
	request.done(function(data) {
		console.log(data);
		
		if (data.exist) {
			// login
			kakaoAccountLogin(kakao_res);
		} else {
			// regist
			kakaoAccountRegist(kakao_res);
		}
	});
	
	request.fail(function(error) {
		console.log("checkKakaoAccount", error);
	});
}

function kakaoAccountRegist(kakao_res) {
	var request = $.ajax({
		url: "/user/kakaoUserRegist.do",
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(kakao_res)
	});
	
	request.done(function(data) {
		console.log(data);
		
		if (data === "success") {
			kakaoAccountLogin(kakao_res);
		}
	});
	
	request.fail(function(error) {
		console.log("kakaoAccountRegist", error);
	});
}

function kakaoAccountLogin(kakao_res) {
	var request = $.ajax({
		url: "/login/kakaoUserLogin.do",
		method: "post",
		contentType: "application/json",
		data: JSON.stringify(kakao_res)
	});
	
	request.done(function(data) {
		console.log(data);	
		if (data === "success") {
			location.href = CTX + "/main/main.do";
		}
	});
	
	request.fail(function(error) {
		console.log("kakaoAccountLogin", error);
	});
}
