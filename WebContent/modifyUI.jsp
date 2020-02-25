<%@ page language="java" import="java.util.*" import="model.Book" pageEncoding="UTF-8"%>                                                    
<%                                                                                                                                 
String username = String.valueOf(session.getAttribute("username"));                                                                         
System.out.println("(welcome.jsp)username:"+username);                                
                                                                                                                                         
	String path = request.getContextPath();                                                                                                 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";                               
	                                                                                                                                        
	Vector<Book> booklist=(Vector<Book>)request.getAttribute("MSearchResult");                                                              
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
	  		<link rel="stylesheet" type="text/css" href="modifyUI.css">                                                                           
		                                                                                                                          
		    <base href="<%=basePath%>">                                                                                                         
		                                                                                                                                        
		    <title>小白云图书管理系统 修改图书</title>                                                                                  
		                                                                                                                                        
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
			<h3 align="center">---------------修改图书----------------</h3>                                                                     
			 
			<form action="search" method="POST" style="margin:60px">
			<p align="center">
			<input type="text" name="MKeyword" style=" border:3px #009966 solid;width: 488px;height:29;color:#999 "placeholder="请输入关键字搜索需要修改的图书" value=""/>	
			<input type="submit" value="搜索" class="searchbutton" style="vertical-align:middle;">
			</p>
			</form>
		<br>

			<%if(booklist!=null)                                                                                                            
			{                                                                                                                               
				%>
					<div style="display:none">                                                                                                                        
						<form action="Modify" method="POST">                                                                                    
						<p align="center" id="turemodify">                                                                                                      
						请输入需要修改的信息                                                                                                           
						<input type="text" name="Mid" style="width: 61px;color:#999 "placeholder="图书编号" value=""/>
						<input type="text" name="Mname" style="width: 61px;color:#999 "placeholder="书名"  value=""/>
						<input type="text" name="Mauthor" style="width: 61px;color:#999 "placeholder="作者"  value=""/>
						<input type="text" name="Mprice" style="width: 61px;color:#999 "placeholder="价格"value=""/>
						<input type="text" name="Mcate" style="width: 61px;color:#999 "placeholder="分类"  value=""/>
						<input type="text" name="Mremark" style="width: 61px;color:#999 "placeholder="备注" value=""/>	            
						<input type="submit" value="修改"  class="modify" onclick="submitData(this)">                                                                                        
						<br>                                                                                                                    
						</p>                                                                                                                    
						</form> 
					
					</div>                                                                                                                  
				<%                                                                                                                          
			}%>               
		                                                                             
			<%if(isSucsess.equals("yes"))                                                                                                   
					{                                                                                                                       
						%><h2 align="center" style="color:#911">修改成功！</h2><%                                                                
					}                                                                                                                       
					else if(isSucsess.equals("no"))                                                                                         
					{                                                                                                                       
						%><h2 align="center" style="color:#911">修改失败！</h2><%                                                                
					}%>                                                                                                                     
			                                                                                                                                
			<%if(booklist!=null)                                                                                                        
			{%>                                                                                                                             
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
				<%if(row!=-1){ %>                                                                                                           
					                                                                                                                        
					<%for(int i = 0;i<row;i++)
					{%>                                                                                           
					                                                                                                                        
						<tr class="alltr">                                                                                                                    
						<td><%= booklist.get(i).bookid %></td>                                                                                  
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).bookname %></td>                                                                                
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).author %></td>                                                                                  
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).price %></td>                                                                                   
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).category %></td>                                                                                
						<td ondblclick="ShowElement(this)"><%= booklist.get(i).remark %></td>
						<td><input type="button" value="修改" class="modify" onclick="submitData(this)"></td>                                                                                  
			   		   </tr>                                                                         
		   		                                                                                                                            
		   		   <%}%>                                                                                                                    
	   		                                                                                                                                
			</table> 
			<script type="text/javascript">
			 function submitData (element) 
			 {
			 	var thisparent = element.parentNode.parentNode;
			
			 	var alltd = thisparent.querySelectorAll('td');
		
			 	var modify = document.querySelector('.modify');
			 
			 	var turemodify = document.querySelector('#turemodify');
			 	
			 	var inputval = turemodify.querySelectorAll('input');
			
				for(var i = 0;i < inputval.length-1;i ++ ) {
					inputval[i].value = alltd[i].textContent;
					if (i==5) 
					{
						inputval[6].click();
					}
					
				}

			 	
			 }
			 
			function ShowElement(element)
			{
				var oldhtml = element.innerHTML;
				var newobj = document.createElement('input');
				//创建新的input元素
				newobj.type = 'text';
				//为新增元素添加类型
				newobj.onblur = function()
				{
					element.innerHTML = this.value ? this.value : oldhtml;
					//当触发时判断新增元素值是否为空，为空则不修改，并返回原有值 
				}
				element.innerHTML = '';
				element.appendChild(newobj);
				newobj.focus();
			 }
			 
			 function getTdDirectly()
			 {
				var tdobj = document.getElementById('mytd');
				alert(tdobj.innerText);
			 }
			
			 </script>                                                                                                       
			 <%}else{%>                                                                                                                     
	   		   		                                                                                                                        
	   		   		<h2 align="center" style="color:#911">什么都没有找到！～</h2>                                                                    
	   		                                                                                                                                
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
     	</script>                                                                                                                               
	</html>                                                                                                                                 
                                                                                                                              
                                                                                                                                            