package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.SingInDAO;
import model.UserDTO;

@WebServlet("/MyPage/MyPageHome.do")
public class MyPageHomeController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDTO dto=new UserDTO();
		SingInDAO dao = new SingInDAO(getServletContext());
		System.out.println((String)req.getSession().getAttribute("USER_EMAIL"));
		dto=dao.selectOne((String)req.getSession().getAttribute("USER_EMAIL"));
		dao.close();
		req.setAttribute("user", dto);
		req.getRequestDispatcher("/homepage/MyPage.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String phoneNumber= req.getParameter("phone");
		String name= req.getParameter("name");
		String gender= req.getParameter("gender");
		String inter= Arrays.toString(req.getParameterValues("inter"));
		String grade= req.getParameter("grade");
		String self= req.getParameter("self");
		
		SingInDAO dao= new SingInDAO(getServletContext());
		UserDTO dto= new UserDTO();
		String email=(String)req.getSession().getAttribute("USER_EMAIL");
		dto.setEmail(email);
		dto.setPhone(phoneNumber);
		dto.setName(name);
		dto.setGender(gender);
		dto.setInter(inter);
		dto.setEducation(grade);
		dto.setSelf(self);
		int aff=dao.update(dto);
		dao.close();
		PrintWriter out= resp.getWriter();
		out.println("<script>");
		out.println("location.href='"+req.getContextPath()+"/MyPage/MyPageHome.do'");
		out.println("</script>");
	}
}
