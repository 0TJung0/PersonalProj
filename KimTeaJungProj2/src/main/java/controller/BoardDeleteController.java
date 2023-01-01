package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.BoardDAO;

@WebServlet("/Notice/Delete.do")
public class BoardDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no=req.getParameter("no");
		BoardDAO dao = new BoardDAO(getServletContext());
		
		int aff=dao.delete(no);
		
		dao.close();
		req.getRequestDispatcher("Board.do").forward(req, resp);
	}
}
