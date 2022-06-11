package com.garrett.project.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
@Table(name="computers")
public class PC{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "PC must have a Name or Nickname")
	@Size(min = 2, message = "PC Name/Nickname must be at least 2 characters")
	private String name;
	
	@NotNull(message = "Price must have a value")
	@Min(value=500, message = "Price must be more than $500")
	private Integer price;
	
	@NotEmpty(message = "A Resolution field must be selected")
	private String resolution;

	@NotEmpty(message = "A Usage Type must be selected")
	private String need;
	
	
	//--------Optional-----------//
	private String image;
	
	private String link;
	
	private Boolean water;
	
	private Boolean aio;
	
	private Boolean rgb;
	
	private Boolean cable;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	
	public PC() {
		
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public String getResolution() {
		return resolution;
	}


	public void setResolution(String resolution) {
		this.resolution = resolution;
	}


	public String getNeed() {
		return need;
	}


	public void setNeed(String need) {
		this.need = need;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public Boolean getWater() {
		return water;
	}


	public void setWater(Boolean water) {
		this.water = water;
	}


	public Boolean getAio() {
		return aio;
	}


	public void setAio(Boolean aio) {
		this.aio = aio;
	}


	public Boolean getRgb() {
		return rgb;
	}


	public void setRgb(Boolean rgb) {
		this.rgb = rgb;
	}


	public Boolean getCable() {
		return cable;
	}


	public void setCable(Boolean cable) {
		this.cable = cable;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	
	

	
	


	
	
	
	


	

	

	
	
	
	
	
	

}
