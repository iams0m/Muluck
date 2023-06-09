package com.multi.muluck.diary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class CalendarDAO { 
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert1(calendarVO bag) {
		my.insert("Calendar.create", bag);
		 int generatedId = bag.getCalendar_id();
		 System.out.println("Generated calendar_id: " + generatedId);
	}
	public int delete(calendarVO bag) {
		  int result = my.delete("Calendar.del", bag);
		    System.out.println(result);
		    return result;
	}	
	public int  update(calendarVO bag) {
		int result = my.update("Calendar.up", bag);
	    System.out.println(result);
	    return result;
	}
	public calendarVO one(int calendar_id) {
		calendarVO vo = my.selectOne("Calendar.one", calendar_id);
		System.out.println(vo);
		return vo;
	}

	public List<calendarVO> list() {
		List<calendarVO> list = my.selectList("Calendar.all");
		System.out.println(list.size());
		return list;
	}
	
	
}