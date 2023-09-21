document.getElementById("secret").onchange = function(){
									if($("#secret").is(":checked")){
							        	$("#secret_hidden").val("true");
							        	console.log($("#secret_hidden").val());
							        }
							        else{
							        	$("#secret_hidden").val("false");
							        	console.log($("#secret_hidden").val());
							        }
								};