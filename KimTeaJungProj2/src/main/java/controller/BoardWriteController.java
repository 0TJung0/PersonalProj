package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/Notice/Write.do")
public class BoardWriteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/homepage/board/BoardWrite.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title= req.getParameter("title");
		String content= req.getParameter("content");
		HttpSession session=req.getSession();
		String email=(String) session.getAttribute("USER_EMAIL");
		BoardDAO dao = new BoardDAO(getServletContext());
		BoardDTO dto = new BoardDTO();
		
		dto.setContent(content);
		dto.setEmail(email);
		dto.setTitle(title);
		int insertFlag= dao.insert(dto);
		dao.close();
		PrintWriter out = resp.getWriter();
		System.out.println("insertFlag:"+insertFlag);
		req.setAttribute("no", insertFlag);
		req.setAttribute("nowPage", 1);
		req.getRequestDispatcher("/homepage/board/BoardWriteSucces.jsp").forward(req, resp);
	   
	}
}
