package com.multi.muluck.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FollowDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	//팔로우
	public int follow(FollowVO bag) {
		int result = my.insert("user.follow", bag);
		return result;
	}

	//언팔로우
	public int unfollow(FollowVO bag) {
		int result = my.delete("user.unfollow", bag);
		return result;
	}

}
