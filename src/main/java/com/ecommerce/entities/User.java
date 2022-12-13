package com.ecommerce.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(length = 50)
	private String name;
	@Column(length = 50)
	private String email;
	@Column(length = 350)
	private String password;
	@Column(length = 50)
	private String phone;
	@Column(length = 100)
	private String pic;
	@Column(length = 350)
	private String address;
	@Column(length = 30)
	private String role;
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int id, String name, String email, String password, String phone, String pic, String address,
			String role, Date date) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.pic = pic;
		this.address = address;
		this.role = role;
		this.date = date;
	}

	public User(String name, String email, String password, String phone, String pic, String address, String role,
			Date date) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.pic = pic;
		this.address = address;
		this.role = role;
		this.date = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", phone=" + phone
				+ ", pic=" + pic + ", address=" + address + ", role=" + role + ", date=" + date + "]";
	}

	
	
	
}
