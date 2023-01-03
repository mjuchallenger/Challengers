package printObject;

import java.io.PrintWriter;

import constants.Constants;
import dataAccessObject.DAO;
import valueObject.ParentVO;
import valueObject.UserVO;

public class PrintIndex {
	// constructor
	public PrintIndex(DAO dao, PrintWriter out) {this.print(dao, out);}
	// methods
	private void print(DAO dao, PrintWriter out) {
		out.print("<!DOCTYPE html>"
				+ "<html lang='en'>"
				+ "<head>"
				+ "  <meta charset='UTF-8'>"
				+ "  <meta http-equiv='X-UA-Compatible' content='IE=edge'>"
				+ "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
				+ "  <title>관리자 페이지</title>"
				+ "  <link rel='stylesheet' href='admin/css/index.css'>"
				+ "  <link rel='stylesheet'"
				+ "    href='https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css'>"
				+ "  <script src='https://kit.fontawesome.com/a4d2993e00.js' crossorigin='anonymous'></script>"
				+ "  <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.15.4/css/all.css'"
				+ "    integrity='sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm' crossorigin='anonymous'>"
				+ ""
				+ "<script>"
				+ "function confir(form, object, name, status) {"
				+ "        var ret = confirm(name+'('+status+')의 지위를 '+object.options[object.selectedIndex].value+'(으)로 변경하시겠습니까?');"
				+ "        if(ret == true) {"
				+ "            form.submit();"
				+ "        }"
				+ "        else {"
				+ "				window.location.reload();"
				+ "			}"
				+ "    }"
				+ "</script>"
				+ ""
				+ "</head>"
				+ "<body>"
				+ "  <div class='container'>");
    	//  <!-- 네비게이션 바 메뉴-->
    	out.print(" <div class='navbar'>"
    			+ "      <ul>"
    			+ "        <li>"
    			+ "          <a href='index'>"
    			+ "            <img src='img/Challengers Logo -2.png' class='Logo'>"
    			+ "            <span class='title'>"
    			+ "              <h2>챌린저스</h2>"
    			+ "          </a>"
    			+ "          </span>"
    			+ "        </li>"
    			+ "        <li>"
    			+ "          <a href='member?CHALLENGER_ID="+dao.get(Constants.Challenger_thisWeekID)+"' >"
    			+ "            <span class='icon'><i class='fa fa-users' aria-hidden='true'></i></span>"
    			+ "            <span class='title'>챌린지 성공률</span>"
    			+ "          </a>"
    			+ "        </li>"
    			+ "        <li>"
    			+ "          <a href='ChallengeUpdate.jsp'>"
    			+ "            <span class='icon'><i class='fa fa-plus' aria-hidden='true'></i></span>"
    			+ "            <span class='title'>챌린지 추가 및 수정</span>"
    			+ "          </a>"
    			+ "        </li>"
    			+ "        <li>"
    			+ "          <a href='list'>"
    			+ "            <span class='icon'><i class='fa fa-list' aria-hidden='true'></i></span>"
    			+ "            <span class='title'>챌린지 리스트</span>"
    			+ "          </a>"
    			+ "        </li>"
    			+ "        <li>"
    			+ "          <a href='admin/html/adminadd.html'>"
    			+ "            <span class='icon'><i class='fa fa-lock' aria-hidden='true'></i></span>"
    			+ "            <span class='title'>관리자 추가</span>"
    			+ "          </a>"
    			+ "        </li>"
    			+ "      </ul>"
    			+ "    </div>");
    	// <!-- 메인 페이지 -->
    	out.print("<div class='main'>"
    			+ "      <div class='topbar'>"
    			+ "        <div class='toggle' onclick='toggleMenu();'></div>"
    			+ "        <div class='search'>"
    			+ "          <label>"
    			+ "            <input type='text' placeholder='search here'>"
    			+ "            <i class='fa fa-search' aria-hidden='true'></i>"
    			+ "          </label>"
    			+ "        </div>");
    	// <!-- 프로필  -->
    	out.print("<div class='user'>"
    			+ "          <img src='admin/img/Avatar.png'>"
    			+ "        </div>"
    			+ "      </div>");
    	// <!-- 상단 맴버 (20) -->
     	out.print("<div class='cardBox'>"
     			+ "        <div class='card'>"
     			+ "          <div>");
    	out.print("<div class='numbers'>"+dao.get(Constants.User_num)+"</div>");
    	out.print("<div class='cardName'>맴버</div>"
    			+ "           </div>"
    			+ "          <div class='iconBox'>"
    			+ "            <i class='fa fa-users' aria-hidden='true'></i>"
    			+ "          </div>"
    			+ "        </div>");
    	// <!-- 상단 챌린지 횟수 (8)-->
    	out.print("<div class='card'>"
    			+ "          <div>");
    	out.print("<div class='numbers'>"+dao.get(Constants.Challenger_num)+"</div>");
    	out.print("<div class='cardName'>챌린지 횟수</div>"
    			+ "          </div>"
    			+ "          <div class='iconBox'>"
    			+ "            <i class='fa fa-eye' aria-hidden='true'></i>"
    			+ "          </div>"
    			+ "        </div>");
    	// <!-- 상단 성공률 (70)-->
    	out.print("<div class='card'>"
    			+ "          <div>"
    			+ "            <div class='numbers'>"+dao.get(Constants.Challenger_OverallSuccessRate)+"</div>"
    			+ "            <div class='cardName'>전체 성공률</div>"
    			+ "          </div>"
    			+ "          <div class='iconBox'>"
    			+ "            <i class='fa fa-percent' aria-hidden='true'></i>"
    			+ "          </div>"
    			+ "        </div>"
    			+ "      </div>");
    	// <!--맴버 명단 -->
    	out.print("<div class='details'>"
    			+ "        <div class='recentOrders'>"
    			+ "          <div class='cardHeader'>"
    			+ "            <h2>맴버명단</h2>"
    			+ "            <a href='admin/html/member.html' class='btn'>더보기..</a>"
    			+ "          </div>");
    	this.printListTable(dao, out, Constants.User_getList);
    	// <!--가입 대기 명단-->
    	out.print("<div class='details'>"
    			+ "					<div class='recentOrders'>"
    			+ "						<div class='cardHeader'>"
    			+ "							<h2>가입 대기 명단</h2>"
    			+ "						</div>");
    	this.printListTable(dao, out, Constants.User_getWaitingList);
    	out.print("</div>");
    	// <!--추후 추가-->
    	out.print("<div class='chart'></div>");
    	// 
    	out.print("</div>"
    			+ "    </div>"
    			+ "  </div>"
    			+ "  <script>"
    			+ "    function toggleMenu() {"
    			+ "      let toggle = document.querySelector('.toggle');"
    			+ "      let navbar = document.querySelector('.navbar');"
    			+ "      let main = document.querySelector('.main');"
    			+ "      toggle.classList.toggle('active');"
    			+ "      navbar.classList.toggle('active');"
    			+ "      main.classList.toggle('active');"
    			+ "    }"
    			+ "  </script>"
    			+ "</body>"
    			+ "</html>");
	}
	private void printListTable(DAO dao, PrintWriter out, String query) {
		out.print("<table><thead>"
				+ "<tr><td>이름</td><td>전공</td><td>학번</td><td>전화번호</td><td>가입일</td><td>지위</td><td>삭제</td></tr>"
				+ "</thead>"
				+ "<tbody>");
		for(ParentVO list : dao.getList(UserVO.class, query)) fillRecord(out, (UserVO) list);
		out.print("</tbody></table></div>");
	}
	private void fillRecord(PrintWriter out, UserVO userVO) {
		out.print("<tr>"
				+ "<td>"+userVO.getName()+"</td><td>"+userVO.getMajor()+"</td>"
				+ "<td>"+userVO.getUserNum()+"</td><td>"+userVO.getPhoneNum()+"</td>"
				+ "<td>"+userVO.getJoinDate()+"</td>");
		out.print("<td>"
				+ "<form method='post' action='grantStatus'>"
				+ "<select name='status' onchange=\"confir(this.form, this, '"+userVO.getName()+"', '"+userVO.getStatus()+"')\">"
				+ "<option selected disabled hidden>"+userVO.getStatus()+"</option>"
				+ "<option class='selectOp' value='ADMIN'>ADMIN</option><option class='selectOp' value='CLIENT'>CLIENT</option>"
				+ "</select>"
				+ "<input type='hidden' name='student-num' value='"+userVO.getUserNum()+"'>"
				+ "</form>"
				+ "</td>");
		out.print("<td><a href='/ChallengerApp/index?command=delMember&userNum="+userVO.getUserNum()+"'>삭제 </a></td>"
				+ "</tr>");
	}
}
