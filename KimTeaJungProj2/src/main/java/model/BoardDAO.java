package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.BoardDTO;
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
		int totalCount=0;
		try {
			psmt = conn.prepareStatement("SELECT COUNT(*) FROM BOARD");
			rs=psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} 
		catch (SQLException e) {e.printStackTrace();}
		return totalCount;
	}

	@Override
	public int insert(BoardDTO dto) {
		int affected=0;
		String sql="INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL,?,?,DEFAULT,DEFAULT,SYSDATE,?)";
		try {
			//두번째 인자는 키값인 컬럼의 배열명.혹은 인덱스로 new int[]{1}
			
			psmt = conn.prepareStatement(sql,new String[] {"NO"});
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getEmail());
			psmt.executeUpdate();
			//입력된 행의 키값 가져오기		
			rs=psmt.getGeneratedKeys();
			rs.next();
			//System.out.println("rs.getInt(1):"+rs.getInt(1));
			affected = rs.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}/////////////////


	@Override
	public BoardDTO selectOne(String... one) {
		BoardDTO dto=null;
		try {
			String sql="SELECT * FROM BOARD WHERE NO=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, one[0]);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNo(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setHitCount(rs.getString(4));
				dto.setHeartCount(rs.getString(5));
				dto.setPostDate(rs.getDate(6));
				dto.setEmail(rs.getString(7));
				
			}
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		return dto;
	}

	@Override
	public int update(BoardDTO dto) {
		int aff=0;
		String sql="UPDATE BOARD SET HITCOUNT=HITCOUNT+1 WHERE USER_EMAIL=? AND NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getNo());
			aff=psmt.executeUpdate();
		}
	catch (SQLException e) {e.printStackTrace();}
	return aff;
	}

	@Override
	public int delete(String no) {
		int aff=0;
		String sql="DELETE FROM BOARD WHERE NO=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			aff=psmt.executeUpdate();
		}
	catch (SQLException e) {e.printStackTrace();}
	return aff;
	}

	//이전글/다음글 조회
		public Map<String, BoardDTO> prevNext(String currentNo){
			Map<String, BoardDTO> map = new HashMap<>();
			try {
				//이전글 얻기]
				String sql="SELECT NO,TITLE FROM BOARD WHERE NO=(SELECT Min(NO) FROM BOARD WHERE NO > ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, currentNo);
				rs = psmt.executeQuery();
				if(rs.next()) {
					map.put("PREV", new BoardDTO(rs.getString(1), null, rs.getString(2), null, null, null, null));
				}
				
				//다음글 얻기]
				sql="SELECT NO,TITLE FROM BOARD WHERE NO=(SELECT MAX(NO) FROM BOARD WHERE NO < ?)";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, currentNo);
				rs = psmt.executeQuery();
				if(rs.next()) {
					map.put("NEXT", new BoardDTO(rs.getString(1), null, rs.getString(2), null, null, null, null));
				}
			}
			catch(SQLException e) {e.printStackTrace();}
			return map;
		}////////////////////
}
