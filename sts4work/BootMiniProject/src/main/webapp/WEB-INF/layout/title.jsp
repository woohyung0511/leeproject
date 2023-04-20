<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<a href="${root }">
		<img alt="" src="${root }/image/title.png">
		<b style="font-size: 30pt;">SpringBoot+MyBatis+Tiles</b>
	</a>
	
	<div class="container">
	<c:if test="${sessionScope.loginok==null }">
  <!-- Trigger the modal with a button -->
  		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin-left: 600px;">로그인</button>
	</c:if>

	<c:if test="${sessionScope.loginok!=null }">
		<button type="button" class="btn btn-danger btn-sm"
		id="btnlogout" style="margin-left: 600px;">로그아웃</button>
	</c:if>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원 로그인</h4>
        </div>
        
        <div class="modal-body">
          	<span class="glyphicon glyphicon-user">아이디</span>
          		<input type="text" class="form-control" id="loginid">
          	<span class="glyphicon glyphicon-lock">비밀번호</span>
          		<input type="text" class="form-control" id="loginpass">
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnloginok">로그인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</div>

<!-- 로그인에 대한 ajax 스크립트 처리 -->
<script type="text/javascript">

	//팝업창에 있는 로그인 버튼
	$("#btnloginok").click(function(){
		
		//아이디 비번 읽기
		var id=$("#loginid").val();
		var pass=$("#loginpass").val();
		var root='${root}';
		
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:root+"/member/login",
			data:{"id":id,"pass":pass},
			success:function(res){
				
				if(res.result=='fail'){
						alert("아이디나 비번이 맞지 않습니다");
					}else{
						location.reload();
					}
			}
		});
	});
	
	//로그아웃
	$("#btnlogout").click(function(){
		
		var root='${root}';
		$.ajax({
			type:"get",
			url:root+"/member/logout",
			dataType:"text",
			success:function(res){
				location.reload();
			}
		});
	});
</script>
</body>
</html>