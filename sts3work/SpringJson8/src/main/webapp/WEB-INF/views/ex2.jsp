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
</head>
<body>
	<h3 class="alert alert-warning">Ex2 예제</h3>
	<br>
	<button type="button" id="btn2" class="btn btn-warning">list2 json배열데이터 출력하기</button>
	<div id="out2"></div>
	
	<script type="text/javascript">
		$("#btn2").click(function(){
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"list2",
				success:function(res){
					
					var s="";
					$.each(res,function(i,ele){
						
						s+="<figure>";
						s+="<img src='upload/"+ele.photo+"' width=150>";
						s+="<figcaption><b>";
						s+=ele.name;
						s+="</b></figcaption>";
						s+="</figure>";
					});
					
					$("#out2").html(s);
				}
			});
		});
	</script>
</body>
</html>