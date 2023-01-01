package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.UserDTO;
import jakarta.servlet.ServletContext;
import util.DaoService;

public class SingInDAO implements DaoService<UserDTO>{
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public SingInDAO(ServletContext context){
		try {
			//커넥션 풀 사용.즉 커넥션 풀에서 커넥션 객체 가져오기.
			//Context ctx= new InitialContext();
			//DataSource source=(DataSource)ctx.lookup("java:comp/env/SPRING");
			DataSource source= (DataSource)context.getAttribute("DataSource");
			conn= source.getConnection();
			System.out.println(conn);
		}
		catch(SQLException e) {e.printStackTrace();}
	}
	@Override
	public void close() {
		try {
			if(rs !=null) rs.close();//메모리 해제
			if(psmt !=null) psmt.close();//메모리 해제
			if(conn !=null) conn.close();//커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
		}
		catch(SQLException e) {e.printStackTrace();}	
	}

	@Override
	public List<UserDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalRecordCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(UserDTO dto) {
		int affected=0;
		String sql="INSERT INTO member VALUES(?,?,?,?,?,?,?,?,SYSDATE)";
		try {
			//두번째 인자는 키값인 컬럼의 배열명.혹은 인덱스로 new int[]{1}
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getPwd());
			psmt.setString(5, dto.getGender());
			psmt.setString(6, dto.getInter());
			psmt.setString(7, dto.getEducation());
			psmt.setString(8, dto.getSelf());
			affected=psmt.executeUpdate();
			//입력된 행의 키값 가져오기			
			
			conn.close();
		
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public UserDTO selectOne(String... one) {
		String sql="SELECT * FROM member WHERE USER_EMAIL=?";
		UserDTO dto=null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, one[0]);
			
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto = new UserDTO();
				dto.setEmail(rs.getString(1));	
				dto.setPhone(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(5));
				dto.setInter(rs.getString(6));
				dto.setEducation(rs.getString(7));
				dto.setSelf(rs.getString(8));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int update(UserDTO dto) {
		int affected=0;
		String sql="UPDATE member SET USER_PHONE=?,USER_NAME=?,USER_GENDER=?,USER_INTER=?,USER_EDUCATION=?,USER_SELF=? WHERE USER_EMAIL=? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPhone());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getGender());
			psmt.setString(4, dto.getInter());
			psmt.setString(5, dto.getEducation());
			psmt.setString(6, dto.getSelf());
			psmt.setString(7, dto.getEmail());
			affected=psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return affected;
	}

	@Override
	public int delete(String no) {
		// TODO Auto-generated method stub
		return 0;
	}
	public boolean isMember(String username,String password) {
		String sql="SELECT COUNT(*) FROM member WHERE USER_EMAIL=? AND USER_PASSWORD=?";
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, username);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) return false;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
