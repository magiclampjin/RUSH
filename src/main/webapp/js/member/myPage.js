$(document).ready(function(){
			  
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');

    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
  
  myWriteList();
  
	$("#myBookMark").one("click",function(){
		$.ajax({
			url:"/myBookMarkList.board?myPage=true",
			dataType:"json"
		}).done(function(resp){
			console.log(resp);
			let div = $(".post2");
			
			for(let i=0; i<resp.length;i++){
				
				let divPost = $("<div>").attr("class","post");
				
				let maxBoard = $("<div>").attr("class","maxBoard");
				
				let divNum = $("<div>").attr("class","num fontEnglish");
					divNum.append(resp[i].seq);
				
				let divTitle = $("<div>").attr("class","title");
				
					let aTagTitle = $("<a>").attr("href","/load.board?seq="+resp[i].seq+"&myPage=true");
					let divMainTitle = $("<div>").attr("class","mainTitle");
					divMainTitle.append(resp[i].title);
					aTagTitle.append(divMainTitle);
				
					let divReplyCnt = $("<div>").attr("class","replyCnt colorPink fontEnglish");
					divReplyCnt.append(resp[i].rCount);
					
					divTitle.append(aTagTitle);
					divTitle.append(divReplyCnt);
				
				let divWriter = $("<div>").attr("class","writer");
					divWriter.append(resp[i].nickName);
					
				let divDate = $("<div>").attr("class","date");
					divDate.html(resp[i].writeDate);
				
				let divView = $("<div>").attr("class","view fontEnglish");
					divView.append(resp[i].view);
				
				let divRecommend = $("<div>").attr("class","recommend forEnglish");
					divRecommend.append(resp[i].recommend);
				
	
	
				maxBoard.append(divNum).append(divTitle).append(divWriter).append(divDate).append(divView).append(divRecommend);
				
				
				if(resp[i].fCount > 0){
					let divFile = $("<div>").attr("class","file");
						let iconFile = $("<div>").attr("class","fa-solid fa-paperclip");
					divFile.append(iconFile);
					maxBoard.append(divFile);
				}else{
					let divFile = $("<div>").attr("class","file");
					maxBoard.append(divFile);
				}
				
				
				divPost.append(maxBoard);
				
				let minBoard = $("<div>").attr("class","minBoard");
				
				let divMinNum = $("<div>").attr("class","num");
					divMinNum.append(resp[i].seq);
				
				let divMinCon = $("<div>").attr("class","minCon");
					
					let divMinTitle = $("<div>").attr("class","title");
						let aTagMin = $("<a>").attr("href","/load.board?seq="+resp[i].seq+"&myPage=true");
							let divMinMainTitle = $("<div>").attr("class","mainTitle");
							divMinMainTitle.append(resp[i].title);
						aTagMin.append(divMinMainTitle);
						
						let divMinReply = $("<div>").attr("class","replyCnt colorPink fontEnglish");
							divMinReply.append(resp[i].recommend);
							
					divMinTitle.append(aTagMin);
					divMinTitle.append(divMinReply);
				
					let divMinInfo = $("<div>").attr("class","info");
						let divMinWriter = $("<div>").attr("class","minWriter colorDarkgray");
							divMinWriter.append(resp[i].nickName);
							
						let divMinDate = $("<div>").attr("class","minDate colorDarkgray");
							divMinDate.html(resp[i].writeDate);
							
						let divMinView = $("<div>").attr("class","minView fontEnglish colorDarkgray");
								let divIconView = $("<i>").attr("class","fa-regular fa-eye");
							divMinView.append(divIconView).append("&nbsp;").append(resp[i].view);
							
						let divMinRecommend = $("<div>").attr("class","minRecommend fontEnglish colorDarkgray");
							let divIconRec = $("<i>").attr("class","fa-regular fa-thumbs-up");
							
							divMinRecommend.append(divIconRec).append("&nbsp;").append(resp[i].rCount);
						
					divMinInfo.append(divMinWriter).append(divMinDate).append(divMinView).append(divMinRecommend);
					
					//			파일개수는 나중에
				if(resp[i].fCount > 0){
					let divFile = $("<div>").attr("class","file");
						let iconFile = $("<div>").attr("class","fa-solid fa-paperclip");
					divFile.append(iconFile);
					divMinInfo.append(divFile);
				}else{
					let divFile = $("<div>").attr("class","file");
					divMinInfo.append(divFile);
				}
					
					
				divMinCon.append(divMinTitle).append(divMinInfo);
				
				minBoard.append(divMinNum).append(divMinCon);
				
				divPost.append(minBoard);
			
				div.append(divPost);
			}
			
		});
	});
	
})

function myWriteList(){
	$.ajax({
			url:"/myWriteList.board?myPage=true",
			dataType:"json"
		}).done(function(resp){
			
			let div = $(".post1");
			
			for(let i=0; i<resp.length;i++){
				
				let divPost = $("<div>").attr("class","post");
				
				let maxBoard = $("<div>").attr("class","maxBoard");
				
				let divNum = $("<div>").attr("class","num fontEnglish");
					divNum.append(resp[i].seq);
				
				let divTitle = $("<div>").attr("class","title");
				
					let aTagTitle = $("<a>").attr("href","/load.board?seq="+resp[i].seq+"&myPage=true");
					let divMainTitle = $("<div>").attr("class","mainTitle");
					divMainTitle.append(resp[i].title);
					aTagTitle.append(divMainTitle);
				
					let divReplyCnt = $("<div>").attr("class","replyCnt colorPink fontEnglish");
					divReplyCnt.append(resp[i].rCount);
					
					divTitle.append(aTagTitle);
					divTitle.append(divReplyCnt);
				
				let divWriter = $("<div>").attr("class","writer");
					divWriter.append(resp[i].nickName);
					
				let divDate = $("<div>").attr("class","date");
					
					// 시간
					divDate.html(resp[i].writeDate);
				
				let divView = $("<div>").attr("class","view fontEnglish");
					divView.append(resp[i].view);
				
				let divRecommend = $("<div>").attr("class","recommend forEnglish");
					divRecommend.append(resp[i].recommend);
				
	
	
				maxBoard.append(divNum).append(divTitle).append(divWriter).append(divDate).append(divView).append(divRecommend);
				
				
				if(resp[i].fCount > 0){
					let divFile = $("<div>").attr("class","file");
						let iconFile = $("<div>").attr("class","fa-solid fa-paperclip");
					divFile.append(iconFile);
					maxBoard.append(divFile);
				}else{
					let divFile = $("<div>").attr("class","file");
					maxBoard.append(divFile);
				}
				
				
				divPost.append(maxBoard);
				
				let minBoard = $("<div>").attr("class","minBoard");
				
				let divMinNum = $("<div>").attr("class","num");
					divMinNum.append(resp[i].seq);
				
				let divMinCon = $("<div>").attr("class","minCon");
					
					let divMinTitle = $("<div>").attr("class","title");
						let aTagMin = $("<a>").attr("href","/load.board?seq="+resp[i].seq+"&myPage=true");
							let divMinMainTitle = $("<div>").attr("class","mainTitle");
							divMinMainTitle.append(resp[i].title);
						aTagMin.append(divMinMainTitle);
						
						let divMinReply = $("<div>").attr("class","replyCnt colorPink fontEnglish");
							divMinReply.append(resp[i].recommend);
							
					divMinTitle.append(aTagMin);
					divMinTitle.append(divMinReply);
				
					let divMinInfo = $("<div>").attr("class","info");
						let divMinWriter = $("<div>").attr("class","minWriter colorDarkgray");
							divMinWriter.append(resp[i].nickName);
							
						let divMinDate = $("<div>").attr("class","minDate colorDarkgray");
							divMinDate.html(resp[i].writeDate);
							
						let divMinView = $("<div>").attr("class","minView fontEnglish colorDarkgray");
								let divIconView = $("<i>").attr("class","fa-regular fa-eye");
							divMinView.append(divIconView).append("&nbsp;").append(resp[i].view);
							
						let divMinRecommend = $("<div>").attr("class","minRecommend fontEnglish colorDarkgray");
							let divIconRec = $("<i>").attr("class","fa-regular fa-thumbs-up");
							
							divMinRecommend.append(divIconRec).append("&nbsp;").append(resp[i].rCount);
						
					divMinInfo.append(divMinWriter).append(divMinDate).append(divMinView).append(divMinRecommend);
					
					//			파일개수는 나중에
				if(resp[i].fCount > 0){
					let divFile = $("<div>").attr("class","file");
						let iconFile = $("<div>").attr("class","fa-solid fa-paperclip");
					divFile.append(iconFile);
					divMinInfo.append(divFile);
				}else{
					let divFile = $("<div>").attr("class","file");
					divMinInfo.append(divFile);
				}
					
					
				divMinCon.append(divMinTitle).append(divMinInfo);
				
				minBoard.append(divMinNum).append(divMinCon);
				
				divPost.append(minBoard);
			
				div.append(divPost);
			}
			
			
		});
}
/*
function timeCal(date){
	const start = new Date(date);
  const end = new Date();

  const diff = (end - start) / 1000;
  
  const times = [
    { name: ' 년', milliSeconds: 60 * 60 * 24 * 365 },
    { name: ' 개월', milliSeconds: 60 * 60 * 24 * 30 },
    { name: ' 일', milliSeconds: 60 * 60 * 24 },
    { name: ' 시간', milliSeconds: 60 * 60 },
    { name: ' 분', milliSeconds: 60 },
  ];

  for (const value of times) {
    const betweenTime = Math.floor(diff / value.milliSeconds);
    console.log("betweenTime "+betweenTime);

    if (betweenTime > 0) {
      return `${betweenTime}${value.name} 전`;
    }
  }
  return '방금 전';
}


*/