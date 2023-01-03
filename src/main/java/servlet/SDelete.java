package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.Constants;
import dataAccessObject.DAO;

/**
 * Servlet implementation class SDelete
 */
@WebServlet("/DELETE")
public class SDelete extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
		
		DAO dao = new DAO();
		
		System.out.println(request.getParameter("CHALLENGE_ID"));
		System.out.println(request.getParameter("USER_#"));
		System.out.println(request.getParameter("FILENAME"));
		System.out.println(request.getParameter("UPLOADTIME"));
		System.out.println(Constants.Feed_Delete);
		dao.update(new String[] {request.getParameter("CHALLENGE_ID"), request.getParameter("USER_#")
				, request.getParameter("UPLOADTIME")}
				, Constants.Feed_Delete);
			response.sendRedirect(request.getParameter("DESTINATION"));
	}
}
