package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import data.BoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import service.BoardDAO;

@WebServlet("/Notice/Board.do")
public class BoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao=new BoardDAO();
		Map map = new HashMap();
		util.PagingUtil.setMapForPaging(map, dao, req);
		int totalRecordCount=Integer.parseInt(map.get("totalRecordCount").toString());
		int blockPage=Integer.parseInt(map.get("blockPage").toString());
		int pageSize=Integer.parseInt(map.get("pageSize").toString());
		int totalPage=Integer.parseInt(map.get("totalPage").toString());
		int nowPage=Integer.parseInt(map.get("nowPage").toString());	
	
		String pagingString=util.PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+"/Notice/Board.do?");
		
		
		List<BoardDTO> records= dao.selectList(map);
		//라]결과값이 있으면 리퀘스트 영역에 저장
		req.setAttribute("records", records);
		req.setAttribute("pagingString", pagingString);
		//마]결과값을 뿌려줄 뷰(JSP페이지) 선택후 포워딩 
		//뷰선택]
		RequestDispatcher dispatcher = req.getRequestDispatcher("/homepage/BoardList.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}
}
