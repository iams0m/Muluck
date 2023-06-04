package com.multi.muluck.diary;

import java.util.*;

public class diaryVO {

	private int d_no;
	private String d_img;
	private String d_nickname;
	private String d_title;
	private String d_contents;
	private String d_mood;
	private Date d_date;
	private int member_no;
	private int card_no;
	
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getD_img() {
		return d_img;
	}
	public void setD_img(String d_img) {
		this.d_img = d_img;
	}
	public String getD_nickname() {
		return d_nickname;
	}
	public void setD_nickname(String d_nickname) {
		this.d_nickname = d_nickname;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public String getD_contents() {
		return d_contents;
	}
	public void setD_contents(String d_contents) {
		this.d_contents = d_contents;
	}
	public String getD_mood() {
		return d_mood;
	}
	public void setD_mood(String d_mood) {
		this.d_mood = d_mood;
	}
	public Date getD_date() {
		return d_date;
	}
	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getCard_no() {
		return card_no;
	}
	public void setCard_no(int card_no) {
		this.card_no = card_no;
	}
	
	@Override
	public String toString() {
		return "diaryVO [d_no=" + d_no + ", d_img=" + d_img + ", d_nickname=" + d_nickname + ", d_title=" + d_title
				+ ", d_contents=" + d_contents + ", d_mood=" + d_mood + ", d_date=" + d_date + ", member_no="
				+ member_no + ", card_no=" + card_no + "]";
	}
	
}