package com.multi.muluck.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BbsDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	//게시판 글쓰기(카테고리별)
	public int bbs_insert1(BbsVO bag) {
		int result = my.insert("bbs.create1", bag);
		return result;
	}
	public int bbs_insert2(BbsVO bag) {
		int result = my.insert("bbs.create2", bag);
		return result;
	}
	public int bbs_insert3(BbsVO bag) {
		int result = my.insert("bbs.create3", bag);
		return result;
	}
	public int bbs_insert4(BbsVO bag) {
		int result = my.insert("bbs.create4", bag);
		return result;
	}
	
	//update(카테고리별)
	public int bbs_update1(BbsVO bag) {
		int result = my.update("bbs.update1", bag);
		return result;
	}
	public int bbs_update2(BbsVO bag) {
		int result = my.update("bbs.update2", bag);
		return result;
	}
	public int bbs_update3(BbsVO bag) {
		int result = my.update("bbs.update3", bag);
		return result;
	}
	public int bbs_update4(BbsVO bag) {
		int result = my.update("bbs.update4", bag);
		return result;
	}
	
	//delete(카테고리별)
	public int bbs_delete1(int bbs_no) {
		int result = my.delete("bbs.delete1", bbs_no);
		return result;
	}
	public int bbs_delete2(int bbs_no) {
		int result = my.delete("bbs.delete2", bbs_no);
		return result;
	}	
	public int bbs_delete3(int bbs_no) {
		int result = my.delete("bbs.delete3", bbs_no);
		return result;
	}
	public int bbs_delete4(int bbs_no) {
		int result = my.delete("bbs.delete4", bbs_no);
		return result;
	}
	
	//게시글 검색(카테고리별)
	public BbsVO bbs_one1(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one1", bbs_no);
		return bag;
	}
	public BbsVO bbs_one2(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one2", bbs_no);
		return bag;
	}
	public BbsVO bbs_one3(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one3", bbs_no);
		return bag;
	}
	public BbsVO bbs_one4(int bbs_no) {
		BbsVO bag = my.selectOne("bbs.one4", bbs_no);
		return bag;
	}
	
	//좋아요
	public int heart_ok(HeartVO bag) {
		int result = my.insert("bbs.heart_ok", bag);
		return result;
	}
	//좋아요 취소
	public int heart_no(HeartVO bag) {
		int result = my.insert("bbs.heart_no", bag);
		return result;
	}
	
	//북마크
	public int bookmark_ok(BookmarkVO bag) {
		int result = my.insert("bbs.bookmark_ok", bag);
		return result;
	}
	//북마크 취소
	public int bookmark_no(BookmarkVO bag) {
		int result = my.insert("bbs.bookmark_no",bag);
		return result;
	}

}
