package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import data.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.SingInDAO;
import util.HashPass;

@WebServlet("/Login/LoginProgress.do")
public class LoginProgressController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email= req.getParameter("email");
		HashPass hp = new HashPass();
		String password = null;
		try {
			password = hp.getPass(req.getParameter("pass"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SingInDAO dao= new SingInDAO(getServletContext());
		
		boolean check=dao.isMember(email,password);
		
		dao.close();
		if(check) {
			
			HttpSession session=req.getSession();
			session.setAttribute("USER-EMAIL", email);
			Cookie cookie=new Cookie("email", email);
			resp.addCookie(cookie);
			req.getRequestDispatcher("/homepage/HomePage.jsp").forward(req, resp);
		}else {
			req.setAttribute("message", "아이디나 비번 확인점..");
			req.getRequestDispatcher("/login/LoginPage.jsp").forward(req, resp);
		}
	}
}
