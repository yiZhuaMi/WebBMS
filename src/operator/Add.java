package operator;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {

	public Add() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		doPost(request,response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		request.setCharacterEncoding("UTF-8");
		
		String Aname = request.getParameter("Aname");
		System.out.println("(modify.java)Aname:"+Aname);
		
		String Aauthor = request.getParameter("Aauthor");
		System.out.println("(modify.java)Aauthor:"+Aauthor);
		
		float Aprice = Float.valueOf(request.getParameter("Aprice"));
		System.out.println("(modify.java)Aprice:"+Aprice);
		
		String Acate = request.getParameter("Acate");
		System.out.println("(modify.java)Acate:"+Acate);
		
		String Aremark = request.getParameter("Aremark");
		System.out.println("(modify.java)Aremark:"+Aremark);
		
		@SuppressWarnings("rawtypes")
		Operator Add = new Operator();
		String isSucsess = Add.add(Aname,Aauthor,Aprice,Acate,Aremark);
		
		request.setAttribute("isSucsess", isSucsess);
		
		RequestDispatcher dispatcher = 	request.getRequestDispatcher("addUI.jsp");	
		dispatcher.forward(request, response);
	}

	
	public void init() throws ServletException {
		
	}

}
