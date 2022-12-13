package com.ecommerce.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(length = 50)
	private String title;
	@Column(length = 250)
	private String description;
	
	@OneToMany(mappedBy = "cid")
	private List<Product> products;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}

	public Category(int id, String title, String description, List<Product> products, Date date) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.products = products;
		this.date = date;
	}

	public Category(String title, String description, List<Product> products, Date date) {
		super();
		this.title = title;
		this.description = description;
		this.products = products;
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

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", title=" + title + ", description=" + description + ", products=" + products
				+ ", date=" + date + "]";
	}
	
	
}
