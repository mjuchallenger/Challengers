package dataAccessObject;
import java.lang.reflect.Constructor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import constants.Constants;
import valueObject.ParentVO;

public class DAO {
	// working interface
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	// constructor
	public DAO() {
		try {
			Context ctx=new InitialContext();
			Context envContext=(Context) ctx.lookup(Constants.initContext);
			dataFactory=(DataSource) envContext.lookup(Constants.xmlContext);
		}catch(NamingException e){e.printStackTrace();}
	}
	// methods
	private void initConnection(String query) throws SQLException {con=dataFactory.getConnection(); pstmt=con.prepareStatement(query);}
	public ArrayList<String> getList(String query) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			initConnection(query);
			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) list.add(resultSet.getString("RESULT"));
			resultSet.close(); pstmt.close(); con.close();
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}
	public Vector<ParentVO> getList(Class<?> clazz, String query) {
		Vector<ParentVO> list=new Vector<ParentVO>();
		try {
			initConnection(query);
			ResultSet resultSet=pstmt.executeQuery();
			while (resultSet.next()) {
				Constructor<?> constructor = clazz.getConstructor();
				ParentVO parentVO = (ParentVO) constructor.newInstance();
				list.add(parentVO.set(resultSet));
			}
			resultSet.close(); pstmt.close(); con.close();
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}
	public Vector<ParentVO> getList(String[] fields, Class<?> clazz, String query) {
		Vector<ParentVO> list=new Vector<ParentVO>();
		try {
			initConnection(query);
			for(int i=0; i<fields.length; i++) pstmt.setString(i+1, fields[i]);
			ResultSet resultSet=pstmt.executeQuery();
			while (resultSet.next()) {
				Constructor<?> constructor = clazz.getConstructor();
				ParentVO parentVO = (ParentVO) constructor.newInstance();
				list.add(parentVO.set(resultSet));
			}
			resultSet.close(); pstmt.close(); con.close();
		} catch (Exception e) {e.printStackTrace();}
		return list;
	}
	public String get(String query) {
		String result = "";
		try {
			initConnection(query);
			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) result=resultSet.getString("RESULT");
			resultSet.close(); pstmt.close(); con.close();
		} catch (SQLException e) {e.printStackTrace();}
		return result;
	}
	public String get(String field, String query) {
		String result = "";
		try {
			initConnection(query);
			pstmt.setString(1, field);
			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) result=resultSet.getString("RESULT");
			resultSet.close(); pstmt.close(); con.close();
		} catch (SQLException e) {e.printStackTrace();}
		return result;
	}
	public void update(String[] fields, String query) { 
		try {
			initConnection(query);
			for(int i=0; i<fields.length; i++) pstmt.setString(i+1, fields[i]);
			pstmt.executeUpdate(); pstmt.close(); con.close();
		} catch (SQLException e) {e.printStackTrace();}
	}
	public boolean isExisted(String[] fields, String query) {
		boolean result=false;
		try {
			initConnection(query);
			for(int i=0; i<fields.length; i++) pstmt.setString(i+1, fields[i]);
			ResultSet resultSet = pstmt.executeQuery();
			resultSet.next(); result=Boolean.parseBoolean(resultSet.getString("RESULT"));
			pstmt.close(); con.close();
		} catch (SQLException e) {e.printStackTrace();}
		return result;
	}
	public boolean sendLog() {
		
		return false;
	}
}





