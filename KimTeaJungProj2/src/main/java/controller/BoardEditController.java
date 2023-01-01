package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/Notice/Edit.do")
public class BoardEditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		//1]파라미터(키값) 받기	
		
		//현재 페이지번호 받기
		String nowPage = req.getParameter("nowPage");
		//검색과 관련된 파라미터 받기
		String searchColumn =req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		*/
		//2]CRUD작업용 BBSDao생성
		String no = req.getParameter("no");
		BoardDAO dao = new BoardDAO(getServletContext());	
		//레코드 하나 가져오기
		BoardDTO dto= dao.selectOne(no);
		
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/homepage/board/BoardEdit.jsp").forward(req, resp);
	}
}
