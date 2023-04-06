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
	<h3 class="alert alert-warning">메뉴이름 입력 후 엔터를 눌러주세요</h3>
	<br>
	<input type="text" id="text3">
	<div id="out3"></div>
	
	<script type="text/javascript">
		$("#text3").keyup(function(key){
			var a=$(this).val();
			
			if(key.which==13){
				
				$.ajax({
					type:"get",
					dataType:"json",
					url:"list2",
					success:(function(res){
						
						var s="";
						
						$.each(res,function(i,ele){
							if(ele.name==a){
								s+="<figure>";
								s+="<img src='upload/"+ele.photo+"' width=150>";
								s+="<figcaption><b>";
								s+=ele.name;
								s+="</b></figcaption>";
								s+="</figure>";
							}
							
							$("#out3").html(s);
						});
						
					})
				})
				
			}
			
		})
	
	</script>
	
</body>
</html>