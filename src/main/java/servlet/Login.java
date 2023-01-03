package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.Constants;
import dataAccessObject.DAO;
import valueObject.ParentVO;
import valueObject.UserVO;

@WebServlet("/login")
public class Login extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	static int i =0;
	static int i1 =0;
	static int i2 =0;
	static int i3 =0;
	static int i4 =0;
	static int i5 =0;
	static int i6 =0;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
		DAO dao = new DAO();
		HttpSession session = request.getSession();
		if(session.isNew()) {
			sessionCreate(response, dao, session, request.getParameter("user_#"));
		} else {
			if(((String)request.getParameter("user_#")).equals((String) session.getAttribute("user_#"))) {
				System.out.println("이미 로그인 된: " + ++i2 +" : " +(String) session.getAttribute("user_#"));
				response.sendRedirect("list.jsp");
			} else {
				System.out.println("다시 로그인: " + ++i3+" : " +(String) session.getAttribute("user_#"));
				session.invalidate();
				session = request.getSession();
				sessionCreate(response, dao, session, request.getParameter("user_#"));
			}
		}
	}
	private void sessionCreate(HttpServletResponse response, DAO dao, HttpSession session, String login_id) throws IOException {
		try {
			if(dao.isExisted(new String[] {login_id}, Constants.LogedOn)) {
				session.setAttribute("isLogOn", true);
				session.setAttribute("user_#", login_id);
				for(ParentVO parentVO: dao.getList(new String[] {login_id}, UserVO.class, Constants.User_info)) {
					System.out.println("로그인 성공: " + ++i4+" : " +login_id);
					session.setAttribute("user_name", ((UserVO)parentVO).getName());
					session.setAttribute("user_major", ((UserVO)parentVO).getMajor());
					session.setAttribute("user_status", ((UserVO)parentVO).getStatus());
				}
				response.sendRedirect("list.jsp");
			} else {
				System.out.println("회원정보가 일치하지 않습니다: " + ++i5+" : " +login_id);
				session.invalidate();
				PrintWriter writer = response.getWriter();
				writer.println("<script>alert('회원정보가 일치하지 않습니다!'); location.href='index.html';</script>"); 
				writer.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
