package com.multi.muluck.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {

	@Autowired
	ReplyDAO dao;
	
	//댓글 작성
	@RequestMapping("community/rr")
	public void reply_insert(ReplyVO bag, HttpServletRequest request) {
		dao.reply_insert(bag);
		//세션 값 가져오기
		HttpSession session = request.getSession();
		int member_no = (int) session.getAttribute("member_no");
		System.out.println("세션 값 : "+ member_no);
	}
	
	//댓글 목록
	@RequestMapping("community/rr_list")
	public void reply_list(int bbs_no, Model model) {
		List<ReplyVO> reply_list = dao.reply_list(bbs_no);
		model.addAttribute("list", reply_list);
	}
	
	//댓글 삭제
	@RequestMapping("community/rr_delete")
	public void reply_delete(ReplyVO bag) {
		dao.reply_delete(bag);
	}
}
