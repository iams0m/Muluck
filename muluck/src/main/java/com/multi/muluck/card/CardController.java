package com.multi.muluck.card;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CardController {

	@Autowired
	CardDAO dao;

	// 반려식물 등록증 등록 시, 파일 업로드
	@RequestMapping("card/insert")
	public void insert(CardVO cardVO, HttpServletRequest request, MultipartFile file, Model model) throws Exception {
		String savedName = file.getOriginalFilename();

		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");

		File target = new File(uploadPath + "/" + savedName);
		System.out.println("target : " + target);
		file.transferTo(target);

		model.addAttribute("savedName", savedName);
		System.out.println("img넣기 전>> " + cardVO);
		cardVO.setCard_img(savedName);
		System.out.println("img넣은 후>> " + cardVO);

		dao.insert(cardVO);
	}

	// 반려식물 등록증 전체 목록
	@RequestMapping("card/list")
	public void list(Model model) {
		List<CardVO> list = dao.list();
		model.addAttribute("list", list);
	}

	// 반려식물 등록증 하나만 불러오기

	@RequestMapping("card/one")
	public void one(int card_no, Model model) {
		System.out.println("one요청됨 : ");
		System.out.println(card_no);
		CardVO bag = dao.one(card_no);
		model.addAttribute("bag", bag);
		
	}

	// 반려식물 등록증 수정
	@RequestMapping("card/update")
	public String update(CardVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
		return "redirect:list";
	}

	// 반려식물 등록증 삭제
	@RequestMapping("card/delete")
	public String delete(Integer card_no) {
		System.out.println("delete요청됨.");
		System.out.println(card_no);
		dao.delete(card_no);
		return "redirect:list";
	}

}
