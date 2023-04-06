/**
 * 
 */

$(function(){
	
	//초기이미지
	$("#myimg").attr("src","../image/toy01.png")
	
	//이벤트
	$("#myimg").hover(function(){
		
		$(this).attr("src","../image/toy03.png");
	},function(){
		
		$(this).attr("src","../image/toy01.png");
	});
});