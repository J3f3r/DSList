package com.devsuperior.dslist.dto;

import com.devsuperior.dslist.entities.Game;

public class GameMinDTO {
	private Long id;
	private String title;
	private Integer yaer;
	private String imgUrl;
	private String shortDescription;
	
	public GameMinDTO(Game entity) {
		
		id = entity.getId();
		title = entity.getGenre();
		yaer = entity.getYaer();
		imgUrl = entity.getGenre();
		shortDescription = entity.getGenre();
	}

	public Long getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public Integer getYaer() {
		return yaer;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public String getShortDescription() {
		return shortDescription;
	}
	
	
}
