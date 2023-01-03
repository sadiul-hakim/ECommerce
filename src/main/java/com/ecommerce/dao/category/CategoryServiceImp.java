package com.ecommerce.dao.category;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecommerce.entities.Category;
import com.ecommerce.helper.FactoryProvider;

public class CategoryServiceImp implements CategoryService {
	
	@Override
	public int add(Category category) {
		Session session=FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		
		int result=(int)session.save(category);
		
		tx.commit();
		session.close();
		return result;
	}

	@Override
	public List<Category> allCategories() {
		
		String query="from Category";
		Session session=FactoryProvider.getFactory().openSession();
		Query<Category> q=session.createQuery(query);
		
		List<Category> list=q.getResultList();
		
		session.close();
		return list;
	}

	@Override
	public Category getCategory(int id) {
		// TODO Auto-generated method stub
		Session session=FactoryProvider.getFactory().openSession();
		Category category=session.get(Category.class, id);
		
		return category;
	}

}
