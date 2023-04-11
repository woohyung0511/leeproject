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
	<span class="glyphicon glyphicon-th-large list1" style="font-size: 50pt; cursor: pointer;"></span>
	<span class="glyphicon glyphicon-th-list list2"style="font-size: 50pt; cursor: pointer;"></span>
<div class="restlist" style="margin-top: 50px; margin-left: 50px;"></div>

<script type="text/javascript">
	$("span.list1").click(function(){
		
		$("span.list1").css("color","red");
		$("span.list2").css("color","black");
		
		 	$.ajax({
				type:"get",
				dataType:"json",
				url:"list1",
				success:function(res){
				
					var tag="";
					tag+="<table class='table' style='width: 800px;'>";
					
					$.each(res,function(i,elt){
						
						tag+="<tr height='110'><td>";
						tag+="<h3><b>"+elt.subject+"<b><h3>";
						tag+=elt.content+"<br>";
						
		 				if(elt.photo!='no'){
							tag+="<span style='float:right'>";
							tag+="<img width='100' height='100' src='../photo/"+elt.photo"'><br>";
							tag+="</span>";
						}
						tag+="작성자: "+elt.writer;
						tag+="</td></tr>"; 
					});
					
					tag+="</table>";
					$(".restlist").html(tag);
				}
			});
		});
	
$("span.list2").click(function(){
		
		$("span.list1").css("color","red");
		$("span.list2").css("color","black");
		
	});
</script>
	
</body>
</html>