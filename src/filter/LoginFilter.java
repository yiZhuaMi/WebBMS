package filter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
      

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) throws IOException, ServletException 
    {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

       
        String path = servletRequest.getRequestURI();
        
      
        String username = (String) session.getAttribute("username");
        System.out.println("(filter)用户:'"+username+"'	请求访问："+path);
      
        if(path.indexOf("login.jsp") > -1) 
        {
        	
            chain.doFilter(servletRequest, servletResponse);
            return;
        }

        if (username == null || "".equals(username)) 
        {
        	System.out.println("跳转至登录页面。。。");
            servletResponse.sendRedirect("login.jsp");
        } 
        else 
        {
            chain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() 
    {
     

    }

}