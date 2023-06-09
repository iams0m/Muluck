package com.multi.muluck.diary;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RestController//data만 반환할때 주로사용? 
@RequestMapping("/diary")
public class CalendarController {
	
	@Autowired
	CalendarDAO dao; 
	
	@RequestMapping("/insert1")
	@ResponseBody
	public void insert(calendarVO bag, HttpServletResponse response, HttpSession session) throws IOException {
		System.out.println(bag);
		bag.setMember_no((int)session.getAttribute("member_no"));
		System.out.println(bag);
	    dao.insert1(bag);
	    System.out.println("새로 생성된 calendar_id: " + bag.getCalendar_id());
	    
	    // 응답 데이터에 calendar_id 값을 포함하여 전송
	    JSONObject responseData = new JSONObject();
	    responseData.put("calendar_id", bag.getCalendar_id());

	    response.setContentType("application/json");
	    response.getWriter().write(responseData.toString());
	}
	
	@RequestMapping("/delete1")
	@ResponseBody
	public void delete(@RequestBody calendarVO bag) {
		System.out.println(bag);
		int calendar_id = bag.getCalendar_id();
		dao.delete(bag);
	}

	@RequestMapping("/update1")
	@ResponseBody
	public void update(@RequestBody calendarVO bag) {
		System.out.println(bag);
		int calendar_id = bag.getCalendar_id();
		dao.update(bag);
	}
	
	@RequestMapping("/list1")
	@ResponseBody
	public List<calendarVO> list() {
	    List<calendarVO> list = dao.list();
	    return list;
	}
}
