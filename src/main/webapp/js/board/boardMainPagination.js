$(document).ready(function() {
	let category = $("#category").val();

	// 검색 했을 때 카테고리 고정해주는 용도임
	// 검색 기능 끝내고 다시 구현 예정
	// $("option[value=\""+category+"\"]").attr("selected","true");

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

		let needPrev = true;
		let needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		let pagination = $("#pagination")

		if (startNavi != 1) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-angles-left";
			aTag.href = "/listing.board?" + "category="+category+"&cpage=1";
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}

		if (needPrev) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-chevron-left";
			aTag.href = "/listing.board?category="+category+"&cpage=" + (startNavi - 1);
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}

		for (let i = startNavi; i <= endNavi; i++) {
			let aTag = document.createElement('a');
			aTag.textContent = i;
			aTag.className += "colorBlack fontEnglish";
			aTag.href = "/listing.board?category="+category+"&cpage=" + i;
			if (i == currentPage) {
				aTag.className = "colorWhite bColorBlue fontEnglish"
			}
			pagination.append($(aTag));
		}

		if (needNext) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-chevron-right";
			aTag.href = "/listing.board?category="+category+"&cpage=" + (endNavi + 1);
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}

		if (endNavi != pageTotalCount) {
			let aTag = document.createElement('a');
			let iTag = document.createElement('i');
			iTag.className += "fa-solid fa-angles-right";
			aTag.href = "/listing.board?category="+category+"&cpage="+pageTotalCount;
			aTag.appendChild(iTag);
			pagination.append($(aTag));
		}
	}
})