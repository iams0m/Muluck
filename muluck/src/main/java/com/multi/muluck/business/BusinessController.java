package com.multi.muluck.business;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BusinessController {
	@Autowired
	BusinessDAO dao;

	@PostMapping("business/insert")
	public void insert(BusinessVO bag, HttpServletRequest request, MultipartFile file, Model model) throws Exception {

		HttpSession session =request.getSession();
		System.out.println(bag.toString());
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		System.err.println("uploadPath : " + uploadPath);
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);

		model.addAttribute("savedName", savedName);
		bag.setBusiness_image(savedName);
	
		bag.setMember_no(Integer.parseInt(session.getAttribute("member_no").toString())); //세션에서 받아온 member_no를 int형으로 변환
		System.out.println(uploadPath + "/" + savedName);

		System.out.println("insert");
		System.out.println(bag);

		System.out.println(session.getAttribute("member_no"));
		System.out.println(session.getAttribute("member_id"));
		System.out.println(session.getAttribute("member_nickname"));
		dao.insert(bag);

	}

	@RequestMapping("business/shareList")
	public void shareList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BusinessVO> list = dao.all(vo);
		int count = dao.count();
		System.out.println("all count>> " + count);
		int pages = count / 10 + 1;//전체 페이지 개수 구하기
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("business/dealList")
	public void dealList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BusinessVO> list = dao.all(vo);
		int count1 = dao.count1();
		System.out.println("all count>> " + count1);
		int pages = count1 / 10 + 1;//전체 페이지 개수 구하기
		model.addAttribute("list", list);
		model.addAttribute("count1", count1);
		model.addAttribute("pages", pages);
	}
	
	@RequestMapping("business/businessList")
	public void businessList(PageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<BusinessVO> list=dao.list2(vo);
		model.addAttribute("list",list);
	}
	
	
	

}
