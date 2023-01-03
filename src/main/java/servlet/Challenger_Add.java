package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.Constants;
import dataAccessObject.DAO;

@WebServlet("/addChallenger")
public class Challenger_Add extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
//	 	String userNum = request.getParameter(""); ------------------------------------------- issue2: client페이지 완성되면 수정할 것
	 	String[] fields = {request.getParameter("challenger_name"), request.getParameter("startDate"), request.getParameter("endDate"), "60201701"};
	 	dao.update(fields, Constants.Challenger_add);
	 	response.sendRedirect("index.jsp");
	}
}
