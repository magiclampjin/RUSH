$(document).ready(function() {
	$("#secessionBtn").on("click", function() {
		let secession = confirm("탈퇴 하시겠습니까?");
		if (secession) {
			$.ajax({
				url: "/delete.member",
				data: {
					userID: $("#userID").val()
				},
				type: "post"
			}).done(function(resp) {
				if (resp == "true") {
					alert("탈퇴 처리가 완료되었습니다.")
					$(location).attr("href", "/index.jsp");
				} else {
					alert("회원 탈퇴에 실패 하였습니다.")
				}
			})
		}
	})
})