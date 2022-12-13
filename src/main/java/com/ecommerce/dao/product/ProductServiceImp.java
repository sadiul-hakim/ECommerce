package com.ecommerce.dao.product;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecommerce.entities.Category;
import com.ecommerce.entities.Product;
import com.ecommerce.entities.User;
import com.ecommerce.helper.FactoryProvider;

public class ProductServiceImp implements ProductService {

	@Override
	public int save(Product product) {
		Session session=FactoryProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
		
		int result=(int)session.save(product);
		
		tx.commit();
		session.close();
		return result;
	}

	@Override
	public List<Product> allProducts() {
		String query="from Product";
		Session session=FactoryProvider.getFactory().openSession();
		
		Query<Product> q=session.createQuery(query);
		
		List<Product> list=q.getResultList();
		
		session.close();
		return list;
	}

	@Override
	public Product getProduct(int id) {
		Product product=null;
		try{
			String query="from Product where id=:i";
			Session session=FactoryProvider.getFactory().openSession();
			
			Query<Product> q=session.createQuery(query);
			q.setParameter("i", id);
			
			product=q.uniqueResult();
			
			session.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}

}
