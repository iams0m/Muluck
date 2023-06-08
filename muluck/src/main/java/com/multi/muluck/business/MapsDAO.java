package com.multi.muluck.business;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MapsDAO {
	private final SqlSessionTemplate my;
	
	@Autowired
	public MapsDAO(SqlSessionTemplate my) {
		this.my=my;
	}
	
	public void insert(MapsVO vo) {
		my.insert("maps.create", vo);
	} 
}
