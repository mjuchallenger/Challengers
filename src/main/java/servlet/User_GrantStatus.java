package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.Constants;
import dataAccessObject.DAO;

@WebServlet("/grantStatus")
public class User_GrantStatus extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	private DAO dao=new DAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); response.setContentType("text/html; charset=utf-8");
		dao.update(new String[] {request.getParameter("status"), request.getParameter("student-num")}, Constants.User_GrantStatus);
		
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('지위 변경이 완료되었습니다!'); location.href='AIndex.jsp';</script>"); 
		writer.close();
	}
}
