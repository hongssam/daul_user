<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<div class="page">
<!-- 
test
<form id="form"> 
	<input type="text" name="intent_id" value="IT-0037"/> 
	<input type="text" name="cardList[0][type]" value="text"/> 
	<input type="text" name="cardList[0][position]" value="0"/> 
	<input type="text" name="cardList[0][trans_type]" value="1"/> 
	<input type="text" name="cardList[0][card][0][content]" value="첫번째 리스트의 첫번째카드 내용입니다.이런저런 저런이런 내용의 카드입니다."/> 
	<input type="text" name="cardList[0][card][0][position]" value="0"/> 
	<input type="text" name="cardList[0][card][0][button][0][name]" value="text.btn1_1_name"/> 
	<input type="text" name="cardList[0][card][0][button][0][position]" value="0"/> 
	<input type="text" name="cardList[0][card][0][button][1][name]" value="text.btn1_2_name"/> 
	<input type="text" name="cardList[0][card][0][button][1][position]" value="1"/> 
	<input type="text" name="cardList[0][card][1][content]" value="첫번째 리스트의 두번째카드 내용입니다.이런저런 저런이런 내용의 카드입니다."/> 
	<input type="text" name="cardList[0][card][1][position]" value="1"/> 
	<input type="text" name="cardList[0][card][1][button][0][name]" value="text.btn2_1_name"/> 
	<input type="text" name="cardList[0][card][1][button][0][position]" value="0"/> 
	<input type="text" name="cardList[0][card][1][button][1][name]" value="text.btn2_2_name"/> 
	<input type="text" name="cardList[0][card][1][button][1][position]" value="1"/> 
	<br/>
	<br/>
	<input type="text" name="cardList[1][type]" value="list"/> 
	<input type="text" name="cardList[1][trans_type]" value="2"/> 
	<input type="text" name="cardList[1][position]" value="1"/> 
	<input type="text" name="cardList[1][card][0][title]" value="두번째리스의 첫번째카드 제목입니다.AEWFAWEFAWEF!@#!@#!@."/> 
	<input type="text" name="cardList[1][card][0][position]" value="0"/> 
	<input type="text" name="cardList[1][card][0][list][0][title]" value="두번째리스트의 첫번째카드의 첫뻔째 리스트 제목"/> 
	<input type="text" name="cardList[1][card][0][list][0][content]" value="두번째리스트의 첫번째카드의 첫뻔째 리스트 내용"/> 
	<input type="text" name="cardList[1][card][0][list][0][img]" value="두번째리스트의 첫번째카드의 첫뻔째 리스트 이미지"/> 
	<input type="text" name="cardList[1][card][0][list][0][position]" value="0"/> 
	<input type="text" name="cardList[1][card][0][list][1][title]" value="두번째리스트의 첫번째카드의 두뻔째 리스트 제목"/> 
	<input type="text" name="cardList[1][card][0][list][1][content]" value="두번째리스트의 첫번째카드의 두뻔째 리스트 내용"/> 
	<input type="text" name="cardList[1][card][0][list][1][img]" value="두번째리스트의 첫번째카드의 두뻔째 리스트 이미지"/> 
	<input type="text" name="cardList[1][card][0][list][1][position]" value="1"/> 
	<input type="text" name="cardList[1][card][0][button][0][name]" value="list.btn1_1_name"/> 
	<input type="text" name="cardList[1][card][0][button][0][position]" value="0"/> 
	<input type="text" name="cardList[1][card][0][button][1][name]" value="list.btn1_2_name"/> 
	<input type="text" name="cardList[1][card][0][button][1][position]" value="1"/> 
	<br/>
	<br/>
	<input type="text" name="cardList[2][type]" value="img"/> 
	<input type="text" name="cardList[2][trans_type]" value="2"/> 
	<input type="text" name="cardList[2][position]" value="2"/> 
	<input type="text" name="cardList[2][card][0][img]" value="3번째리스트의 첫번째카드 이미지"/>
	<input type="text" name="cardList[2][card][0][position]" value="30"/>
	<input type="text" name="cardList[2][card][1][img]" value="3번째리스트의 두번째카드 이미지"/>
	<input type="text" name="cardList[2][card][0][position]" value="1"/>
	<input type="text" name="cardList[2][card][2][img]" value="3번째리스트의 세번째카드 이미지"/>
	<input type="text" name="cardList[2][card][0][position]" value="2"/>
	<br/>
	<br/>
	<input type="text" name="cardList[3][type]" value="card"/> 
	<input type="text" name="cardList[3][trans_type]" value="1"/> 
	<input type="text" name="cardList[3][position]" value="3"/> 
	<input type="text" name="cardList[3][card][0][img]" value="4번째리스트의 첫번째카드 이미지"/>
	<input type="text" name="cardList[3][card][0][title]" value="4번째리스트의 첫번째카드 제목"/>
	<input type="text" name="cardList[3][card][0][content]" value="4번째리스트의 첫번째카드 내용"/>
	<input type="text" name="cardList[3][card][0][position]" value="0"/>
	<input type="text" name="cardList[3][card][0][button][0][name]" value="card.btn1_1_name"/> 
	<input type="text" name="cardList[3][card][0][button][0][position]" value="0"/> 
	<input type="text" name="cardList[3][card][0][button][1][name]" value="card.btn1_2_name"/> 
	<input type="text" name="cardList[3][card][0][button][1][position]" value="1"/> 
	<br/>
	<br/>
	<input type="text" name="cardList[4][type]" value="skill"/>
	<input type="text" name="cardList[4][position]" value="4"/>
	<input type="text" name="cardList[4][card][0][position]" value ="0"/>
	<input type="text" name="cardList[4][card][0][skill_item_id]" value="스킬아이디"/>
	<br/>
	<br/>
	<input type="text" name="cardList[5][type]" value="direct"/>
	<input type="text" name="cardList[5][position]" value="5"/>
	<input type="text" name="cardList[5][card][0][position]" value ="0"/>
	<input type="text" name="cardList[5][card][0][button][0][name]" value="버튼이"/>
	<input type="text" name="cardList[5][card][0][button][0][position]" value="0"/>
	<input type="text" name="cardList[5][card][0][button][0][function1]" value="버튼왼쪽기능"/>
	<input type="text" name="cardList[5][card][0][button][0][function2]" value="버튼오른쪽기능"/>
	
</form>

<button type="button" id="serialized-btn"> btn </button>

<button type="button" id="getResponeList-btn"> 가져오기 </button>
 -->

</div>

<script type="text/javascript">
	$(function() {
		var obj = $("#form").serializeObject();
		console.log(obj);
	});
		
	$("#serialized-btn").click(function(){
		var obj = $("#form").serializeObject();
		serializedObj(obj);
	});
	
	$("#getResponeList-btn").click(function(){
		
		getResponeList();
	});

	
	function serializedObj(obj){
		
		var request = $.ajax({
			url: "/chatbot/serializedObj.do",
			method: "post",
			contentType: "application/json",
			//dataType: "json",
			data: JSON.stringify(obj)
		});
		request.done(function(data) {
			
			console.log(data);
			//location.href = "/chatbot/intentListPage.do";
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});	
	}
	
	function getResponeList(){
		var request = $.ajax({
			url: "/chatbot/getRespone.do?intent_id=IT-0037",
			method: "get",

		});
		request.done(function(data) {
			
			console.log(data);
			//location.href = "/chatbot/intentListPage.do";
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});	
	};
	
</script>

<script src="${pageContext.request.contextPath}/js/jquery.serialize-object.js"></script> 
    