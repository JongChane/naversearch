<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.math.BigInteger" %>
<%@page import="java.security.SecureRandom" %>
<%@page import="java.net.URLEncoder" %>    
<%-- /naversearch/src/main/webapp/naverlogin.jsp
		네이버 로그인 시스템에서 호출되는 콜백 URL
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
</head>
<body>
	<%
	String clientId = "eweYI68MnHRpSDBwQL5V";
	String redirectURI = URLEncoder.encode("http://localhost:8080/naversearch/loginsuccess.jsp","UTF-8");
	SecureRandom random = new SecureRandom(); //난수발생기. Rnadom 클래스와 같은 기능
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state; //임의의 수
	session.setAttribute("state", state);
	%>
	<a href="<%=apiURL%>">
		<img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/>
	</a>
</body>
</html>