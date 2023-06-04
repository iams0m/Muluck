package com.multi.muluck.member;

import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class MemberService {
	//전화번호 인증 난수 생성
	public String sendRandomMessage(String tel) {
	    Naver_Sens_V2 message = new Naver_Sens_V2();
	    Random rand = new Random();
	    String numStr = "";
	    for (int i = 0; i < 6; i++) {
	        String ran = Integer.toString(rand.nextInt(10));
	        numStr += ran;
	    }
	    System.out.println("회원가입 문자 인증 => " + numStr);

	    message.send_msg(tel, numStr);

	    return numStr;
	}

	public static int memberTelCount(String member_tel) {
		MemberDAO dao = new MemberDAO();
		int result = dao.telCheck(member_tel);
		return result;
	}
}
