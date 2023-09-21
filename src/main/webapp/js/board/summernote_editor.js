$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: '게시글을 입력해주세요',
		tabsize: 2,
		minHeight: 700,
		maxHeight: 1000,
		focus: true,
		lang: 'ko-KR',
		callbacks: {
			onImageUpload: function(files) {
				let formData = new FormData();
				for (let i = 0; i < files.length; i++) {
					console.log(i)
					formData.append("image", files[i])
				}
				$.ajax({
					url: "/insert.file",
					method: "post",
					data: formData,
					processData: false,
					contentType: false,
					dataType: "json",
				}).done(function(resp) {
					console.log(resp.legnth)
					for (let i = 0; i < resp.legnth; i++) {
						console.log(resp[i])
						let img = $("<img>");
						console.log(img + "이미지 태ㄱ")
						img.attr("src", resp[i]);
						console.log(img)
						$("#summernote").summernote('insertNode', img[0]);
					}
				});
			}
		}
	});

	let count = 0;

	$("#btnAdd").on("click", function() {
		console.log("b")
		if ($("input[type=file]").length > 5) {
			alert("파일은 5개까지 첨부 가능합니다.");
			return false;
		}

		let fileDiv = $("<div>");
		let fileInput = $("<input>");
		fileInput.css("display", "inline");
		fileInput.css("margin-top", "10px");
		fileInput.attr("type", "file");
		fileInput.attr("name", "file" + (count++));

		let btnX = $("<input>");
		btnX.attr("value", "x");
		btnX.attr("type", "button");
		btnX.css("border", "none");
		btnX.css("width", "30px");
		btnX.css("height", "30px");

		btnX.addClass("del");

		fileDiv.append(fileInput);
		fileDiv.append(btnX);

		$("#fileContainer").append(fileDiv);

	})

	$(document).on("click", ".del", function() {
		$(this).closest("div").remove();
	})

	$("#boardForm").on("submit", function() {
		if ($("#title").val() == "") {
			$("#title").css("background-color", "pink")
			return false;
		}
		if ($("#content").val() == "") {
			$('#content').focus();
			$(".note-editor").css("background-color", "pink")
			return false;
		}
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		//스마트 에디터 값을 텍스트컨텐츠로 전달
		//var content = document.getElementById("smartEditor").value;
	})
});

