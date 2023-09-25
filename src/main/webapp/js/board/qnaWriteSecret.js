document.getElementById("secret").onchange = function(){
	if($("#secret").is(":checked")){
    	$("#secret_hidden").val("true");
    }
    else{
    	$("#secret_hidden").val("false");
    }
};