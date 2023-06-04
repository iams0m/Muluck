package com.multi.muluck.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	//회원가입
	public int join(MemberVO bag) {
		int result = my.insert("member.create", bag);
		return result;
	}

/*
	public void delete(String id) {
		my.delete("member.del", id);
	}
	
	public void update(MemberVO bag) {
		int result = my.update("member.up", bag);
		System.out.println(result);
	}
	
	public MemberVO one(String id) {
		//타입 MemberVo  //one은 selectOne
		MemberVO vo = my.selectOne("member.one", id);
		System.out.println(vo);
		return vo;
	}
	
	public List<MemberVO> list() {
		//row하나당 어떤 vo에 넣을지만 지정하면 my.selectList()를 호출한 경우에는 
		//myBatis가 list vo가 잔뜩 들어간 LIst로 만들어준다.
		//타입 List<MemberVO>  //list는 selectList
		List<MemberVO> list = my.selectList("member.all");
		System.out.println(list.size());
		return list;
	}
*/

	//이메일 중복체크
	public int emailCheck(String member_email) {
		int result = my.selectOne("member.emailCheck", member_email);
		return result;
	}
	
	//아이디 중복체크
	public int idCheck(String member_id) {
		int result = my.selectOne("member.idCheck", member_id);
		return result;
	}
	
	//닉네임 중복체크
	public int nicknameCheck(String member_nickname) {
		int result = my.selectOne("member.nicknameCheck", member_nickname);
		return result;
	}
	
	//로그인
	public MemberVO login(MemberVO vo){
        MemberVO result = my.selectOne("member.login", vo);
        return result;
    }
	
	//네이버 회원가입
	public int naverInsert(MemberVO bag) {
		int result = my.insert("member.createN", bag);
		return result;
	}
	
	//네이버 로그인
	public MemberVO naverIdCheck(String member_id) {
		int result = my.selectOne("member.idCheck", member_id);
		MemberVO result2 = null;
		if(result == 1) {
			result2 = my.selectOne("member.naverLogin", member_id);
		}
		return result2;
	}
	
	//id 아이디 찾기
	public String idFind(MemberVO vo) {
		//타입 MemberVo  //one은 selectOne
		String member_id = my.selectOne("member.idFind", vo);
		System.out.println(member_id);
		return member_id;
	}
	
	//pw 패스워드 변경하기
	public int pwFind(MemberVO vo) {
		int result = my.update("member.pwFind", vo);
		return result;
	}
	
	//회원정보 가져오기
	public MemberVO memberInfo(int member_no) {
		MemberVO info = my.selectOne("member.memberInfo", member_no);
		System.out.println(info);
		return info;
	}
	
	//프로필 이미지, 닉네임, 성별, 연령대 변경
	public MemberVO profile_up(MemberVO bag) {
		int result = my.update("member.profile", bag);
		MemberVO info = null;
		if (result != 0) {
			info = my.selectOne("member.memberInfo", bag.getMember_no());
		}
		return info;
	}
	
	//이메일, pw, 이름, 전화번호 변경
	public void revise_up(MemberVO bag) {
		int result = my.update("member.revise_up", bag);
		System.out.println(result);
	}
	
	//회원탈퇴
	public void drop(int member_no) {
		my.delete("member.drop", member_no);
	}
	
	//전화번호 중복체크
	public int telCheck(String member_tel) {
		int result = my.selectOne("member.telCheck", member_tel);
		return result;
	}
	
}