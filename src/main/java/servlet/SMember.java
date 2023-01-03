package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.DAO;
import printObject.PrintMember;

@WebServlet("/member")
public class SMember extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	private DAO dao=new DAO();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(dao.toString());
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
		new PrintMember(dao, request.getParameter("CHALLENGER_ID"), response.getWriter());
	}
}
