package controller;

import java.io.IOException;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/Notice/View.do")
public class BoardViewController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO(getServletContext());
		
		String no = req.getParameter("no");
		//String searchColumn =req.getParameter("searchColumn");
		//String searchWord = req.getParameter("searchWord");
		//String searchString="";//검색용 쿼리 스트링	
		String nowPage = req.getParameter("nowPage");
		String referer=req.getHeader("referer");
		
		String prev = referer.substring(referer.lastIndexOf("/")+1);
		//레코드 하나 가져오기
		BoardDTO dto= dao.selectOne(no,prev);	
		
		//이전글/다음글 조회
		Map<String,BoardDTO> map = dao.prevNext(no);
		System.out.println(no);
		
		dto= dao.selectOne(no);
		dao.update(dto);
		dao.close();
		dto.setContent(dto.getContent().replace("\r\n","<br/>"));
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("map", map);
		req.setAttribute("record", dto);
		req.getRequestDispatcher("/homepage/board/BoardView.jsp").forward(req, resp);
	}
	
}
