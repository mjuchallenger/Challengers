package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PROFILE")
public class SProfile extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
    	if(request.getParameter("adminPage")!=null&& request.getParameter("adminPage").equals("관리자페이지")) {
    		response.sendRedirect("AIndex.jsp");
    	} else if(request.getParameter("logout")!=null && request.getParameter("logout").equals("Logout")) {
    		HttpSession session = request.getSession();
    		session.invalidate();
    		response.sendRedirect("index.html"); 
    	} else if(request.getParameter("myFeed")!=null&& request.getParameter("myFeed").equals("myFeed.jsp")) {
    		response.sendRedirect("myFeed.jsp");
    	}  else response.sendRedirect("profile.jsp");
    }
}
