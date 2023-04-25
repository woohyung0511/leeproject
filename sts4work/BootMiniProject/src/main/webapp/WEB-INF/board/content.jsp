<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.day {
	color: gray;
	margin-left: 50px;
	margin-right: 30px;
	font-size: 0.9em;
}

.amod, .adel {
	cursor: pointer;
	font-size: 0.7em;
	color: gray;
}
</style>
<script type="text/javascript">
	$(function() {

		//num값은 전역변수로 선언
		num = $("#num").val();
		loginok = "${sessionScope.loginok}";
		myid = "${sessionScope.myid}";

		//insert
		$("#btnansweradd").click(function() {
			
			var content = $("#content").val();
			
			if (content.trim().length == 0) { //trim은 공백 포함
				
				alert("댓글작성필요");
			
				return;
			}
			
			$.ajax({
				type : "post",
				dataType : "html",
				url : "ainsert",
				data : {"num" : num,"content" : content},
				success : function() {
					//alert("성공");
					list();
					location.reload();
					$("#content").val("");
				}
			})
		})
		
		list();

		$(document).on("click", "span.adel", function() {
			
			var idx = $(this).attr("idx");

			$.ajax({
				type : "get",
				dataType : "text",
				url : "delete",
				data : {"idx" : idx},
				success : function() {
					
					list();
				}
			})
		})
		
		//수정 데이터 불러오기
 		$(document).on("click", "span.amod", function() {
 			idx = $(this).attr("idx");
			
			$.ajax({
				
				type:"get",
				url:"aupdateform",
				data:{"idx":idx},
				success:function(res){
					$("#acontent").val(res.content);
					
				}
			});
		}); 
		
		
		//수정
		$("#btnupdate").click(function(){
			
			var content=$("#acontent").val();
			$.ajax({
				
				type:"post",
				dataType:"text",
				url:"aupdate",
				data:{"idx":idx,"content":content},
				success:function(){
					
					location.reload();
				}
			})
		})
	})
	//사용자 함수 list
	function list() {
		$.ajax({
					type : "get",
					dataType : "json",
					url : "alist",
					data : {"num" : num},
					success : function(res) {
						$("span.acount").text(res.length);

						var s = "";

						$.each(res,function(i, dto) {
											s += "<b>" + dto.name + "</b>:"+ dto.content;
											s += "<span class='day'>"+ dto.writeday + "</span>";

											if (loginok == "yes" && myid == dto.myid) {
												
												s += "<span data-toggle='modal' data-target='#myModal2' class='glyphicon glyphicon-pencil amod' idx='"+dto.idx+"'></span>";
												s += "&nbsp;";
												s += "<span class='glyphicon glyphicon-remove adel' idx='"+dto.idx+"'></span>";
											}
											s += "<br>";
										})
						$("div.alist").html(s);
					}
				})
	}
</script>
</head>
<body>
<div class="container">
  <!-- Trigger the modal with a button -->
 
  <!-- Modal -->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글 수정</h4>
        </div>
        
        <div class="modal-body">
          <input type="text" id="acontent">
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
	<div>
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td>
						<h3><b>${dto.subject }</b> 
						<span style="color: gray; float: right; font-size: 13px;">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm" /></span></h3> 
								<span>작성자: ${dto.name }(${dto.myid })</span> 
								
						<c:if test="${dto.uploadfile!='no' }">
							<span style="float: right;"> 
							<a href="download?clip=${dto.uploadfile}"> <!-- 다운로드, downloadcontroller매핑 -->
								<span class="glyphicon glyphicon-download-alt"></span><b>${dto.uploadfile }</b>
							</a>
							</span>
						</c:if>
				</td>
			</tr>

			<tr>
				<td><c:if test="${bupload==true }">
						<h3>업로드 파일이 이미지</h3>
						<img alt="" src="../photo/${dto.uploadfile }" style="max-width: 200px;">
					</c:if> <br> <br> 
					<pre style="background-color: #fff; border: 0px;">${dto.content }</pre>
 
					<br> <b>조회수:${dto.readcount }</b>&nbsp;&nbsp;&nbsp;
					
					<b>댓글수:<span class="acount"></span></b>
				</td>
			</tr>

			<tr>
				<td>
					<!-- 리스트 출력할 곳 -->
					<div class="alist"></div> 
					<c:if test="${sessionScope.loginok!=null }">
						<div class="aform">
							<div class="form-inline">
								<input type="hidden" id="num" value="${dto.num }"> <input
									type="text" class="form-control" placeholder="댓글입력"
									id="content" style="width: 500px;">
								<button type="button" class="btn btn-default" id="btnansweradd">등록</button>
							</div>
						</div>
					</c:if>
				</td>
			</tr>


			<!-- 버튼 -->
			<tr>
				<td align="right">
					<!-- 글쓰기는 로그인중일때만 --> 
					<c:if test="${sessionScope.loginok!=null }">
						<button type="button" class="btn btn-default"
							onclick="location.href='form'">글쓰기</button>
					</c:if>
					<button type="button" class="btn btn-default"
						onclick="location.href='list?currentPage=${currentPage}'">목록</button>
					<!-- 로그인중이면서 자기글만 수정, 삭제 버튼 보이게 --> <c:if
						test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
						<button type="button" class="btn btn-default"
							onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
						<button type="button" class="btn btn-default"
							onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>