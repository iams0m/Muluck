package com.multi.muluck.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;

	//댓글 작성
	public int reply_insert(ReplyVO bag) {
		int result = my.insert("reply.create", bag);
		return result;
	}
	
	//댓글 목록 
	public List<ReplyVO> reply_list(int bbs_no) {
		List<ReplyVO> list = my.selectList("reply.all", bbs_no);
		return list;
	}
	
	//댓글 삭제
	public int reply_delete(ReplyVO bag) {
		int result = my.delete("reply.delete", bag);
		return result;
	}

}
