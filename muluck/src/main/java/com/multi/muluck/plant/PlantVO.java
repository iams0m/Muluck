package com.multi.muluck.plant;

public class PlantVO {
	private Integer plant_no;
	private String plant_img;
	private String plant_species;
	private String plant_info;
	private String plant_water;
	private String plant_light;
	private String plant_place;
	private String plant_level;

	public Integer getPlant_no() {
		return plant_no;
	}

	public void setPlant_no(Integer plant_no) {
		this.plant_no = plant_no;
	}

	public String getPlant_img() {
		return plant_img;
	}

	public void setPlant_img(String plant_img) {
		this.plant_img = plant_img;
	}

	public String getplant_species() {
		return plant_species;
	}

	public void setplant_species(String plant_species) {
		this.plant_species = plant_species;
	}

	public String getPlant_info() {
		return plant_info;
	}

	public void setPlant_info(String plant_info) {
		this.plant_info = plant_info;
	}

	public String getPlant_water() {
		return plant_water;
	}

	public void setPlant_water(String plant_water) {
		this.plant_water = plant_water;
	}

	public String getPlant_light() {
		return plant_light;
	}

	public void setPlant_light(String plant_light) {
		this.plant_light = plant_light;
	}

	public String getPlant_place() {
		return plant_place;
	}

	public void setPlant_place(String plant_place) {
		this.plant_place = plant_place;
	}

	public String getPlant_level() {
		return plant_level;
	}

	public void setPlant_level(String plant_level) {
		this.plant_level = plant_level;
	}

	@Override
	public String toString() {
		return "PlantVO [plant_no=" + plant_no + ", plant_img=" + plant_img + ", plant_species=" + plant_species
				+ ", plant_info=" + plant_info + ", plant_water=" + plant_water + ", plant_light=" + plant_light
				+ ", plant_place=" + plant_place + ", plant_level=" + plant_level + "]";
	}

}
