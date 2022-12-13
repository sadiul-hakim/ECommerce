package com.ecommerce.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(length = 100)
	private String title;
	@Column(length = 300)
	private String description;
	@Column(length = 50)
	private String pic;
	private int price;
	private int discount;
	private int quantity;
	
	@ManyToOne
	private Category cid;
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int id, String title, String description, String pic, int price, int discount, int quantity,
			Category cid, Date date) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.pic = pic;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.cid = cid;
		this.date = date;
	}

	public Product(String title, String description, String pic, int price, int discount, int quantity, Category cid,
			Date date) {
		super();
		this.title = title;
		this.description = description;
		this.pic = pic;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.cid = cid;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Category getCid() {
		return cid;
	}

	public void setCid(Category cid) {
		this.cid = cid;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", title=" + title + ", description=" + description + ", pic=" + pic + ", price="
				+ price + ", discount=" + discount + ", quantity=" + quantity + ", cid=" + cid + ", date=" + date + "]";
	}
	
	
}
