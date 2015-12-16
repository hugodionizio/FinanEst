package com.finanest.DAO;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;



import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Estoque;

@ManagedBean(name="EstoqueDAO", eager = true)
@RequestScoped
public class EstoqueDAO {
	private Session session;
	public EstoqueDAO(){}
	
	public void salvar(Estoque transientInstance) {
		//log.debug("persisting Estoque instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(transientInstance);
			session.getTransaction().commit();
			//log.debug("persist successful");
		} catch (RuntimeException re) {
			//log.error("persist failed", re);
			throw re;
		}
	}
	
	public List listar() {
		//log.debug("listing Estoque instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			List results = session.createQuery("from Estoque").list();
			session.getTransaction().commit();
			//log.debug("list successful, result size: "
			//		+ results.size());
			return results;
		} catch (RuntimeException re) {
			//log.error("list failed", re);
			throw re;
		}
	}
	
	public void altera(Estoque detachedInstance) {
		//log.debug("updating Estoque instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.update(detachedInstance);
			session.getTransaction().commit();
			//log.debug("update successful");
		} catch (RuntimeException re) {
			//log.error("update failed", re);
			throw re;
		}
	}
	
	public void remover(Estoque persistentInstance) {
		//log.debug("deleting Estoque instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			//log.debug("delete successful");
		} catch (RuntimeException re) {
			//log.error("delete failed", re);
			throw re;
		}
	}
}
