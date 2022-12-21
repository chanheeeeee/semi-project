package com.wdh.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.wdh.common.exception.LoginCheckException;
import com.wdh.member.vo.Member;

/**
 * Servlet Filter implementation class AdminCheckFilter
 */
@WebFilter("/admin/*")
public class AdminCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AdminCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpSession session=((HttpServletRequest)request).getSession();
		Member loginMember=(Member)session.getAttribute("loginMember");
		if(loginMember!=null&&loginMember.getMember_id().equals("admin")) {
			chain.doFilter(request, response);
		}else {
			throw new LoginCheckException("권한이 없는 접근입니다.");
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
