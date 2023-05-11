package com.multi.muluck.card;

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
	
	
}
