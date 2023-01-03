package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import constants.Constants;
import dataAccessObject.DAO;

@WebServlet("/add2")
public class SAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String savePath = request.getSession().getServletContext().getRealPath("files");
		int sizeLimit = 1024 * 1024 * 1000;

		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		HttpSession session = request.getSession();
		
	    String CHALLENGER_ID = multi.getParameter("CHALLENGER_ID");
		String USER_NUM = (String)session.getAttribute("user_#");
		String TEXT = multi.getParameter("text");
		String filesystemName = multi.getFilesystemName("filename"); // 서버에 업로드된 파일명을 반환
		
		DAO dao = new DAO();
		dao.update(new String[] {CHALLENGER_ID, USER_NUM, TEXT, filesystemName}, Constants.Feed_update);
		response.sendRedirect("back.jsp");
	}
}
