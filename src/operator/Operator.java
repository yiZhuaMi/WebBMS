package operator;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

import javax.swing.JOptionPane;

import model.Book;
import database.DBConnection;


public class Operator<booklist> 
{

	private Vector<Book> booklist=new Vector<Book>();
	boolean issucsess = true;
	
	public Operator() 
	{
		
	}

	public static void main(String[] args) 
	{
		
	}

	public String add(String bookname,String author,float price,String category,String remark)
	{
		Connection conn = DBConnection.getConnection();
		Statement s=null;
		String isSucsess ="yes";
		try
		{
			s = conn.createStatement();
			String sql =null;
			sql = "insert into booktable(bookname,author,price,category,remark,bookinfo)  values('"+bookname+"','"+author+"','"+price+"','"+category+"','"+remark+"','（无详细信息）')";
			s.executeUpdate(sql);
			System.out.println("增添成功!");
			DBConnection.closeConnection( s, conn);
			
			return isSucsess;
			
		 } 
		catch (SQLException e) 
		{
			e.printStackTrace();
			
			isSucsess = "no";
			
			return isSucsess;
		}
	
		
	}

	public String delete(int bookorder)
	{
		Connection conn = DBConnection.getConnection();
		Statement s=null;

		String isSucsess = "yes";
		
		
		try 
		{
			s = conn.createStatement();
			
			String sql = "delete from booktable where bookid ="+ bookorder+"";
			
//			switch(col)
//			{
//				case 1:sql = "delete from booktable where bookid ="+ bookorder+"";break;
//				
//				case 3:sql = "update booktable set author = null where bookid = "+ bookorder+"";break;
//				
//				case 4:sql = "update booktable set price = null where bookid ="+ bookorder+"";break;
//				
//				case 5:sql = "update booktable set category = null where bookid ="+ bookorder+"";break;
//				
//				case 6:sql = "update booktable set remark = null where bookid ="+ bookorder+"";break;
//			}
			
			s.executeUpdate(sql);
			System.out.println("删除成功!");
			
			DBConnection.closeConnection( s, conn);
			
			return isSucsess;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
						
			DBConnection.closeConnection( s, conn);
			
			isSucsess = "no";
			
			return isSucsess;
		}
		
	}

	public String modify(int Mid,String Mname,String Mauthor,float Mprice,String Mcate,String Mremark)
	{
		Connection conn = DBConnection.getConnection();
		Statement s=null;
		
		String isSucsess = "yes";
		
		try 
		{
			s = conn.createStatement();
			String sql ="update booktable set bookname = '"+Mname+"',author = '"+Mauthor+"',price = '"+Mprice+"',category = '"+Mcate+"',remark = '"+Mremark+"'where bookid = "+Mid+"";
//			switch(col)
//			{
//				case 2 :sql = "update booktable set bookname = '"+newvalue+"'where bookid = "+bookorder+"";break;
//			
//				case 3 :sql = "update booktable set author = '"+newvalue+"'where bookid = "+bookorder+"";break;
//					
//				case 4 :sql = "update booktable set price = '"+newvalue+"'where bookid = "+bookorder+"";break;	
//				
//				case 5 :sql = "update booktable set category = '"+newvalue+"'where bookid = "+bookorder+"";break;	
//				
//				case 6 :sql = "update booktable set remark = '"+newvalue+"'where bookid = "+bookorder+"";break;	
//			
//				//default : JOptionPane.showMessageDialog(null, "��ֵ�Ƿ���");break;
//			}
			
			
			s.executeUpdate(sql);
			System.out.println("修改成功!");
			
			DBConnection.closeConnection( s, conn);
			
			return isSucsess;
		} 
		catch (SQLException e)
		{
		
			e.printStackTrace();
			
			DBConnection.closeConnection( s, conn);
			
			isSucsess ="no";
			
			return isSucsess;
		}
		
		
		
		
	}

	int count;

	public Vector<Book> search(String keywords)
	{
		
		Connection conn = DBConnection.getConnection();
		
		Vector<Book> empty = new Vector<Book>();
		Book emptybook = new Book(-1,"","",Float.valueOf(-1),"","","");
		empty.add(emptybook);
		
		
		try 
		{
		
			Statement s = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			String sql =null;
			
			if(!keywords.equals("'empty'"))
			{
				sql = "select * from booktable where bookname like'%"+keywords+"%' or price like'%"+keywords+"%' or author like'%"+keywords+"%' or category like'%"+keywords+"%'  or remark like'%"+keywords+"%' or bookinfo like'%"+keywords+"%'";
			}
			else
			{
				sql = "select * from booktable ";
			}
			
			ResultSet rs1 = s.executeQuery(sql);
			rs1.last();
			count = rs1.getRow();
			ResultSet rs = s.executeQuery(sql);
			
			if(rs.next())
			{	
				Book book = new Book(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),Float.valueOf(rs.getString(4)),rs.getString(5),rs.getString(6),rs.getString(7));
				getBooklist().add(book);
				try 
				{
					while(rs.next())
					{	
						Book book1 = new Book(Integer.parseInt(rs.getString(1)),rs.getString(2),rs.getString(3),Float.valueOf(rs.getString(4)),rs.getString(5),rs.getString(6),rs.getString(7));
						getBooklist().add(book1);
				    }
				} 
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				
				DBConnection.closeConnection(rs, s, conn);
				
				System.out.println("booklist已返回！");
				
				return booklist;
				
			}
			else
			{
				System.out.println("墨子都没有找到！");

				DBConnection.closeConnection(rs, s, conn);
				
				issucsess = false;
				return empty;
				
			}
			
		
			
		} 
		catch (SQLException e)
		{
			
			 e.printStackTrace();
			 
			 return empty;
			 
		}
		
		
		
	//	return booklist;
		
		
	}
	
	public String LoginCheck(String username,String password)
	{
		String isSucsess = "Sucsess";
		
		Connection conn = DBConnection.getConnection();
		try 
		{
			Statement s = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			
			String sql = "select password from userlist where username = '"+username+"'";
			
			ResultSet rs1 = s.executeQuery(sql);
			
			if(rs1.next())
			{	
				
				if(password.equals(rs1.getString(1)))
				{
					System.out.println("用户匹配成功！");
				}
				else
				{
					System.out.println("密码错误！");
					
					isSucsess = "wrongpassword";
				}
				
				DBConnection.closeConnection(rs1, s, conn);
			}
			else
			{
				System.out.println("用户不存在！");
				
				isSucsess = "userdoesnotexist";
			}
			
			
			DBConnection.closeConnection( s, conn);
		} catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return isSucsess;
		
	}
	
	public boolean isIssucsess() {
		return issucsess;
	}

	public void setIssucsess(boolean issucsess) {
		this.issucsess = issucsess;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}


	public static boolean add() {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector<Book> getBooklist() {
		return booklist;
	}

	public void setBooklist(Vector<Book> booklist) {
		this.booklist = booklist;
	}
}
