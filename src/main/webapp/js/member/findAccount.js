var flag = false;

$(window).on("load", function(){
	
	let regexPw = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[/W_]).{8,}$/; // 알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함
	$("#newPw").on("keyup", function(){
		let resultPw = regexPw.test($("#newPw").val());
	    if (!resultPw) {
	        $("#newPw").css("border", "1px solid red");
	        $("#checkPw").html("비밀번호 형식이 맞지 않습니다. (영어 대문자, 소문자, 숫자, 특수문자 포함한 8자 이상)");
	        $("#checkPw").css({
            	"color" : "red",
            	"font-size" : "13px",
            	"padding-top" : "5px",
            	"padding-left" : "100px"
            });
	        flag = false;
	    } else {
	    	$("#newPw").css("border", "1px solid forestgreen");
	    	$("#checkPw").html("");
	    	flag = true;
	    }
	});
});

	// 아이디 찾기
	$("#findId").on("click", function(){
		let mName = $("#nameForId").val();
		let mEmail = $("#emailForId").val();
		
		$.ajax({
           type:"post",
           url:"/findId.member",
           data: {
              name: mName,
              email: mEmail
           },
        }).done(function(id){
           if(id == "null"){
              alert("아이디를 찾을 수 없습니다.");
           } else {
              alert("아이디는 " + id + "입니다.");
           }
       });
	});
	
	// 비밀번호 찾기
	$("#findPw").on("click", function(){
		let mId = $("#idForPw").val();
		let mName = $("#nameForPw").val();
		let mEmail = $("#emailForPw").val();
		
		$.ajax({
           type:"post",
           url:"/findPw.member",
           data: {
              id: mId,
              name: mName,
              email: mEmail
           },
        }).done(function(pw){
           if(pw == "null"){
              alert("비밀번호를 찾을 수 없습니다.");
           } else{
			  $("#idForPw").attr("readonly", "true");
			  $("#nameForPw").attr("readonly", "true");
			  $("#emailForPw").attr("readonly", "true");
			  $("#findPw").attr("disabled", "true");
              $("#pwBox").css("display", "block");
           }
       });
	});

	function checkRegex(){
		return flag;
	}