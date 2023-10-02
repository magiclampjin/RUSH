$(document).ready(function() {

	function pagination(postSeq, recordTotalCount, replyCurPage, recordCountPerPage, naviCountPerPage) {
		if (recordTotalCount != 0) {
			let pagination = $("#pagination");
			pagination.html("");
			
			let pageTotalCount = 0;
			pageTotalCount = Math.ceil(recordTotalCount / recordCountPerPage);

			// 비정상 접근 차단
			if (replyCurPage < 1) {
				replyCurPage = 1;
			} else if (replyCurPage > pageTotalCount) {
				replyCurPage = pageTotalCount;
			}

			let startNavi = Math.floor((replyCurPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
			let endNavi = startNavi + (naviCountPerPage - 1);
			
			
			if (endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			let needPrev = true;
			let needNext = true;
		

			if (startNavi == 1) {
				needPrev = false;
			}
			if (endNavi == pageTotalCount) {
				needNext = false;
			}


			if (startNavi != 1) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-angles-left'></i>");
				aTag.attr("class","colorBlack fontEnglish");
				aTag.on("click",function(){
					$("#replys").html("");
					replyReload(postSeq,1);
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}

			if (needPrev) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-chevron-left'></i>");
				aTag.on("click",function(){
					$("#replys").html("");
					replyReload(postSeq,(startNavi - 1));
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}

			for (let i = startNavi; i <= endNavi; i++) {
				let aTag = $("<a>");
				aTag.html(i);
				aTag.attr("class","colorBlack fontEnglish");
				aTag.on("click",function(){
					$("#replys").html("");
					replyReload(postSeq,i);
				});
				if (i == replyCurPage) {
					aTag.addClass("colorWhite bColorBlue fontEnglish");
				}
				pagination.append(aTag);
			}

			if (needNext) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-chevron-right'></i>");
				aTag.on("click",function(){
					$("#replys").html("");
					replyReload(postSeq,(endNavi + 1));
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}

			if (endNavi != pageTotalCount) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-angles-right'></i>");
				aTag.on("click",function(){
					$("#replys").html("");
					replyReload(postSeq,pageTotalCount);
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}
		}
	}

	function replyReload(postSeq,replyCurPage) {
		$.ajax({
			url: "/load.reply?replyCurPage="+replyCurPage+"&postSeq=" + postSeq,
			dataType: "json",
			type: "post"
		}).done(function(resp) {
			let postWriter = $("#postWriterName").val();
			let loginID = $("#loginID").val();
			let replys = $("#replys");
			let replyRecommCnt = resp[1].length;
			let replyRecommCheckIdx = 0;
			let recordTotalCount = resp[2]; // 총 댓글 수
			let replyCurPage = resp[3]; // 현재 댓글 페이지
			let recordCountPerPage = resp[4]; // 페이지 내 최대 댓글 수
			let naviCountPerPage = resp[5]; // 네비게이션 내 최대 페이지 수 ( 1 2 3 4 5 로 출력)
			
			for (let i = 0; i < resp[0].length; i++) {
				let replyTag = $("<div>").attr("class", "col-12 reply");
				let row = $("<div>").attr("class", "row g-0");
				let col10 = $("<div>").attr("class", "col-10");
				let writerCover = $("<div>").attr("class", "d-flex align-items-end mb10").append($("<div>").attr("class", "writer fw500 fs20").html(resp[0][i].nickName));
				if (resp[0][i].writer == postWriter) {
					let isWriterTag = $("<div>").attr("class", "isWriter colorWhite bColorBlue fw400 fs15").html("작성자");
					writerCover.append(isWriterTag);
				}
				let contents = $("<div>").attr("class", "contents fw400 fs20 mb10").html(resp[0][i].contents).attr("contenteditable", "false");;
				let detailInfo = $("<div>").attr("class", "replyDetailInfo fw400 fs15 colorDarkgray").html(resp[0][i].writeDate + "&nbsp;&nbsp;");
				let replyRecCnt = $("<span>").html("추천 " + resp[0][i].recommend + "&nbsp;&nbsp;").attr("class", "recCnt colorDarkgray");
				let nestedReplyPrintBtn = $("<a>").attr("class", "nestedReplyPrintBtn colorDarkgray").html("답글 보기");
				let nestedReplyBtn = $("<a>").attr("class", "nestedReplyBtn colorDarkgray").html("답글 쓰기");

				detailInfo.append(replyRecCnt).append(nestedReplyPrintBtn).append(nestedReplyBtn);

				row.append(col10.append(writerCover).append(contents).append(detailInfo));
				let replyBtns;
				if (resp[0][i].writer == loginID) {
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
				} else if (loginID == "admin") {
					replyBtns = $("<div>").attr("class", "col-2 d-none d-md-flex replyBtns");

					let btncover = $("<div>").attr("class", "defaultCover");
					let deleteBtn = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("삭제");
					replyBtns.append(btncover.append(deleteBtn));


					let btncovermini = $("<div>").attr("class", "defaultCover");
					let replyBtnsMini = $("<div>").attr("class", "col-2 d-md-none replyBtns replyBtnsMini");
					let deleteBtnMini = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("<i class='fa-solid fa-trash-can'></i>");
					replyBtnsMini.append(btncovermini.append(deleteBtnMini));

					row.append(replyBtns).append(replyBtnsMini);
				} else {
					replyBtns = $("<div>").attr("class", "col-2 replyBtns");
					let recommendBtn = $("<div>").attr("class", "col-2 fw400 fs15 recommendBtn").html("<i class='fa-regular fa-thumbs-up'></i>" + "&nbsp;추천");
					row.append(replyBtns.append(recommendBtn));

					if (replyRecommCnt > 0 && replyRecommCheckIdx < replyRecommCnt) {
						if (resp[0][i].seq == resp[1][replyRecommCheckIdx].seq && resp[1][replyRecommCheckIdx].recId == loginID) {
							recommendBtn.addClass("btnClicked");
							replyRecommCheckIdx++;
						}
					}
				}

				let replyId = $("<input>").attr("type", "hidden").val(resp[0][i].seq).attr("id", "replyId");
				row.append(replyId);
				replys.append(replyTag.append(row));
			}
			pagination(postSeq, recordTotalCount, replyCurPage, recordCountPerPage, naviCountPerPage);
		});
	}

	let cpage = $("#cpage").val();
	let category = $("#category").val();
	let postSeq = $("#postSeq").val();
	let search = $("#search").val();
	let keyword = $("#keyword").val();

	// url 에서 myPage 값 가져올 때 사용
	const urlParams = new URL(location.href).searchParams;
	const myPage = urlParams.get('myPage');

	// 댓글창 로드
	$("#replys").html(replyReload(postSeq,1));

	$(".goList").on("click", function() {

		if (myPage == "true") {
			location.href = "/load.member";
		} else if (search == null || search == "") {
			location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
		} else {
			location.href = "/listing.board?cpage=" + cpage + "&category=" + category + "&search=" + search + "&keyword=" + keyword;
		}
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
			$("#replys").html(replyReload(postSeq,1));
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
	
	$("#pinNotice").on("click", function() {

		if ($(this).hasClass("btnClicked") === true) { //delete
			$.ajax({
				url: "/deletePin.board",
				data: {
					postSeq: postSeq
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == false)
					$("#pinNotice").removeClass("btnClicked");
				else {
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
				}
			});


		} else { //insert
			$.ajax({
				url: "/insertPin.board",
				data: {
					postSeq: postSeq
				},
				type: "post",
				dataType: "json"
			}).done(function(success) {
				if (success == true)
					$("#pinNotice").addClass("btnClicked");
				else {
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage=" + cpage + "&category=" + category;
				}
			});

		}
	});

	// 게시글 삭제
	$(".delete").on("click", function() {
		location.href = "/delete.board?postSeq=" + postSeq + "&category=" + category;
	});

	// 게시글 수정
	$(".update").on("click", function() {
		if (search == null || search == "") {
			location.href = "/updateLoad.board?postSeq=" + postSeq + "&category=" + category + "&cpage=" + cpage + "&menu=board";
		} else {
			location.href = "/updateLoad.board?postSeq=" + postSeq + "&category=" + category + "&cpage=" + cpage + "&menu=board" + "&search=" + search + "&keyword=" + keyword;
		}
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
			$("#replys").html(replyReload(postSeq,1));
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
			$("#replys").html(replyReload(postSeq,1));
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
			}).done(function(result) {
				if (result[0] == 1) {
					recbtn.removeClass("btnClicked");
					recbtn.closest(".reply").find(".recCnt").html("추천 " + result[1] + "&nbsp;&nbsp;");
				}
				else {
					alert("게시글 또는 댓글이 삭제되었습니다.");
					$("#replys").html("");
					$("#replys").html(replyReload(postSeq,1));
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
			}).done(function(result) {
				if (result[0] == 1) {
					recbtn.addClass("btnClicked");
					recbtn.closest(".reply").find(".recCnt").html("추천 " + result[1] + "&nbsp;&nbsp;");
				}
				else {
					alert("게시글 또는 댓글이 삭제되었습니다.");
					$("#replys").html("");
					$("#replys").html(replyReload(postSeq,1));
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

		if ($(this).closest(".reply").next().hasClass("nestedReplyAll")) {
			$(this).closest(".reply").next().after(nestedReply);
		} else {
			$(this).closest(".reply").after(nestedReply);
		}


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
				alert("게시글 또는 댓글이 삭제되었습니다.");
			nestedReplyParentSeq = null;
			nestedReplyObj = null;
			$("#replys").html("");
			$("#replys").html(replyReload(postSeq,1));
		});
	});

	$(document).on("click", ".nestedReplyPrintBtn", function() {
		if ($(this).html() == "답글 보기") {
			$(this).html("답글 닫기");

			let parentReply = $(this).closest(".reply");
			let nestedReplyAll = $("<div>").attr("class", "nestedReplyAll");

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
					} else if (loginID == "admin") {

						replyBtns = $("<div>").attr("class", "col-2 d-none d-md-flex replyBtns");

						let btncover = $("<div>").attr("class", "defaultCover");
						let deleteBtn = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("삭제");
						replyBtns.append(btncover.append(deleteBtn));

						let btncovermini = $("<div>").attr("class", "defaultCover");
						let replyBtnsMini = $("<div>").attr("class", "col-2 d-md-none replyBtns replyBtnsMini");
						let deleteBtnMini = $("<div>").attr("class", "replyDelete bColorGreen fw400 fs17").html("<i class='fa-solid fa-trash-can'></i>");
						replyBtnsMini.append(btncovermini.append(deleteBtnMini));

						row.append(replyBtns).append(replyBtnsMini);
					} else {
						replyBtns = $("<div>").attr("class", "col-2 replyBtns");
						row.append(replyBtns);
					}

					let replyId = $("<input>").attr("type", "hidden").val(resp[i].seq).attr("id", "replyId");
					row.append(replyId);
					nestedReplyAll.append(replyTag.append(row));
					parentReply.after(nestedReplyAll);
				}
			});
		} else if ($(this).html() == "답글 닫기") {
			if ($(this).closest(".reply").next().hasClass("nestedReplyAll")) {
				$(this).closest(".reply").next().remove();
			}

			$(this).html("답글 보기");
		}
	});
});
