<%@ page language="java" import="java.util.*" import="model.Book" pageEncoding="UTF-8"%>
<%
	String username = String.valueOf(session.getAttribute("username"));

	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	Vector<Book> booklist=(Vector<Book>)request.getAttribute("DSearchResult");
	String isSucsess = String.valueOf(request.getAttribute("isSucsess"));

	int row = 0;
	if(booklist!=null)
	{
		
		if(booklist.get(0).bookid!=-1)
		{
			row = booklist.size();
		}
		else
		{
			row = -1;
		}
		
	}
%>

	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<html>
	  <head>
	  		<link rel='icon' href='/WebBMS/images/Navigation Bar.ico ' type=‘image/x-ico’ /> 
	  		<link rel="stylesheet" type="text/css" href="deleteUI.css" />                 
	  		
		    <base href="<%=basePath%>">
		    
		    <title>小白云图书管理系统 删除图书</title>
		    
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
			<h3 align="center">---------------删除图书----------------</h3>
			
			<form action="search" method="POST" style="margin:60px">
			<p align="center">
			<input type="text" name="DKeyword" style=" border:3px #009966 solid;width: 488px;height:29;color:#999 "placeholder="请输入关键字搜索想要删除的图书" value=""/>	
			<input type="submit" value="搜索" class="searchbutton" style="vertical-align:middle;">
			</p>
			</form>
		
		
			
			<%if(isSucsess.equals("yes"))
					{
						%><h2 align="center" style="color:#911">删除成功！</h2><%
					}
					else if(isSucsess.equals("no"))
					{
						%><h2 align="center" style="color:#911">删除失败！</h2><%
					}%>
			
				<%if(booklist!=null) 
			{%>
			   <div style="display:none">
				   <form action="delete" method="POST">
				 	  <p align="center" style="color:#fff" class="inputdel">
				  		 请输入需要删除的
				 		  <input type="text" name="DeleteId" style="width: 57px;color:#999 "placeholder="图书编号" value=""/>	
			   	  		 <input type="submit" name="Delete"value="删除"class="DButton">
				  	 </p>
				   </form>
			   </div>
			     <table width="90%" class="table" id="mytable" style="height: 112px; width: 850px; "> 
				<tr> 
					<th>图书编号</th> 
					<th>图书名称</th> 
					<th>图书作者</th> 
					<th>图书价格</th> 
					<th>图书分类</th> 
					<th>图书备注</th> 
					<th>编辑选项</th> 
				</tr> 
				<%if(row!=-1)
				{%>
					
					<%for(int i = 0;i<row;i++)
					{%> 
					
						<tr class="alltr">
						<td><%= booklist.get(i).bookid %></td>
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).bookname %></td>
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).author %></td>
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).price %></td>
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).category %></td>
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).remark %></td>
						<td><input type="button" value="删除" class="delete" onclick="submitData(this)"></td>        
			   			</tr>
		   		   
		   		   <%}%>
	   		   
			</table> 
		
			
			
			
			 <%}else{%>
	   		   		
	   		   		<h2 align="center" style="color:#911; margin:0 0 820 0">什么都没有找到！～</h2>
	   		 
	   		 <%}%>
	   	 <%}%>
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
	  
	   <script language="javascript">
	   window.onload=function showtable()
		{
			var tablename=document.getElementById("mytable");
			var li=tablename.getElementsByTagName("tr");
			for (var i=0;i<=li.length;i++)
			{
				if (i%2==0)
				{
					li[i].style.backgroundColor="#FAFCFF";
				}
				else 
				li[i].style.backgroundColor="#FFFFFF";
			}
		}
	   function submitData (element) 
		 {
		 	var thisparent = element.parentNode.parentNode;
		 	var alltd = thisparent.querySelectorAll('td');
		 	var inputdel =document.querySelector(".inputdel");

		 	inputdel.querySelectorAll("input")[0].value = alltd[0].textContent;
		 	inputdel.querySelectorAll("input")[1].click();	
		 	
		 }
	 </script>
	</html>
	
