package com.multi.muluck.card;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CardDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(CardVO vo) {
		my.insert("card.insert", vo);
	}
	
	public List<CardVO> list() {
		List<CardVO> list = my.selectList("card.all"); 
		return list;
	}
	
	public CardVO one(int card_no) {
		return my.selectOne("card.one", card_no);
	}
	
	public int update(CardVO bag) {
		int result = my.update("card.up", bag);
		return result;	
	}
	
	public int delete(int card_no) {
		int result = my.delete("card.del", card_no);
		return result;
	}
	
}
