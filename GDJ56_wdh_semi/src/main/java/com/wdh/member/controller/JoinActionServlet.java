package com.wdh.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.wdh.member.service.MemberService;
import com.wdh.member.vo.Member;

/**
 * Servlet implementation class JoinActionServlet
 */
@WebServlet( name="joinAction", urlPatterns = "/member/joinAction.do")
public class JoinActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 데이터 가져오기
		//member 테이블에 저장하는 기능
		
		//String 날짜 형식을 Date로 변환해주는 클래스
		//2022-12-02
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date formatBirth = null;
		try {
			formatBirth = sdf.parse(request.getParameter("birth"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String member_id = request.getParameter("member_id");
		String member_nickname = request.getParameter("member_nickname");
		String name = request.getParameter("name");
		String passsword = request.getParameter("password");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		int grade = Integer.parseInt(request.getParameter("grade"));
		Member m = Member.builder()
				.member_id(member_id)
				.member_nickname(member_nickname)
				.name(name)
				.password(passsword)
				.gender(gender.charAt(0))
				.birth(formatBirth)
				.email(email)
				.phone(phone)
				.address(address)
				.grade(grade)
				.build();
		
		int result = new MemberService().insertMember(m);

		
		Gson js = new Gson();
		js.toJson(result, response.getWriter());
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
