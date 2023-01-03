package constants;

public class Constants {
	public final static String initContext = "java:/comp/env";
	public final static String xmlContext = "jdbc/oracle";
	public final static String User_add ="insert into Users1(USER_NAME, User_#, Major, GRADE, PHONENUM) values(?,?,?,?,?)";
	public final static String User_getList ="SELECT USER_#, USER_NAME, MAJOR, PHONENUM, JOINDATE, STATUS FROM Users1 WHERE NOT STATUS='PERMIT' ORDER BY STATUS, USER_NAME";
	public final static String User_GrantStatus ="UPDATE Users1 SET STATUS=? WHERE USER_#=?";
	public final static String User_delete ="DELETE FROM Users1 WHERE USER_#=?";
	public final static String User_num ="SELECT COUNT(USER_#) AS RESULT FROM USERS1 WHERE NOT STATUS = 'PERMIT'";
	public final static String User_getWaitingList ="SELECT USER_#, USER_NAME, MAJOR, PHONENUM, JOINDATE, STATUS FROM Users1 WHERE STATUS = 'PERMIT' ORDER BY JoinDate";
	public final static String User_info = "SELECT USER_#, USER_NAME, MAJOR, PHONENUM, JOINDATE, STATUS FROM USERS1 WHERE User_#=?";
	public final static String User_Rate = "select Round(count(DISTINCT TO_CHAR(UPLOADTIME, 'YYYY:MM:DD'))/(ENDDATE-STARTDATE) *100, 2) as RESULT from feed1, challenger1 "
			+ "			WHERE feed1.challenger_id = challenger1.challenger_id "
			+ "			AND feed1.challenger_id in (SELECT Challenger1.challenger_id FROM Challenger1 WHERE sysdate <= ENDDATE AND SYSDATE >= STARTDATE) "
			+ "			AND feed1.User_#=? "
			+ "		group by feed1.challenger_id, STARTDATE, ENDDATE";

	public final static String Challenger_add="INSERT INTO CHALLENGER1(CHALLENGER_NAME, STARTDATE, ENDDATE, USER_#) VALUES (?,?,?,?)";
	public final static String Challenger_update = "UPDATE CHALLENGER1 SET STARTDATE=?, ENDDATE=? WHERE CHALLENGER_ID=?";
	public final static String Challenger_getList = "SELECT CHALLENGER_ID, CHALLENGER_NAME, to_char(STARTDATE, 'MM/DD') "
			+ "as STARTDATE, to_char(ENDDATE, 'MM/DD') as ENDDATE, "
			+ "UPDATETIME, USER_# FROM Challenger1 ORDER BY ENDDATE DESC";
	public final static String Challenger_num ="SELECT COUNT(CHALLENGER_NAME) AS RESULT FROM CHALLENGER1";

	public final static String Challenger_OverallSuccessRate="select Round(100*(count(challenger_id)/14) /(select count(*) "
			+ "from users1 where not status='PERMIT'), 2) as RESULT from feed1 "
			+ "where challenger_id in(select challenger_id from Challenger1 "
			+ "where sysdate <= ENDDATE AND SYSDATE >= STARTDATE) group by CHALLENGER_ID";
	public final static String Challenger_thisWeekID = "SELECT (challenger_id) as RESULT FROM Challenger1 WHERE sysdate <= ENDDATE AND SYSDATE >= STARTDATE GROUP BY CHALLENGER_ID";
	public final static String Challenger_getChallengerInfo = "SELECT CHALLENGER_ID, CHALLENGER_NAME, to_char(STARTDATE, 'YYYY/MM/DD') as STARTDATE, to_char(ENDDATE, 'YYYY/MM/DD') as ENDDATE, UPDATETIME, USER_# FROM Challenger1 WHERE CHALLENGER_ID=?";
	public final static String Challenger_getAdd = "SELECT DECODE(Count(*), 1, 'true', 'false') AS RESULT FROM Challenger1 WHERE CHALLENGER_ID=? AND SYSDATE <= ENDDATE AND SYSDATE >= STARTDATE GROUP BY CHALLENGER_ID";

	public final static String Feed_PersonalSuccessRateTable="select users1.user_#, USER_NAME, MAJOR, Round(count(DISTINCT TO_CHAR(UPLOADTIME, 'YYYY:MM:DD'))/(ENDDATE-STARTDATE) *100, 2) as RATE from users1, feed1, challenger1 "
			+ "	WHERE users1.user_# = feed1.user_# AND feed1.challenger_id = challenger1.challenger_id AND feed1.challenger_id=? group by users1.user_#, USER_NAME, MAJOR, ENDDATE, STARTDATE "
			+ "	UNION select users1.user_#, USER_NAME, MAJOR, Round(count(feed1.challenger_id)/14 *100, 2) as RATE from users1 LEFT OUTER JOIN feed1 ON users1.user_# = feed1.user_# and feed1.challenger_id=? "
			+ "	WHERE NOT users1.status = 'PERMIT' AND feed1.user_# IS NULL group by users1.user_#, USER_NAME, MAJOR ORDER BY RATE DESC, USER_NAME";
	public final static String Feed_getList = "SELECT CHALLENGER_ID, USER_#, TEXT, FILENAME, to_char(UPLOADTIME, 'YYYY/mm/dd HH24:MI:SS') FROM FEED1 WHERE CHALLENGER_ID=? ORDER BY UPLOADTIME DESC";
	public final static String Feed_checkRedundancy = "SELECT DECODE(Count(*), 1, 'true', 'false') AS RESULT FROM Feed1 WHERE CHALLENGER_ID=? AND USER_#=? AND TO_CHAR(UPLOADTIME, 'YYYY:MM:DD')= TO_CHAR(SYSDATE, 'YYYY:MM:DD')";
	public final static String Feed_update = "insert into Feed1(CHALLENGER_ID, USER_#, TEXT, FILENAME) values (?, ?, ?, ?)";
	public final static String Feed_MyFeedList = "SELECT CHALLENGER_ID, USER_#, TEXT, FILENAME, to_char(UPLOADTIME, 'YYYY/mm/dd HH24:MI:SS') FROM FEED1 WHERE USER_# = ? ORDER BY UPLOADTIME DESC";
	public final static String Feed_Delete = "DELETE FROM FEED1 WHERE CHALLENGER_ID=? AND USER_#=? AND UPLOADTIME = TO_DATE(?, 'YYYY/MM/DD/ HH24:MI:SS')";

	public final static String LogedOn = "SELECT DECODE(Count(*), 1, 'true', 'false') AS RESULT FROM USERS1 WHERE User_#=? AND NOT STATUS = 'PERMIT'";
	public final static String inFeedSt ="ADMIN";
}













