$(document).ready(function() {

	let recordTotalCount = $("#recordTotalCount").val();
	if (recordTotalCount != 0) {
		let recordCountPerPage = $("#recordCountPerPage").val();
		let naviCountPerPage = $("#naviCountPerPage").val();

		let pageTotalCount = 0;
		pageTotalCount = Math.ceil(recordTotalCount / recordCountPerPage);

		let currentPage = $("#lastPageNum").val();

		// 비정상 접근 차단
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;
		let endNavi = startNavi + (naviCountPerPage - 1);
		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		console.log(pageTotalCount)
		console.log(startNavi)
		console.log(endNavi)

		let needPrev = true;
		let needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		let pagination = $("#pagination")
		let searchBy = $("#searchBy").val();
		let searchByKeyword = $("#searchByKeyword").val();
		


		if (startNavi != 1) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-angles-left";
			aTag.href = "/listing.qna?cpage=1&searchBy="+searchBy+"&keyword="+searchByKeyword;
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}

		if (needPrev) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-chevron-left";
			aTag.href = "/listing.qna?cpage=" + (startNavi - 1)+"&searchBy="+searchBy+"&keyword="+searchByKeyword;
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}

		for (let i = startNavi; i <= endNavi; i++) {
			let aTag = document.createElement('a');
			aTag.textContent = i;
			aTag.className += "colorBlack fontEnglish";
			aTag.href = "/listing.qna?cpage=" + i+"&searchBy="+searchBy+"&keyword="+searchByKeyword;
			if (i == currentPage) {
				aTag.className = "colorWhite bColorBlue fontEnglish"
			}
			pagination.append($(aTag));
		}

		if (needNext) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-chevron-right";
			aTag.href = "/listing.qna?cpage=" + (endNavi + 1)+"&searchBy="+searchBy+"&keyword="+searchByKeyword;
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}

		if (endNavi != pageTotalCount) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-angles-right";
			aTag.href = "/listing.qna?cpage="+pageTotalCount+"&searchBy="+searchBy+"&keyword="+searchByKeyword;
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}
	}
	
	// 검색 카테고리 지정
	let searchBy = $("#searchBy").val();
	if(searchBy == ""){
		searchBy = "title";
	}
	$("option[value=\""+searchBy+"\"]").attr("selected", "true");
	
	
})/**
 * 
 */