<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String isSucsess = String.valueOf(request.getAttribute("isSucsess"));

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	  <head>
	  		<link rel='icon' href='/WebBMS/images/Navigation Bar.ico ' type=‘image/x-ico’ /> 
	  		<link rel="stylesheet" type="text/css" href="login.css" />
	  		<link rel="stylesheet" type="text/css" href="quan.css" />
				
		    <base href="<%=basePath%>">
		    
		    <title>小白云图书管理系统 登录界面</title>
		    
			<meta http-equiv="pragma" content="no-cache">
			<meta http-equiv="cache-control" content="no-cache">
			<meta http-equiv="expires" content="0">    
			<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
			<meta http-equiv="description" content="This is my page">
	
	  </head>
  
	 <body>
	 	
	 	<div style="background:url('/LWC_MTMS/images/tushuguan.jpg');width:100%; height:100%;margin:0px padding-top:1px">
	 	
	 	<br><br>
		<h1 align="center" style="color:#fff ;margin:0px 900 0 10; width: 625px; height: 66px">小白云牌</h1>
		<h1 align="center" style="color:#fff ;margin:10px 00 0 84; width: 625px; height: 66px">图书管理系统</h1>
		
			
		<%if(isSucsess.equals("wrongpassword"))
			{
				%><h2 align="center" style="color:#911; font-size:20px;margin:100 0 0 0">❌密码错误！</h2><%
			}
			else if(isSucsess.equals("userdoesnotexist"))
			{
				%><h2 align="center" style="color:#911; font-size:20px;margin:100 0 0 0">❌用户不存在！</h2><%
			}%>
		
	  	<form action="IdentityVerify" method="POST" name="Login" id="slick-login">
			<p align="center"style="color:#fff">
				<input type="text" placeholder="请输入账号" name="user" value="" style="width: 221px;color:#999"id="login"onfocus="javascript:this.value=''"/>
				<!-- <input type="text" value="请输入要查找的关键字" onfocus="if(value=='请输入要查找的关键字')value=''" onblur="if(!value)value='请输入要查找的关键字'" name="keyword" >  -->
	
			<br><br>
				<input type="password" placeholder="请输入密码" name="password" value="" style="width: 221px;color:#999"/>
			<br><br>
			<input type="submit" value="登录" >
			</p>
		</form>
		
	      </div>
	 </body>
 
	 <script type="text/javascript">    
		function checkform(){ 
		    if(document.getElementById('login').value.length==0||document.getElementById('login').value=="请输入账号")
		    {    
		        alert('输入为空！');
		        document.getElementById('login').focus();
		        return false;
			}
		}
	</script>


</html>
