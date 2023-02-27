<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<button type="button" class="btn btn-info" id="btn1">studentToJson읽기</button>
	<button type="button" class="btn btn-info" id="btn2">foodToXml읽기</button>

	<div id="show"></div>
	
	<script type="text/javascript">
	$("#btn1").click(function() {
		
		 $.ajax({
			
			 type: "get",
			 url:"studentToJson.jsp",
			 dataType:"json",
			 success:function(res){
				
				 var s="";
				
				 $.each(res,function(i,item){
					
					 s+="<div class='alert alert-warning' style='width:300px;'>";
					 s+="index: "+i+"<br>";
					 s+="num :"+item.num+"<br>";
					 s+="학생명: "+item.stuname+"<br>";
					 s+="<img src='"+item.stuphoto+"' width='100'>";
					 s+="자바점수: "+item.java+"<br>";
					 s+="에이잭스점수: "+item.ajax+"<br>";
					 
					 s+="</div><br>";
				 });
				
				 $("#show").html(s);
			 }
		 });
	});

	
	$("#btn2").click(function() {
		
		$.ajax({
   		 type: "get",
   		 url:"foodToXml.jsp",
   		 dataType:"xml",
   		 success:function(res){
   			
   			 var s="";
   			 $(res).find("food").each(function(i,ele){
   				 
   				 var n=$(ele);
   				 
   				 s+="<div class='alert alert-info' style='width:400px;'>";
   				 s+="No: "+n.attr("num")+",";
   				 s+="음식이름: "+n.find("foodname").text()+"<br>";
				 s+="<img src='"+n.find('foodphoto').text()+"' width='100'>";
   				 s+="가격: "+n.find("price").text()+"<br>";
   				 s+="수량: "+n.find("cnt").text()+"<br>";
   				 s+="</div>";
   			 });
   			 
   			 $("#show").html(s);
   		 }
   	 })
	})
	</script>
</body>
</html>