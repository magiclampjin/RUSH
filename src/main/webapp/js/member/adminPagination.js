$(document).ready(function() {
	function pagination(notiRecordTotalCount, notiCurrentPage, notiCountPerPage, notiNaviCountPerPage) {
		if (notiRecordTotalCount != 0) {
			let pagination = $("#adminPagination");
			pagination.html("");

			let pageTotalCount = 0;
			pageTotalCount = Math.ceil(notiRecordTotalCount / notiCountPerPage);

			// 비정상 접근 차단
			if (notiCurrentPage < 1) {
				notiCurrentPage = 1;
			} else if (notiCurrentPage > pageTotalCount) {
				notiCurrentPage = pageTotalCount;
			}

			let startNavi = Math.floor((notiCurrentPage - 1) / notiNaviCountPerPage) * notiNaviCountPerPage + 1;
			let endNavi = startNavi + (notiNaviCountPerPage - 1);


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
				aTag.attr("class", "colorBlack fontEnglish");
				aTag.on("click", function() {
					$(".adminBoardBody").html("");
					notiReload(1);
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}

			if (needPrev) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-chevron-left'></i>");
				aTag.on("click", function() {
					$(".adminBoardBody").html("");
					notiReload((startNavi - 1));
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}

			for (let i = startNavi; i <= endNavi; i++) {
				let aTag = $("<a>");
				aTag.html(i);
				aTag.attr("class", "colorBlack fontEnglish");
				aTag.on("click", function() {
					$(".adminBoardBody").html("");
					notiReload(i);
				});
				if (i == notiCurrentPage) {
					aTag.addClass("colorWhite bColorBlue fontEnglish");
				}
				pagination.append(aTag);
			}

			if (needNext) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-chevron-right'></i>");
				aTag.on("click", function() {
					$(".adminBoardBody").html("");
					notiReload((endNavi + 1));
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}

			if (endNavi != pageTotalCount) {
				let aTag = $("<a>");
				let iTag = $("<i class='fa-solid fa-angles-right'></i>");
				aTag.on("click", function() {
					$(".adminBoardBody").html("");
					notiReload(pageTotalCount);
				});
				aTag.append(iTag);
				pagination.append(aTag);
			}
		}
	}
	function notiReload(notiCpage) {
		$.ajax({
			url: "/adminBoard.member?notiCpage=" + notiCpage,
			dataType: "json",
			type: "post"
		}).done(function(resp) {
			let notiRecordTotalCount = resp[1]; // 총 공지 게시글 게수
			let notiCurrentPage = resp[2];
			let notiCountPerPage = resp[3];
			let notiNaviCountPerPage = resp[4];

			let div = $(".adminBoardBody");
			for (let i = 0; i < resp[0].length; i++) {
				let divPost = $("<div>").attr("class", "post");

				let maxBoard = $("<div>").attr("class", "maxBoard");

				let divNum = $("<div>").attr("class", "num fontEnglish");
				divNum.append(resp[0][i].seq);

				let divTitle = $("<div>").attr("class", "title");

				let aTagTitle = $("<a>").attr("href", "/load.board?seq=" + resp[0][i].seq + "&myPage=true");
				let divMainTitle = $("<div>").attr("class", "mainTitle");
				divMainTitle.append(resp[0][i].title);
				aTagTitle.append(divMainTitle);

				let divReplyCnt = $("<div>").attr("class", "replyCnt colorPink fontEnglish");
				divReplyCnt.append(resp[0][i].rCount);

				divTitle.append(aTagTitle);
				divTitle.append(divReplyCnt);

				let divWriter = $("<div>").attr("class", "writer");
				divWriter.append(resp[0][i].nickName);

				let divDate = $("<div>").attr("class", "date");

				// 시간
				divDate.html(resp[0][i].writeDate);

				let divView = $("<div>").attr("class", "view fontEnglish");
				divView.append(resp[0][i].view);

				let divRecommend = $("<div>").attr("class", "recommend forEnglish");
				divRecommend.append(resp[0][i].recommend);

				maxBoard.append(divNum).append(divTitle).append(divWriter).append(divDate).append(divView).append(divRecommend);

				if (resp[0][i].fCount > 0) {
					let divFile = $("<div>").attr("class", "file");
					let iconFile = $("<i>").attr("class", "fa-solid fa-paperclip");
					divFile.append(iconFile);
					maxBoard.append(divFile);
				} else {
					let divFile = $("<div>").attr("class", "file");
					maxBoard.append(divFile);
				}
				
				let divPin = $("<div>").attr("class","pin");
				if(resp[0][i].pin == true){
					let iconPin = $("<i>").attr("class","fa-solid fa-thumbtack");
					divPin.append(iconPin);
				}
				maxBoard.append(divPin);

				divPost.append(maxBoard);

				let minBoard = $("<div>").attr("class", "minBoard");

				let divMinNum = $("<div>").attr("class", "num");
				divMinNum.append(resp[0][i].seq);

				let divMinCon = $("<div>").attr("class", "minCon");

				let divMinTitle = $("<div>").attr("class", "title");
				let aTagMin = $("<a>").attr("href", "/load.board?seq=" + resp[0][i].seq + "&myPage=true");
				let divMinMainTitle = $("<div>").attr("class", "mainTitle");
				divMinMainTitle.append(resp[0][i].title);
				aTagMin.append(divMinMainTitle);

				let divMinReply = $("<div>").attr("class", "replyCnt colorPink fontEnglish");
				divMinReply.append(resp[0][i].recommend);

				divMinTitle.append(aTagMin);
				divMinTitle.append(divMinReply);

				let divMinInfo = $("<div>").attr("class", "info");
				let divMinWriter = $("<div>").attr("class", "minWriter colorDarkgray");
				divMinWriter.append(resp[0][i].nickName);

				let divMinDate = $("<div>").attr("class", "minDate colorDarkgray");
				divMinDate.html(resp[0][i].writeDate);

				let divMinView = $("<div>").attr("class", "minView fontEnglish colorDarkgray");
				let divIconView = $("<i>").attr("class", "fa-regular fa-eye");
				divMinView.append(divIconView).append("&nbsp;").append(resp[0][i].view);

				let divMinRecommend = $("<div>").attr("class", "minRecommend fontEnglish colorDarkgray");
				let divIconRec = $("<i>").attr("class", "fa-regular fa-thumbs-up");

				divMinRecommend.append(divIconRec).append("&nbsp;").append(resp[0][i].rCount);

				divMinInfo.append(divMinWriter).append(divMinDate).append(divMinView).append(divMinRecommend);

				if (resp[0][i].fCount > 0) {
					let divFile = $("<div>").attr("class", "file").css("margin-left","20px");
					let iconFile = $("<div>").attr("class", "fa-solid fa-paperclip");
					divFile.append(iconFile);
					divMinInfo.append(divFile);
				} else {
					let divFile = $("<div>").attr("class", "file").css("margin-left","0px")
					divMinInfo.append(divFile);
				}
				
				let minPin = $("<div>").attr("class","pin");
				if(resp[0][i].pin == true){
					minPin.css("margin-left","20px");
					let iconPin = $("<i>").attr("class","fa-solid fa-thumbtack");
					minPin.append(iconPin);
				}
				divMinInfo.append(minPin);


				divMinCon.append(divMinTitle).append(divMinInfo);

				minBoard.append(divMinNum).append(divMinCon);

				divPost.append(minBoard);

				div.append(divPost);
			}
			pagination(notiRecordTotalCount, notiCurrentPage, notiCountPerPage, notiNaviCountPerPage);
		})
	}
	// 공지 게시글 창
	if($("#userID").val()==="admin"){
		notiReload(1)
	}
	
})