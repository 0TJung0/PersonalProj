package util;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//모든 JSP요청에 대해서 처리시는 *.jsp(/는 넣으면 안됨)
//단,특정 jsp요청은 컨텍스트 루트를 제외한 /로 시작
@WebFilter("/homepage/*")
public class AuthenticationFilter  extends HttpFilter implements Filter {
	
	public AuthenticationFilter() {
		System.out.println("인증필터 생성자");
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("인증필터-사전작업(로그인 여부 판단)");
		//여기서 로그인 확인
		HttpServletRequest req=(HttpServletRequest)request;
		Object checkLogin=req.getSession().getAttribute("USER-EMAIL");
		if(checkLogin ==null) {
			/*
			HttpServletResponse resp =(HttpServletResponse)response;
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out= resp.getWriter();
			out.println("<script>");
			out.println("alert('Please Use After Login...');");
			out.println("location.replace('"+req.getContextPath()+"/session06/Login.jsp');");
			out.println("</script>");*/
			req.setAttribute("message","로그인후 이용하세요");
			req.getRequestDispatcher("/login/LoginPage.jsp").forward(request, response);
			return;
		}
		
		chain.doFilter(request, response);
		
	}
}
