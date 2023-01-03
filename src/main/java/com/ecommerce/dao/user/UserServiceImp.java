package com.ecommerce.dao.user;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecommerce.entities.Category;
import com.ecommerce.entities.User;
import com.ecommerce.helper.Encryptor;
import com.ecommerce.helper.FactoryProvider;

public class UserServiceImp implements UserService {
	private Encryptor sha256Encryptor;
	
	
	
	public UserServiceImp(Encryptor sha256Encryptor) {
		super();
		this.sha256Encryptor = sha256Encryptor;
	}



	@Override
	public int save(User user) {
		
		User oldUser=getUser(user.getEmail());
		
		if(oldUser!=null) {
			return -1;
		}
		
		Session session= FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		
		String password=user.getPassword();
		password=sha256Encryptor.encrypt(password);
		
		user.setPassword(password);
		
		int id=(int) session.save(user);
		
		tx.commit();
		session.close();
		
		return id;
		
	}



	@Override
	public User login(LoginDTO dto) {
		
		User user=getUser(dto.getEmail());
		String newPassword=sha256Encryptor.encrypt(dto.getPassword());
		
		if(user==null || !user.getPassword().equals(newPassword)) {
			return null;
		}
		
		return user;
		
	}



	@Override
	public User getUser(String email) {
		User user=null;
		try{
			String query="from User where email=:e";
			Session session=FactoryProvider.getFactory().openSession();
			
			Query<User> q=session.createQuery(query);
			q.setParameter("e", email);
			
			user=q.uniqueResult();
			
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}



	@Override
	public List<User> allUsers() {
		String query="from User where role='user'";
		Session session=FactoryProvider.getFactory().openSession();
		
		Query<User> q=session.createQuery(query);
		
		List<User> list=q.getResultList();
		
		session.close();
		return list;
	}

}
