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
    <style type="text/css">
    	img{
    		width: 750px;
    	}
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<img alt="" src="${root }/image/banner-1.gif"><br><br>	
<img alt="" src="${root }/image/banner-2.jpg"><br><br>	
<img alt="" src="${root }/image/banner-3.jpg"><br><br>	
<h1><b>Main Page 입니다</b></h1>
</body>
</html>