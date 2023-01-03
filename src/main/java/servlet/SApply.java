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

@WebServlet("/SApply")
public class SApply extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html; charset=utf-8");
		String[] params = {request.getParameter("name"), 
				request.getParameter("student-num"), 
				request.getParameter("major"), 
				request.getParameter("grade"), 
				request.getParameter("phone")};
		
		DAO dao = new DAO();
		dao.update(params, Constants.User_add);
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('저희 명지챌린저스 동아리에 지원해주셔서 감사힙니다! 차후 개별적인 연락을 드릴 예정이오니 참고해주시기 바라겠습니다!'); location.href='main.html';</script>"); 
		writer.close();
	}

}
