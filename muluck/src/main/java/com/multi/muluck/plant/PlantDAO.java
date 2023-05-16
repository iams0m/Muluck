package com.multi.muluck.plant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PlantDAO {

	@Autowired
	SqlSessionTemplate my;

	public PlantVO one(String plant_species) {
		PlantVO bag = my.selectOne("plant.one", plant_species);
		return bag;
	}

	public List<PlantVO> list() {
		List<PlantVO> list = my.selectList("plant.all");
		return list;
	}

}
