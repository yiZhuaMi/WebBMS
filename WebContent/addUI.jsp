<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username = String.valueOf(session.getAttribute("username"));    
String isSucsess = String.valueOf(request.getAttribute("isSucsess"));                                
if(!username.equals("null"))                                                                                                               
{   

%>

	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	 	<link rel='icon' href='/WebBMS/images/Navigation Bar.ico ' type=‘image/x-ico’ /> 
	 	<link rel="stylesheet" type="text/css" href="addUI.css" />                                 
	  	                          
	    <base href="<%=basePath%>">
	    
	    <title>小白云图书管理系统 添加图书</title>
	    
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
	
	  </head>
	  
	  <body>
	  	<div style="background:url('/WebBMS/images/tushuguan.jpg');background-attachment:fixed;width:100%; height:140%;margin:0px padding-top:1px">
	  		<ul id="nav"> 
	  		
		    <li><a href="welcome.jsp">首页</a></li> 
		    <li><a href="searchUI.jsp">查询图书</a></li> 
		    <li><a href="addUI.jsp">增添图书</a></li> 
		    <li><a href="modifyUI.jsp">修改图书</a></li> 
		    <li><a href="deleteUI.jsp">删除图书</a></li> 
			</ul> 
		    <a href="logout.jsp" style="color:#0066CC;margin:10px 0 0 1340 ;font-size:13px">注销:<%=username%></a>
		  	<br><br>
	  
	   		<h1 align="center">小白云牌图书管理系统</h1>                                                                                              
			<h3 align="center">---------------增添图书----------------</h3>  
			<br>
			<%if(isSucsess.equals("yes"))
			{
				%><h2 align="center" style="color:#911">添加成功！</h2><%
			}
			else if(isSucsess.equals("no"))
			{
				%><h2 align="center" style="color:#911">添加失败！</h2><%
			}%>
	
			<form action="Add" method="POST" style="margin:60px">
	
			 <table width="90%" class="table" style="height: 112px; width: 808px; ">                                                      
				<tr>                                                                                                                                                                                                                           
					<th>图书名称</th>                                                                                                           
					<th>图书作者</th>                                                                                                           
					<th>图书价格</th>                                                                                                           
					<th>图书分类</th>                                                                                                           
					<th>图书备注</th>                                                                                                           
				</tr> 
				<tr>
					<td>
						<input type="text" name="Aname" style="width:100%; height:100%;border:0px">
                    </td>
					<td>
						<input type="text" name="Aauthor" style="width:100%; height:100%;border:0px">
                    </td>
					<td>
						<input type="text" name="Aprice" style="width:100%; height:100%;border:0px">
                    </td>
					<td>
						<input type="text" name="Acate" style="width:100%; height:100%;border:0px">
                    </td>
					<td>
						<input type="text" name="Aremark" style="width:100%; height:100%;border:0px">
                    </td>
				</tr>   
			</table>       

			
				<p align="center">	
				<input type="submit" class="addbutton" name="add"value="添加">
				</p>
		    </form>
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
<%}
else
{
	System.out.println("跳转至登录界面。。。");
	response.sendRedirect("login.jsp");
}%>