
<%@ page import="com.mvc.model.BoardDTO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    BoardDTO board = (BoardDTO) request.getAttribute("board");
    String pageNum = request.getParameter("pageNum");
    String sessionMemberId = (String) session.getAttribute("sessionMemberId");
%>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <meta charset="utf-8">
    <title>Board</title>
</head>
<body>
<jsp:include page="/inc/menu.jsp" />
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">게시판</h1>
    </div>
</div>

<div class="container">
        <div class="form-group row">
            <label class="col-sm-2 control-label" >성명</label>
            <div class="col-sm-3">
               <%=board.getName()%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label">제목</label>
            <div class="col-sm-5">
                <%=board.getSubject()%>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label">내용</label>
            <div class="col-sm-8" style="word-break: break-all;">
               <%=board.getContent()%>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10">
                <%
                    if(sessionMemberId != null && sessionMemberId.equals(board.getMemberId())){


                %>
                <form name="frmView" method="post">
                    <input type="hidden" name="pageNum" value="<%=pageNum%>">
                    <input type="hidden" name="num" value="<%=board.getNum()%>">
                </form>
                <span class="btn btn-danger btn-remove"> 삭제 </span>
                <span class="btn badge-success btn-modify"> 수정 </span>
                <%
                    }
                %>
                <a href="./boardList.do?pageNum=<%=pageNum%>" class="btn btn-primary"> 목록</a>
            </div>
        </div>
    <hr>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function (){
        const  btnModidy = document.querySelector('.btn-modify');
        const  btnRemove = document.querySelector('.btn-remove');
        const  frmView = document.querySelector('form[name=frmView]');

        btnModidy.addEventListener('click', function (){
            frmView.action = './boardModifyForm.do';
        });
        btnRemove.addEventListener('click', function (){
            frmView.action = './boardRemoveAction.do';
            frmView.submit();
        });
    });
</script>
<jsp:include page="../inc/footer.jsp" />
</body>
</html>
