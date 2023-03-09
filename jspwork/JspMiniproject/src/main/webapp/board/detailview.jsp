<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
span.day{
  color: gray;
  font-size: 0.8em;
}
div.alist{
  margin-left: 20px;
}
div.alist span.aday{
  float: right;
  font-size: 0.8em;
  color: gray;
  
}
button.adel{
   margin-left: 10px;
}

button.amod{
   margin-left: 5px;
}
</style>

<script type="text/javascript">
$(function(){
	
	//처음에 시작시 리스트 호출
	list();
	
	//댓글부분에 넣을 num출력호출
	var num=$("#num").val();
	//alert(num);
	
	//insert
	$("#btnanswer").click(function(){
		
		var nickname=$("#nickname").val();
		var content=$("#content").val();
		
		$.ajax({
			
			type:"get",
			url:"smartanswer/insertanswer.jsp",
			dataType:"html",
			data:{"num":num,"nickname":nickname,"content":content},
			success:function(){
				
				//alert("success");
				//기존입력값 지우기
				$("#nickname").val(" ");
				$("#content").val('');
				
				//댓글추가한후 댓글목록 다시출력
				list();
			}
			
		});
		
	});
	
	
	//삭제
	
	$(document).on("click",".adel",function(){
		
		var a=confirm("댓글을 삭제하려면 [확인]을 눌러주세요");
		
		var idx=$(this).attr("idx");
		//alert(idx);
		
		if(a){
			$.ajax({
				
				type:"get",
				url:"smartanswer/deleteanswer.jsp",
				dataType:"html",
				data:{"idx":idx},
				success:function(){
					
					list();
				}
			});
		}
	});
	
	//수정 폼 띄우기..모달
	$(document).on("click",".amod",function(){
		
		idx=$(this).attr("idx");
		//alert(idx);
		
		$.ajax({
			
			type:"get",
			url:"smartanswer/jsonupdateform.jsp",
			dataType:"json",
			data:{"idx":idx},
			success:function(res){
				//수정 폼에 닉네임,내용 띄우기
				$("#unickname").val(res.nickname);
				$("#ucontent").val(res.content);
			}
		});
		
		$("#myModal").modal();
	});
	
	//수정
	$(document).on("click","#btnupdate",function(){
		
		var nickname=$("#unickname").val();
		var content=$("#ucontent").val();
		
		$.ajax({
			
			type:"get",
			url:"smartanswer/updateanswer.jsp",
			dataType:"html",
			data:{"idx":idx,"nickname":nickname,"content":content},
			success:function(){
				
				list();
			}	
		});
	});
});
//list 사용자정의함수
function list()
{
	console.log("list num="+$("#num").val());
	
	$.ajax({
		
		type:"get",
		url:"smartanswer/listanswer.jsp",
		dataType:"json",
		data:{"num":$("#num").val()},
		success:function(res){
			
			//댓글갯수출력
			$("b.acount>span").text(res.length);
			
			var s="";
			
			$.each(res,function(idx,item){
				
				s+="<div>"+item.nickname+":  "+item.content;
				s+="<span class='aday'>"+item.writeday+"</sapn>";
				s+="<button type='button' idx="+item.idx+" class='btn btn-info btn-xs adel'>삭제</button>";
				s+="<button type='button' idx="+item.idx+" class='btn btn-defualt btn-xs amod'>수정</button>";
				s+="</div>";
			});
			
			$("div.alist").html(s);
		}
	});
}
</script>
</head>
<body>
<%
	SmartDao dao=new SmartDao();
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//조회수증가
	dao.updateReadcount(num);
	
	//dto가져오기
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>

<div style="margin: 30px 30px;">

<input type="hidden" id="num" value="<%=num%>">

  <table class="table table-bordered" style="width: 600px;">
    <caption>
            <h3><b><%=dto.getSubject() %></b></h3></caption>
       
       <tr>
         <td>
           <b>작성자: <%=dto.getWriter() %></b><br>
           <span class="day"><%=sdf.format(dto.getWriteday()) %>
           &nbsp;&nbsp;조회 <%=dto.getReadcount() %>
           </span>
         </td>
       </tr>
       
       <tr>
         <td>
           <%=dto.getContent() %>
         </td>
       </tr>
       
       <!-- 댓글 -->
       <tr>
         <td>
            <b class="acount">댓글 <span style="color: red; font-weight: bold;">0</span></b>
            <div class="alist">
               댓글목록
            </div>
            
            <div class="aform form-inline">
              <input type="text" id="nickname" class="form-control" style="width: 100px;"
              placeholder="닉네임입력">
              <input type="text" id="content" class="form-control" style="width: 300px;"
              placeholder="댓글입력">
              <button type="button" id="btnanswer" class="btn btn-info">저장</button>
              
            </div>
         </td>
       </tr>
       
       
       
       <tr>
         <td align="right">
           <button type="button" class="btn btn-default" 
           onclick="location.href='index.jsp?main=board/smartform.jsp'">
           <span class="glyphicon glyphicon-pencil"></span>글쓰기</button>
           
           
           <button type="button" class="btn btn-default" 
           onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">
           <span class="glyphicon glyphicon-edit"></span>수정</button>
           
           
           <button type="button" class="btn btn-default" 
           onclick="funcdel(<%=num%>,<%=currentPage%>)"><span class="glyphicon glyphicon-remove"></span>삭제</button>
           
           
           <button type="button" class="btn btn-default" 
           onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-th-list"></span>목록</button>
         </td>
       </tr>
  </table>
</div>

<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글수정</h4>
        </div>
        
        <div class="modal-body">
          <b>닉네임: </b>
          <input type="text" id="unickname" style="width: 100px;">
          <b>댓글내용: </b>
          <input type="text" id="ucontent" style="width: 200px;">
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"
          id="btnupdate">댓글수정</button>
        </div>
      </div>
      
    </div>
  </div>

<script type="text/javascript">
  function funcdel(num,currentPage){
	  
	 // alert(num+","+currentPage);
	 
	 var a=confirm("삭제하려면 [확인] 을 눌러주세요");
	 
	 if(a){
		 location.href="board/delete.jsp?num="+num+"&currentPage="+currentPage;
	 }
	 
  }
</script>
</body>
</html>