package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.ExamMemberDto;
import dto.ExamMemberListDto;

public class ExamMemberDao {
	Connection getConnection() throws Exception {
	      String driver = "oracle.jdbc.driver.OracleDriver";
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String dbId = "user0112";
	      String dbPw = "user1234";
	      
	      Class.forName(driver);
	      Connection conn = DriverManager.getConnection(url, dbId, dbPw);

	      return conn;
	   }
	
	public boolean loginCheck(String id, String pw) throws Exception {
		Connection conn = getConnection();
		
		String sql = "SELECT COUNT(*) "
				+ "FROM member "
				+ "WHERE id=? AND pw=? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		pstmt.executeQuery();
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		conn.close();
		   
		return result == 1;
			
		}
	
		
	
	public void registMember(String id, String pw, String name) throws Exception {
		Connection conn = getConnection();
		
		String sql = "INSERT INTO member(id, pw, name, point) "
				+ "VALUES(?, ?, ?, 1000)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
	public ArrayList<ExamMemberDto> getMemberInfo(String id) throws Exception {
		ArrayList<ExamMemberDto> listRet = new ArrayList<ExamMemberDto>();
		
		String sql = "SELECT name, point "
				+ "FROM member "
				+ "WHERE id=? ";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String name = rs.getString("name");
			int point = rs.getInt("point");
			ExamMemberDto memberInfo = new ExamMemberDto(name, point);
			listRet.add(memberInfo);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	
	}
	public ArrayList<ExamMemberListDto> getMemberList() throws Exception {
		ArrayList<ExamMemberListDto> listRet = new ArrayList<ExamMemberListDto>();
		
		String sql="SELECT id, pw, name, point FROM member";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("pw");
			String name = rs.getString("name");
			int point = rs.getInt("point");
			ExamMemberListDto MemberList = new ExamMemberListDto(id, pw, name, point);
			listRet.add(MemberList);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
	}
	
	public void deleteMember(String id) throws Exception {
        String sql = "DELETE FROM member WHERE id=? ";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }
    }
	public void delete(String id) throws Exception {
		Connection conn = getConnection();
		
		String sql = "DELETE FROM member WHERE id=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	}
}
