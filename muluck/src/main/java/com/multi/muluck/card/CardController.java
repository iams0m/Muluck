package com.multi.muluck.card;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class CardController {
	
	@Autowired
	CardDAO dao;
	
	@RequestMapping("insert")
	public void insert(
					CardVO cardVO,
					HttpServletRequest request, 
					MultipartFile file, 
					Model model) throws Exception {
		String savedName = file.getOriginalFilename();
		String uploadPath 
			= request.getSession().getServletContext().getRealPath("../resources/upload");
		File target = new File(uploadPath + "/" + savedName);
		file.transferTo(target);
		
		model.addAttribute("savedName", savedName);
		System.out.println("img넣기 전>> " + cardVO);
		cardVO.setCard_img(savedName);
		System.out.println("img넣은 후>> " + cardVO);
		
		dao.insert(cardVO);
		//컨트롤로의 vo변수명을 맨앞글자만 소문자로 바꾸어서 변수를 만들면,
		//자동으로 모델의 속성으로 등록시켜줌.
		//model.addAttribute("cardVO", cardVO);
	}
}
