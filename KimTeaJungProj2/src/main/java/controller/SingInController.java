package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.swing.plaf.synth.SynthPasswordFieldUI;

import data.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.SingInDAO;
import util.HashPass;

@WebServlet("/Login/SingIn.do")
public class SingInController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("여기로 오는거");
		resp.sendRedirect(req.getServletContext().getContextPath()+"/login/SingIn.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email= req.getParameter("email");	
		String phoneNumber= req.getParameter("phone");
		String name= req.getParameter("name");
		HashPass hp=new HashPass();
		String password = null;
		try {
			password = hp.getPass(req.getParameter("password"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String gender= req.getParameter("gender");
		String inter= Arrays.toString(req.getParameterValues("inter"));
		String grade= req.getParameter("grade");
		String self= req.getParameter("self");
		
		SingInDAO dao= new SingInDAO();
		UserDTO dto= new UserDTO();
		dto.setEmail(email);
		dto.setPhone(phoneNumber);
		dto.setName(name);
		dto.setPwd(password);
		dto.setGender(gender);
		dto.setInter(inter);
		dto.setEducation(grade);
		dto.setSelf(self);
		int aff=dao.insert(dto);
		dao.close();
		if(aff==1) {
			req.setAttribute("message", "가입을 환영합니다");
		}
		resp.sendRedirect(req.getServletContext().getContextPath()+"/login/LoginPage.jsp");
	}
}
