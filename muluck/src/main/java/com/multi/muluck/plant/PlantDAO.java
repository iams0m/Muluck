package com.multi.muluck.plant;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PlantDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(PlantVO bag) {
		int result = my.insert("plant.insert", bag);
		return result;
	}
	
	public int update(PlantVO bag) {
		int result = my.update("plant.update", bag);
		return result;
	}
	
	public int delete(int plant_no) {
		int result = my.update("plant.delete", plant_no);
		return result;
	}
	
	public PlantVO one(String plant_species) {
		PlantVO bag = my.selectOne("plant.one", plant_species);
		return bag;
	}
	
	public List<PlantVO> list() {
		List<PlantVO> list = my.selectList("plant.all");
		return list;
	}

}
