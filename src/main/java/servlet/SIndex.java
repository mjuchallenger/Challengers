package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.Constants;
import dataAccessObject.DAO;
import printObject.PrintIndex;

@WebServlet("/index")
public class SIndex extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	private DAO dao=new DAO();
	// methods
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(dao.toString());
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("isLogOn")!=null) {
			if (!(boolean)session.getAttribute("isLogOn")) response.sendRedirect("index.html");
			if(!(((String)session.getAttribute("user_status")).equals("ADMIN"))) response.sendRedirect("index.jsp");
		} else response.sendRedirect("index.html");
	 	if (request.getParameter("command")!=null && request.getParameter("command").equals("delMember"))
	 		dao.update(new String[] {request.getParameter("userNum")}, Constants.User_delete);
	 	new PrintIndex(dao, response.getWriter());
	}
	// initialize
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{this.doHandle(request, response);}catch(IOException e){e.printStackTrace();}}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{this.doHandle(request, response);}catch(IOException e){e.printStackTrace();}}
}
