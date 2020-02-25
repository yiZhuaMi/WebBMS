package operator;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Book;

public class search extends HttpServlet {

	private Vector<Book> booklist=new Vector<Book>();
	
	public search() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		doPost(request,response);
	}
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		
	//	response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");

		String SKeyword = request.getParameter("SKeyword");
		String MKeyword = request.getParameter("MKeyword");
		String DKeyword = request.getParameter("DKeyword");
		

		RequestDispatcher dispatcher = null;
		
		if(SKeyword!=null)
		{			
			String temp[] = new String[2];
			temp[0] = "search";
			temp[1] = SKeyword;
			System.out.println("(search)temp[0]:"+temp[0]+"  temp[1]:"+temp[1]);
			Record rc = new Record();
			rc.writeToTxt(temp);
			
			System.out.println("开始查询 SKeyword:"+SKeyword);
			@SuppressWarnings("rawtypes")
			Operator Search = new Operator();
			booklist = Search.search(SKeyword);
			
			request.setAttribute("SSearchResult", booklist);
			
			dispatcher = request.getRequestDispatcher("searchUI.jsp");	
		}
		else if(MKeyword!=null)
		{
			System.out.println("开始查询 MKeyword:"+MKeyword);
			
			@SuppressWarnings("rawtypes")
			Operator Search = new Operator();
			booklist = Search.search(MKeyword);
			
			request.setAttribute("MSearchResult", booklist);
			
		    dispatcher = request.getRequestDispatcher("modifyUI.jsp");	
		}
		else if(DKeyword!=null)
		{
			System.out.println("开始查询 DKeyword:"+DKeyword);
			
			@SuppressWarnings("rawtypes")
			Operator Search = new Operator();
			booklist = Search.search(DKeyword);
			
			request.setAttribute("DSearchResult", booklist);
			
			dispatcher = request.getRequestDispatcher("deleteUI.jsp");	
		}
		
			dispatcher.forward(request, response);
	}

	
	public void init() throws ServletException {
		
	}

}
