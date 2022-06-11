package com.garrett.project.models;

public enum Resolution {
	
	HD("HD: 1920 x 1080p @ 144hz"),
	TWO("2K: 2560 x 1440p @ 144hz"),
	FOUR("4K: 3840 x 2160p @ 120hz"),
	FIVE("5K: 5120 x 2160p @ 120hz");
	
	private String des;
	
	private Resolution(String des){
		this.des = des;
	}
	
	public String getDes() {
		return this.des;
	}
}
