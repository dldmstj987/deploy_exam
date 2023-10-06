<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
%>
<%@ include file="../inc/dbconn.jsp"%>

<%
  PreparedStatement preparedStatement = null;
  ResultSet resultSet = null;
  String sql = "SELECT * FROM member WHERE memberId=?";
  preparedStatement = connection.prepareStatement(sql);
  preparedStatement.setString(1, id);
  resultSet = preparedStatement.executeQuery();
  if(resultSet.next()){
    out.print("{\"result\":\"true\"}");
  } else{
    out.print("{\"result\":\"false\"}");
  }
  if(resultSet != null) resultSet.close();
  if(preparedStatement != null) preparedStatement.close();
  if(connection != null) connection.close();
%>

<script>

  //2. ajax를 이용한 Id 중복확인
  const xhr = new XMLHttpRequest(); //XMLHttpRequest 객체 생성
  const btnIsDuplication2nd = document.querySelector('input[name=btnIsDuplication2nd]');
  btnIsDuplication2nd.addEventListener('click', function (){
    const memberId = frmMember.memberId.value; //아이디 input에 있는 값
    xhr.open('GET', 'ajaxIdCheck.jsp?id=' + memberId);
    xhr.send();

    xhr.onreadystatechange = () => {

      if (xhr.readyState !== XMLHttpRequest.DONE) return;

      if(xhr.status === 200){

        const  json = JSON.parse(xhr.response);
        if(json.result === 'true'){
          alert('동일한 아이디가 있습니다.')
        }
        else{
          alert('동일한 아이디가 없습니다.')
        }
      }
      else{ //서버(url)에 문서가 존재하지 않음
        console.error('Error', xhr.status, xhr.statusText);
      }
    }
  });

  //3번 ajax를 이용한 실시간 ID 중복확인
  //2번에서 작업된 파일을 이용
  const inputId = document.querySelector('input[name=memberId]');
  inputId.addEventListener('keyup', function (){
    const id = frmMember.memberId.value;
    const memberIdCheck = document.querySelector('.memberIdCheck');
    xhr.open('GET', 'ajaxIdCheck.jsp?id=' + id);
    xhr.send(); //url에 요청을 보냄

    xhr.onreadystatechange = () => {
      if(xhr.readyState !== XMLHttpRequest.DONE) return;

      if(xhr.status === 200){  //서버(url)에 문서가 존재함
        const json = JSON.parse(xhr.response);
        if(json.result === 'true'){
          memberIdCheck.style.color = 'red';
          memberIdCheck.innerHTML = '동일한 아이디가 있습니다.'
        }
        else{
          memberIdCheck.style.color ='gray';
          memberIdCheck.innerHTML = '동일한 아이디가 없습니다.'
        }
      }
      else{
        console.error('Error', xhr.status, xhr.statusText);
      }
    }
  });
</script>
