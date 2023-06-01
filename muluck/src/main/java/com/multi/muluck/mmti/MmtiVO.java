package com.multi.muluck.mmti;

public class MmtiVO {
    private int question_id;
    private String question_type;
    private String question_title;
    private String option_a;
    private String option_b;

    public MmtiVO(int question_id, String question_type, String question_title, String option_a, String option_b) {
        this.question_id = question_id;
        this.question_type = question_type;
        this.question_title = question_title;
        this.option_a = option_a;
        this.option_b = option_b;
    }

    // Getters and Setters

    public int getquestion_id() {
        return question_id;
    }

    public void setquestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getquestion_type() {
        return question_type;
    }

    public void setquestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getquestion_title() {
        return question_title;
    }

    public void setquestion_title(String question_title) {
        this.question_title = question_title;
    }

    public String getoption_a() {
        return option_a;
    }

    public void setoption_a(String option_a) {
        this.option_a = option_a;
    }

    public String getoption_b() {
        return option_b;
    }

    public void setoption_b(String option_b) {
        this.option_b = option_b;
    }

    @Override
    public String toString() {
        return "MmtiVO{" +
                "question_id=" + question_id +
                ", question_type='" + question_type + '\'' +
                ", question_title='" + question_title + '\'' +
                ", option_a='" + option_a + '\'' +
                ", option_b='" + option_b + '\'' +
                '}';
    }
}
