<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username = String.valueOf(session.getAttribute("username"));
%>
		
			<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel='icon' href='/WebBMS/images/Navigation Bar.ico ' type=‘image/x-ico’ /> 
		<link rel="stylesheet" type="text/css" href="welcome.css" />
		<title>小白云图书管理系统 首页</title>
	</head>
	<body style="background-color:black">
		<div style="background:url('/WebBMS/images/tushuguan.jpg');background-attachment:fixed;width:100%; height:140%;margin:0px padding-top:1px">
		<a href="logout.jsp" style="color:#0066CC;margin:10px 0 0 1340 ;font-size:13px">注销:<%=username%></a>
 	<br><br>
 	
	<h1 align="center" style="color:#fff ;margin:36px 900 0 10; width: 625px; height: 66px">小白云牌</h1>
	<h1 align="center" style="color:#fff ;margin:10px 00 0 84; width: 625px; height: 66px">图书管理系统</h1>
		<br><br><br><br>
		
		<p align="center" style="color:#fff;font-size:24px">欢迎您：<%=username%></p>
			
			<br><br><br>
			
		<p align="center" id="slick-login">
		
			<input type="button" name="Button" class="SButton" onclick="window.location.href='searchUI.jsp'" />
			<input type="button" name="Button" class="MButton" onclick="window.location.href='modifyUI.jsp'" />
			<input type="button" name="Button" class="DButton" onclick="window.location.href='deleteUI.jsp'" />
			<input type="button" name="Button" class="AButton" onclick="window.location.href='addUI.jsp'" />
		
		</p>
		</div>
		 <div id="chang" >
	   			 <h3 style="margin:40 0 10 0;color:#999" >@小白云牌图书管理系统</h3>
		   		 <br>
		   	 	<a href="http://weibo.com/u/2157677315">@易爪米</a>
		   	 	<br>
		   	 	<h3 style="margin:20 0 0 0;color:#999" >特别鸣谢：吴晗</h3>
		   	 	<br>
		   	 	<h3 style="margin:20 0 0 0;color:#999">TTMARFF@163.COM</h3>
		   	 	<br>
		   	 	<h3 style="margin:10 0 0 0;color:#999">©2016 Mach. All rights reserved.</h3>
		   	 </div>
	</body>
</html>
		
	