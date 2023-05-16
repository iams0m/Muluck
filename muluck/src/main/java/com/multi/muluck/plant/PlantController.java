package com.multi.muluck.plant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("plant")

@Controller
public class PlantController {

	@Autowired
	PlantDAO dao;

	/*
	 * @RequestMapping("/plant") public void landing(Model model) {
	 * System.out.println("야호 "); // Model은 컨트롤러의 list를 views/list.jsp까지만 전달할 수 있는
	 * 객체 List<PlantVO> list = dao.list(); model.addAttribute("list", list);
	 * System.out.println("list : "+ list); }
	 */

	@RequestMapping("one")
	public void one(String plant_species, Model model) {
		System.out.println("one요청됨.");
		System.out.println(plant_species);
		PlantVO bag = dao.one(plant_species);
		model.addAttribute("bag", bag);
	}

	@RequestMapping("plant")
	public void list(Model model) { // Model은 컨트롤러의 list를 views/list.jsp까지만 전달할 수 있는 객체
	List<PlantVO> list = dao.list();
	model.addAttribute("list", list);
	}
	
	
}
