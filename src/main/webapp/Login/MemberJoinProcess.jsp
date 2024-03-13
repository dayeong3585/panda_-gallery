<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-08
  Time: 오전 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%--데이터 베이스를 제어하기 위한 클래스 import--%>
<%@ page import="com.bitc.project_kdy.database.MemberDao" %>
<%@ page import="com.bitc.project_kdy.database.MemberDto" %>
<%--자바스크립트를 사용하기 위한 클래스 import--%>
<%@ page import="com.bitc.project_kdy.utils.JSFunction" %>

<%
//  회원 가입을 위한 파라미터 값 가져오기
  request.setCharacterEncoding("UTF-8");

  String id = request.getParameter("id");
  String pwd = request.getParameter("pwd");

//  DTO 객체에 파라미터값
  MemberDto member = new MemberDto();
  member.setId(id);
  member.setPass(pwd);

//  데이터 베이스를 제어하기 위한 DAO 타입 객체 생성
  MemberDao dao = new MemberDao(application);
//  데이터 베이스 연결
  dao.dbOpen();
//  DTO 객체를 매개변수로 사용하는 insertMember 를 실행하여 회원 가입
  int result = dao.insertMember(member);
  dao.dbClose();

  if (result > 0) {
//    회원 가입 성공 시 로그인 페이지로 이동
    JSFunction.alertLocation("회원 가입 되었습니다.", "./LoginForm.jsp", out);
  }
  else {
//    회원 가입 실패 시 회원 가입 페이지로 돌아가기
    JSFunction.alertBack("회원 가입 중 오류가 발생했습니다.", out);
  }
%>