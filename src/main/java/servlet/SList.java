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
import valueObject.ChallengerVO;
import valueObject.ParentVO;

@WebServlet("/list")
public class SList extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	private DAO dao=new DAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html>"
				+ "<html lang='en'>"
				+ "<head>"
				+ "  <meta charset='UTF-8'>"
				+ "  <meta http-equiv='X-UA-Compatible' content='IE=edge'>"
				+ "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
				+ "  <title>챌린지 리스트</title>"
				+ "  <link rel='stylesheet' href='admin/css/list.css'>"
				+ "  <script src='https://kit.fontawesome.com/a4d2993e00.js' crossorigin='anonymous'>"
				+ "  </script>"
				+ "</head>"
				+ "<body>"
				+ "<h2>챌린지 리스트</h2>");
		out.print("<table>"
				+ "<thead></thead>"
				+ "<tbody>");
		for(ParentVO parentVO: dao.getList(ChallengerVO.class, Constants.Challenger_getList)) {
			out.print("<tr onclick=\"location.href=''\">");
			out.print("<td class='td1'>"+((ChallengerVO)parentVO).getName()+" :: "+ ((ChallengerVO)parentVO).getStartDate() +" ~ "+ ((ChallengerVO)parentVO).getEndDate()+"</td>");
			out.print("<td class='td2'><i class='fas fa-arrow-right'></i></td>");
			out.print("</tr>");
		}
		out.print("</tbody></table>");
		out.print("</body>"
				+ "</html>");
		out.close();
	}
}
