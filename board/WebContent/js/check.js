$(document).ready(function(){
	$("form").submit(function(){
		if($("#writer").val()==""){
			alert("작성자 입력");
			$("#writer").focus();
			return false;
			
		}
		if($("#subject").val()==""){
			alert("제목 입력");
			$("#subject").focus();
			return false;
			
		}
		if($("#email").val()==""){
			alert("이메일 입력");
			$("#email").focus();
			return false;
			
		}
		if($("#content").val()==""){
			alert("내용 입력");
			$("#content").focus();
			return false;
			
		}
		if($("#passwd").val()==""){
			alert("비밀번호 입력");
			$("#passwd").focus();
			return false;
			
		}
		
	});
});