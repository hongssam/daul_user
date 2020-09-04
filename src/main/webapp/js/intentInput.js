$(function() {	
});	


function chatbotReg(){
	
	var request = $.ajax({
		url: "/chatbot/registInputText.do",
		method: "post",
		//contentType: "application/json",
		//dataType: "json",
		data: $("#input-text-form").serialize()
	});
	request.done(function(data) {
	});
	request.fail(function(error) {
		console.log(error);
		console.log("request fail");
	});	
}


function setInputText(data){
	console.log(data);
//	if (data.length > 0) {
//		$("#input_text").val(data[0].input_text);
//	}
	
	$("#tokenfield-div").text('');
	
	var str = 
		 ' <input type="text" class="form-control tokenfield" name="input_text" id=""'+
         '        value=""' +
         '        placeholder="해당 의도(Intent)에 대한 사용자의 예상 발화를 입력해주세요." /> ';
	$("#tokenfield-div").append(str);
	
	let tokenfield = $(".input-box .tokenfield");
	
	if(data == "nodata"){
	    tokenfield[0].value = "안녕|안녕하세요";
	    tokenfield.tokenfield({ delimiter: '|' }); 
	    $("#input_text").val("안녕|안녕하세요");
	}else{
		tokenfield[0].value = data[0].input_text;
	    tokenfield.tokenfield({ delimiter: '|' }); 
	    $("#input_text").val(data[0].input_text);
	}
}
