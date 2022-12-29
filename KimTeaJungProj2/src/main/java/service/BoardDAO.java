package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import data.BoardDTO;
import jakarta.servlet.ServletContext;
import util.DaoService;

public class BoardDAO implements DaoService<BoardDTO>{
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	
	
	
	public BoardDAO(ServletContext context) {
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
	public List<BoardDTO> selectList(Map map) {
		List<BoardDTO> records = new Vector<>();
		//페이징 적용 전 쿼리
		//String sql="SELECT * FROM dataroom ORDER BY no DESC";
		//페이징 적용 쿼리(구간 쿼리)
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM (SELECT * FROM BOARD ORDER BY no DESC) T) WHERE R BETWEEN ? AND ? ";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setHitCount(rs.getString(4));
				dto.setHeartCount(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setEmail(rs.getString(7));
				records.add(dto);
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return records;
	}

	@Override
	public int getTotalRecordCount(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO selectOne(String... one) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String no) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
