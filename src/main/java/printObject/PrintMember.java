package printObject;

import java.io.PrintWriter;

import constants.Constants;
import dataAccessObject.DAO;
import valueObject.ChallengerVO;
import valueObject.ParentVO;
import valueObject.PersonalRateVO;

public class PrintMember {
	// constructor
	public PrintMember(DAO dao, String id, PrintWriter out) {this.print(dao, id, out);}
	// methods
	private void print(DAO dao, String id, PrintWriter out) {
		String thisChallengeName = "";
		for (ParentVO list : dao.getList(new String[] {id}, ChallengerVO.class, Constants.Challenger_getChallengerInfo))
			thisChallengeName = ((ChallengerVO) list).getName();
		
		out.print("<!DOCTYPE html>"
				+ "<html lang='en'>"
				+ "<head>"
				+ "<meta charset='UTF-8'>"
				+ "<meta http-equiv='X-UA-Compatible' content='IE=edge'>"
				+ "<meta name='viewport' content='width=device-width, initial-scale=1.0'>"
				+ "<title>챌린지 성공률</title>"
				+ "<link rel='stylesheet' href='admin/css/member.css' type='text/css'>"
				+ "</head>"
				+ "<body>");
		out.print("<h2>"+thisChallengeName+"</h2>");
		printSelectTag(dao, out, thisChallengeName);
		printTable(dao, out, id);
		out.print("</body></html>");
	}
	private void printSelectTag(DAO dao, PrintWriter out, String thisChallengeName) {
		out.print("<form><select name='CHALLENGER_ID' onchange='this.form.submit();'>");
		out.print("<option selected disabled hidden>"+thisChallengeName+"</option>");
		for(ParentVO parentVO: dao.getList(ChallengerVO.class, Constants.Challenger_getList)) out.print("<option value='"+((ChallengerVO)parentVO).getId()+"'>"+((ChallengerVO)parentVO).getName()+"</option>");
		out.print("</select></form>");
	}
	private void printTable(DAO dao, PrintWriter out, String id) {
		out.print("<table border='2'><th>학번</th><th>이름</th><th>학과</th><th>성공률</th>");
		for (ParentVO list : dao.getList(new String[] {id, id}, PersonalRateVO.class, Constants.Feed_PersonalSuccessRateTable)) {
			out.print("<tr>");
			out.print("<td>"+((PersonalRateVO) list).getUserNum()+"</td>");
			out.print("<td>"+((PersonalRateVO) list).getName()+"</td>");
			out.print("<td>"+((PersonalRateVO) list).getMajor()+"</td>");
			out.print("<td>"+((PersonalRateVO) list).getRate()+"</td>");
			out.print("</tr>");
		}
		out.print("</table>");
	}
}
