package operator;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Book;

public class Modify extends HttpServlet {

	private Vector<Book> booklist=new Vector<Book>();
	
	public Modify() {
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

		int Mid = Integer.parseInt(request.getParameter("Mid"));
		String Mname = request.getParameter("Mname");
		String Mauthor = request.getParameter("Mauthor");
		float Mprice = Float.valueOf(request.getParameter("Mprice"));
		String Mcate = request.getParameter("Mcate");
		String Mremark = request.getParameter("Mremark");
		
		System.out.println("(modify.java)Mid:"+Mid);
		System.out.println("(modify.java)Mname:"+Mname);
		System.out.println("(modify.java)Mauthor:"+Mauthor);
		System.out.println("(modify.java)Mprice:"+Mprice);
		System.out.println("(modify.java)Mcate:"+Mcate);
		System.out.println("(modify.java)Mremark:"+Mremark);
		
		@SuppressWarnings("rawtypes")
		Operator Modify = new Operator();
		String isSucsess = Modify.modify(Mid,Mname,Mauthor,Mprice,Mcate,Mremark);
		
		
		
		request.setAttribute("isSucsess", isSucsess);
		
		RequestDispatcher dispatcher = 	request.getRequestDispatcher("modifyUI.jsp");	
		dispatcher.forward(request, response);
		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
