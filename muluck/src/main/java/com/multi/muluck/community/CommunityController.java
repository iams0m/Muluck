package com.multi.muluck.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityDAO dao;

	//각 bbs 글 목록
	//자유게시판
	@RequestMapping("community/bbs1")
	public void bbs_list1(Model model) {
		List<BbsVO> bbs_list = dao.bbs_list1();
		model.addAttribute("list", bbs_list);
	}
	//질문게시판
	@RequestMapping("community/bbs2")
	public void bbs_list2(Model model) {
		List<BbsVO> bbs_list = dao.bbs_list2();
		model.addAttribute("list", bbs_list);
	}
	//자랑게시판
	@RequestMapping("community/bbs3")
	public void bbs_list3(Model model) {
		List<BbsVO> bbs_list = dao.bbs_list3();
		model.addAttribute("list", bbs_list);
	}

}
