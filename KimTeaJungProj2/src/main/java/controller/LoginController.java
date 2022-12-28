package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login/LoginPage.do")
public class LoginController extends HttpServlet {
    @Override   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Cookie[] getCookie = request.getCookies();
    	if(getCookie != null){ // 만약 쿠키가 없으면 쿠키 생성
            for(int i=0; i<getCookie.length; i++){
                if(getCookie[i].equals("email")) {
                	request.setAttribute("email", getCookie[i].getValue());
                }
            }
        }
    	response.sendRedirect(request.getServletContext().getContextPath()+"/login/LoginPage.jsp");
	}

}
