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

@WebServlet("/SChallenger_Modify")
public class SChallenger_Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html; charset=utf-8");
		
	 	String[] fields = {request.getParameter("startDate"), request.getParameter("endDate"), request.getParameter("challenge_id")};
	 	
	 	DAO dao = new DAO();
	 	dao.update(fields, Constants.Challenger_update);
	 	
	 	PrintWriter writer = response.getWriter();
		writer.println("<script>alert('챌린지 수정이 완료되었습니다!'); location.href='ChallengeUpdate.jsp';</script>"); 
		writer.close();
	}
}
