$(document).ready(function() {


	function replyReload(postSeq) {
		$.ajax({
			url: "/load.reply",
			data: {
				postSeq: postSeq
			},
			dataType: "json",
			type: "post"
		}).done(function(resp) {
			let postWriter = $("#postWriterName").val();
			let loginID = $("#loginID").val();
			let replys = $("#replys");
			for (let i = 0; i < resp.length; i++) {

				let replyTag = $("<div>").attr("class", "col-12 reply");
				let row = $("<div>").attr("class", "row g-0");
				let col10 = $("<div>").attr("class", "col-10");
				let writerCover = $("<div>").attr("class", "d-flex align-items-end mb10").append($("<div>").attr("class", "writer fw500 fs20").html(resp[i].nickName));
				if (resp[i].writer == postWriter) {
					let isWriterTag = $("<div>").attr("class", "isWriter colorWhite bColorBlue fw400 fs15").html("작성자");
					writerCover.append(isWriterTag);
				}
				let contents = $("<div>").attr("class", "contents fw400 fs20 mb10").html(resp[i].contents).attr("contenteditable", "false");;
				let detailInfo = $("<div>").attr("class", "replyDetailInfo fw400 fs15 colorDarkgray").html(resp[i].writeDate + "&nbsp;&nbsp;");
				let nestedReplyPrintBtn = $("<a>").attr("class", "nestedReplyPrintBtn colorDarkgray").html("답글 보기");
				let nestedReplyBtn = $("<a>").attr("class", "nestedReplyBtn colorDarkgray").html("답글 쓰기");

				detailInfo.append(nestedReplyPrintBtn).append(nestedReplyBtn);

				row.append(col10.append(writerCover).append(contents).append(detailInfo));
				let replyBtns;
				if (resp[i].writer == loginID) {
					replyBtns = $("<div>").attr("class", "col-2 d-none d-md-flex replyBtns");

					let btncover = $("<div>").attr("class", "defaultCover");
					let updateBtn = $("<div>").attr("class", "replyUpdate bColorGreen fw400 fs17").html("수정");
					let deleteBtn = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("삭제");
					replyBtns.append(btncover.append(updateBtn).append(deleteBtn));

					let btncoverforupdate = $("<div>").attr("class", "updateCover");
					let cancel = $("<div>").attr("class", "replyCancel bColorGreen fw400 fs17").html("취소");
					let save = $("<div>").attr("class", "replySave bColorGreen fw400 fs17").html("저장");
					replyBtns.append(btncoverforupdate.append(save).append(cancel));

					let btncovermini = $("<div>").attr("class", "defaultCover");
					let replyBtnsMini = $("<div>").attr("class", "col-2 d-md-none replyBtns replyBtnsMini");
					let updateBtnMini = $("<div>").attr("class", "replyUpdate bColorGreen fw400 fs17").html("<i class='fa-solid fa-pen-to-square'></i>");
					let deleteBtnMini = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("<i class='fa-solid fa-trash-can'></i>");
					replyBtnsMini.append(btncovermini.append(updateBtnMini).append(deleteBtnMini));

					let btncoverforupdatemini = $("<div>").attr("class", "updateCover");
					let cancelMini = $("<div>").attr("class", "replyCancel bColorGreen fw400 fs17").html("<i class='fa-solid fa-xmark'></i>");
					let saveMini = $("<div>").attr("class", "replySave bColorGreen fw400 fs17").html("<i class='fa-solid fa-check'></i>");
					replyBtnsMini.append(btncoverforupdatemini.append(saveMini).append(cancelMini));

					row.append(replyBtns).append(replyBtnsMini);
				} else {
					replyBtns = $("<div>").attr("class", "col-2 replyBtns");
					let recommendBtn = $("<div>").attr("class", "col-2 fw400 fs15 recommendBtn").attr("id", "replyRec").html("<i class='fa-regular fa-thumbs-up'></i>" + "&nbsp;추천");

					if (resp[i].recId !== undefined) {
						recommendBtn.addClass("btnClicked");
					}
					row.append(replyBtns.append(recommendBtn));
				}

				let replyId = $("<input>").attr("type", "hidden").val(resp[i].seq).attr("id", "replyId");
				row.append(replyId);
				replys.append(replyTag.append(row));
			}
		});
	}

	let cpage = $("#cpage").val();
	let category = $("#category").val();
	let postSeq = $("#postSeq").val();

	// 댓글창 로드
	$("#replys").html(replyReload(postSeq));


	$("#goList").on("click", function() {
		location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
	});

	$("#replyInsertBtn").on("click", function() {
		let txt = $("#replyInsertTxt").html();
		if (txt == "" || txt == null) {
			alert("댓글 내용을 입력하세요.");
			return false;
		}
		$("#replyInsertTxt").html("");

		// 댓글 삽입 시 댓글 수정 취소 시 사용할 백업 내용 삭제
		replyBackup = null;
		replyObj = null;
		nestedReplyParentSeq = null;
		nestedReplyObj = null;


		$.ajax({
			url: "/insert.reply",
			data: {
				postSeq: postSeq,
				contents: txt
			},
			type: "post"
		}).done(function() {
			$("#replys").html("");
			$("#replys").html(replyReload(postSeq));
		});
	});

	// 게시글 북마크/ 추천 눌렀을 때 게시글 삭제됏으면 삭제된 게시글이라고 출력
	// 댓글 추천 눌렀을 때 댓글 삭제됐으면 삭제된 댓글이라고 출력

	$("#bookmark").on("click", function() {
		if ($(this).hasClass("btnClicked") === true) { //delete
			$.ajax({
				url: "/deleteBookmark.board",
				data: {
					postSeq: postSeq
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == 1)
					$("#bookmark").removeClass("btnClicked");
				else {
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
				}
			});


		} else { //insert
			$.ajax({
				url: "/insertBookmark.board",
				data: {
					postSeq: postSeq
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == 1)
					$("#bookmark").addClass("btnClicked");
				else {
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
				}
			});

		}
	});

	$("#postRec").on("click", function() {
		if ($(this).hasClass("btnClicked") === true) { //delete
			$.ajax({
				url: "/deleteRecommend.board",
				data: {
					postSeq: postSeq
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == 1)
					$("#postRec").removeClass("btnClicked");
				else {
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
				}
			});


		} else { //insert
			$.ajax({
				url: "/insertRecommend.board",
				data: {
					postSeq: postSeq
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == 1)
					$("#postRec").addClass("btnClicked");
				else {
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
				}
			});

		}
	});

	// 게시글 삭제
	$("#delete").on("click", function() {
		location.href = "delete.board?postSeq=" + postSeq + "&category=" + category;
	});

	// 댓글 삭제
	$(document).on("click", ".replyDelete", function() {

		if (replyBackup != null) { // 수정중인 댓글이 있으면?
			if (confirm("댓글 수정을 취소하시겠습니까?")) {
				replyObj.closest(".reply").find(".contents").html(replyBackup);
				replyObj.closest(".reply").find(".contents").attr("contenteditable", false);
				replyObj.parent().css("display", "flex");
				replyObj.parent().siblings(".updateCover").css("display", "none");

				replyObj.parent().parent().siblings(".replyBtns").children(".defaultCover").css("display", "flex");
				replyObj.parent().parent().siblings(".replyBtns").children(".updateCover").css("display", "none");
				// 댓글 삭제 시 댓글 수정 취소 시 사용할 백업 내용 삭제, 답글 수정 취소시 백업할 내용 삭제
				replyBackup = null;
				replyObj = null;

			} else {
				return false;
			}
		}

		if (nestedReplyObj != null) { // 작성 중인 당급이 있으면?
			let replyid = $(this).closest(".reply").find("#replyId").val();
			if (confirm("답글 작성을 취소하시겠습니가?")) {
				nestedReplyObj.remove();
				nestedReplyParentSeq = null;
				nestedReplyObj = null;
			} else {
				return false;
			}
		}


		$.ajax({
			url: "delete.reply",
			data: {
				replySeq: $(this).parent().parent().siblings("#replyId").val()
			},
			type: "post"
		}).done(function() {
			$("#replys").html("");
			$("#replys").html(replyReload(postSeq));
		});
	});


	let replyBackup = null;
	let replyObj = null;

	// 댓글 수정 버튼 클릭
	$(document).on("click", ".replyUpdate", function() {

		if (replyBackup != null) { // 수정중인 댓글이 있으면?
			if (confirm("댓글 수정을 취소하시겠습니까?")) {
				replyObj.closest(".reply").find(".contents").html(replyBackup);
				replyObj.closest(".reply").find(".contents").attr("contenteditable", false);
				replyObj.parent().css("display", "flex");
				replyObj.parent().siblings(".updateCover").css("display", "none");

				replyObj.parent().parent().siblings(".replyBtns").children(".defaultCover").css("display", "flex");
				replyObj.parent().parent().siblings(".replyBtns").children(".updateCover").css("display", "none");

			} else {
				return false;
			}
		}

		if (nestedReplyObj != null) { // 작성 중인 당급이 있으면?
			let replyid = $(this).closest(".reply").find("#replyId").val();
			if (confirm("답글 작성을 취소하시겠습니가?")) {
				nestedReplyObj.remove();
				nestedReplyParentSeq = null;
				nestedReplyObj = null;
			} else {
				return false;
			}
		}

		$(this).closest(".reply").find(".contents").attr("contenteditable", true).focus();
		$(this).parent().css("display", "none");
		$(this).parent().siblings(".updateCover").css("display", "flex");

		$(this).parent().parent().siblings(".replyBtns").children(".defaultCover").css("display", "none");
		$(this).parent().parent().siblings(".replyBtns").children(".updateCover").css("display", "flex");

		replyBackup = $(this).closest(".reply").find(".contents").html();
		replyObj = $(this);
	});

	// 댓글 수정 취소
	$(document).on("click", ".replyCancel", function() {
		$(this).closest(".reply").find(".contents").html(replyBackup);

		$(this).closest(".reply").find(".contents").attr("contenteditable", false);
		$(this).parent().css("display", "none");
		$(this).parent().siblings(".defaultCover").css("display", "flex");

		$(this).parent().parent().siblings(".replyBtns").children(".defaultCover").css("display", "flex");
		$(this).parent().parent().siblings(".replyBtns").children(".updateCover").css("display", "none");

		replyBackup = null;
		replyObj = null;
	});

	// 댓글 수정 저장
	$(document).on("click", ".replySave", function() {
		let replySeq = $(this).parent().parent().siblings("#replyId").val();
		let replyContents = $(this).closest(".reply").find(".contents").html();

		$.ajax({
			url: "/update.reply",
			data: {
				replySeq: replySeq,
				replyContents: replyContents
			},
			type: "post"
		}).done(function() {
			$("#replys").html("");
			$("#replys").html(replyReload(postSeq));
			replyBackup = null;
			replyObj = null;
		});
	});



	// 댓글 좋아요 버튼 
	$(document).on("click", ".recommendBtn", function() {
		let recbtn = $(this);

		if ($(this).hasClass("btnClicked") === true) { //delete
			$.ajax({
				url: "/deleteReplyRecommend.reply",
				data: {
					replySeq: $(this).parent().siblings("#replyId").val()
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == 1)
					recbtn.removeClass("btnClicked");
				else {
					alert("삭제된 댓글입니다.");
					replyReload(postSeq);
				}
			});


		} else { //insert
			$.ajax({
				url: "/insertReplyRecommend.reply",
				data: {
					replySeq: $(this).parent().siblings("#replyId").val()
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == 1)
					recbtn.addClass("btnClicked");
				else {
					alert("삭제된 댓글입니다.");
					replyReload(postSeq);
				}
			});

		}
	});

	let nestedReplyParentSeq = null;
	let nestedReplyObj = null;
	// 답글 쓰기 클릭
	$(document).on("click", ".nestedReplyBtn", function() {
		// 답글 작성 ui
		if (nestedReplyObj != null) { //작성중인 답글이 있으면
			let replyid = $(this).closest(".reply").find("#replyId").val();
			if (replyid == nestedReplyParentSeq) {
				return false;
			} else {
				if (confirm("답글 작성을 취소하시겠습니가?")) {
					nestedReplyObj.remove();
					nestedReplyParentSeq = null;
					nestedReplyObj = null;
				} else {
					return false;
				}
			}
		}

		//수정중인 댓글이 있으면
		if (replyBackup != null) { // 수정중인 댓글이 있으면?
			if (confirm("댓글 수정을 취소하시겠습니까?")) {
				replyObj.closest(".reply").find(".contents").html(replyBackup);
				replyObj.closest(".reply").find(".contents").attr("contenteditable", false);
				replyObj.parent().css("display", "flex");
				replyObj.parent().siblings(".updateCover").css("display", "none");

				replyObj.parent().parent().siblings(".replyBtns").children(".defaultCover").css("display", "flex");
				replyObj.parent().parent().siblings(".replyBtns").children(".updateCover").css("display", "none");
				replyBackup = null;
				replyObj = null;
			} else {
				return false;
			}
		}

		let nestedReply = $("<div>").attr("class", "col-12 nestedReply");

		let arrow = $("<div>").attr("class", "col-1 d-flex justify-content-center align-items-center").html("<i class='fa-solid fa-arrow-turn-up fa-rotate-90 fa-xl'></i>");
		nestedReplyObj = nestedReply;
		let replyid = $(this).closest(".reply").find("#replyId").val();
		let replySeq = $("<input>").attr("id", "nestedReplySeq").attr("type", "hidden").val(replyid);
		nestedReplyParentSeq = replyid;
		let nestedReplyInputCover = $("<div>").attr("class", "ptb15 col-9");

		let nestedReplyInput = $("<div>").attr("id", "nestedReplyInput").attr("contenteditable", "true").focus();

		nestedReply.append(arrow).append(nestedReplyInputCover.append(nestedReplyInput));
		let nestedCover = $("<div>").attr("class", "d-none d-xl-flex col-xl-2 btnCover nestedCover");
		let insert = $("<button>").attr("class", "fw400 fs25 colorDarkgray nestedReplyBtns nestedReplyInsert").html("등록");
		let cancel = $("<button>").attr("class", "fw400 fs25 colorDarkgray nestedReplyBtns nestedReplyCancel").html("취소");
		nestedCover.append(insert).append(cancel);

		let nestedCoverMini = $("<div>").attr("class", "col-2 d-xl-none mininested");
		let insertMini = $("<button>").attr("class", "fw400 fs25 colorDarkgray nestedReplyInsert").html("등록");
		let cancelMini = $("<button>").attr("class", "fw400 fs25 colorDarkgray nestedReplyCancel").html("취소");
		nestedCoverMini.append(insertMini).append(cancelMini);

		nestedReply.append(replySeq).append(nestedCover).append(nestedCoverMini);

		$(this).closest(".reply").after(nestedReply);
	});

	// 답글작성 취소
	$(document).on("click", ".nestedReplyCancel", function() {
		$(this).closest(".nestedReply").remove();
		nestedReplyParentSeq = null;
		nestedReplyObj = null;
	});

	// 답글작성 저장
	$(document).on("click", ".nestedReplyInsert", function() {
		$.ajax({
			url: "nestedInsert.reply",
			data: {
				replySeq: nestedReplyParentSeq,
				postSeq: postSeq,
				contents: $("#nestedReplyInput").html()
			},
			type: "post",
			dataType: "json"
		}).done(function(success) {
			if (success != 1)
				alert("삭제된 댓글입니다.");
			nestedReplyParentSeq = null;
			nestedReplyObj = null;
			$("#replys").html("");
			$("#replys").html(replyReload(postSeq));
		});
	});

	$(document).on("click", ".nestedReplyPrintBtn", function() {
		if ($(this).html() == "답글 보기") {
			$(this).html("답글 닫기");

			let parentReply = $(this).closest(".reply");
			let nestedReplyAll = $("<div>").attr("id", "nestedReplyAll");
			
			$.ajax({
				url: "nestedPrint.reply",
				data: {
					replySeq: $(this).closest(".reply").find("#replyId").val()
				},
				type: "post",
				dataType: "json"
			}).done(function(resp) {
				let postWriter = $("#postWriterName").val();
				let loginID = $("#loginID").val();				

				for (let i = 0; i < resp.length; i++) {
					let replyTag = $("<div>").attr("class", "col-12 reply nopadding");
					let arrow = $("<div>").attr("class", "col-1 d-flex justify-content-center align-items-center").html("<i class='fa-solid fa-arrow-turn-up fa-rotate-90 fa-xl'></i>");


					let row = $("<div>").attr("class", "row g-0");
					let col10 = $("<div>").attr("class", "col-9");
					let writerCover = $("<div>").attr("class", "d-flex align-items-end mb10").append($("<div>").attr("class", "writer fw500 fs20").html(resp[i].nickName));
					if (resp[i].writer == postWriter) {
						let isWriterTag = $("<div>").attr("class", "isWriter colorWhite bColorBlue fw400 fs15").html("작성자");
						writerCover.append(isWriterTag);
					}
					let contents = $("<div>").attr("class", "contents fw400 fs20 mb10").html(resp[i].contents).attr("contenteditable", "false");
					let detailInfo = $("<div>").attr("class", "replyDetailInfo fw400 fs15 colorDarkgray").html(resp[i].writeDate + "&nbsp;&nbsp;");

					row.append(arrow).append(col10.append(writerCover).append(contents).append(detailInfo));
					let replyBtns;
					if (resp[i].writer == loginID) {
						replyBtns = $("<div>").attr("class", "col-2 d-none d-md-flex replyBtns");

						let btncover = $("<div>").attr("class", "defaultCover");
						let updateBtn = $("<div>").attr("class", "replyUpdate bColorGreen fw400 fs17").html("수정");
						let deleteBtn = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("삭제");
						replyBtns.append(btncover.append(updateBtn).append(deleteBtn));

						let btncoverforupdate = $("<div>").attr("class", "updateCover");
						let cancel = $("<div>").attr("class", "replyCancel bColorGreen fw400 fs17").html("취소");
						let save = $("<div>").attr("class", "replySave bColorGreen fw400 fs17").html("저장");
						replyBtns.append(btncoverforupdate.append(save).append(cancel));

						let btncovermini = $("<div>").attr("class", "defaultCover");
						let replyBtnsMini = $("<div>").attr("class", "col-2 d-md-none replyBtns replyBtnsMini");
						let updateBtnMini = $("<div>").attr("class", "replyUpdate bColorGreen fw400 fs17").html("<i class='fa-solid fa-pen-to-square'></i>");
						let deleteBtnMini = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("<i class='fa-solid fa-trash-can'></i>");
						replyBtnsMini.append(btncovermini.append(updateBtnMini).append(deleteBtnMini));

						let btncoverforupdatemini = $("<div>").attr("class", "updateCover");
						let cancelMini = $("<div>").attr("class", "replyCancel bColorGreen fw400 fs17").html("<i class='fa-solid fa-xmark'></i>");
						let saveMini = $("<div>").attr("class", "replySave bColorGreen fw400 fs17").html("<i class='fa-solid fa-check'></i>");
						replyBtnsMini.append(btncoverforupdatemini.append(saveMini).append(cancelMini));

						row.append(replyBtns).append(replyBtnsMini);
					} else {
						replyBtns = $("<div>").attr("class", "col-2 replyBtns");
						let recommendBtn = $("<div>").attr("class", "col-2 fw400 fs15 recommendBtn").attr("id", "replyRec").html("<i class='fa-regular fa-thumbs-up'></i>" + "&nbsp;추천");

						if (resp[i].recId !== undefined) {
							recommendBtn.addClass("btnClicked");
						}
						row.append(replyBtns.append(recommendBtn));
					}

					let replyId = $("<input>").attr("type", "hidden").val(resp[i].seq).attr("id", "replyId");
					row.append(replyId);
					parentReply.after(nestedReplyAll.append(replyTag.append(row)));
				}
			});
		} else if ($(this).html() == "답글 닫기") {
			nestedReplyAll.remove();
			
			$(this).html("답글 보기");
			
		}
	});
});
