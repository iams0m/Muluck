package com.multi.muluck.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommunityDAO {

	@Autowired
	SqlSessionTemplate my;
	
	//각 bbs 글 목록
	//자유게시판
	public List<BbsVO> bbs_list1() {
		List<BbsVO> list = my.selectList("bbs.all_category1");
		return list;
	}
	//질문게시판
	public List<BbsVO> bbs_list2() {
		List<BbsVO> list = my.selectList("bbs.all_category2");
		return list;
	}
	//자랑게시판
	public List<BbsVO> bbs_list3() {
		List<BbsVO> list = my.selectList("bbs.all_category3");
		return list;
	}
	//오픈채팅방
	public List<BbsVO> bbs_list4() {
		List<BbsVO> list = my.selectList("bbs.all_category4");
		return list;
	}

}
