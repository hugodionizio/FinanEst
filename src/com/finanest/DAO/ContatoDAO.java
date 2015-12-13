package com.finanest.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Contato;

public class ContatoDAO {
	private Session session;
	private static final Log log = LogFactory.getLog(ContatoHome.class);

	
	public ContatoDAO(){}
	
	public void salvar(Contato transientInstance) {
		log.debug("persisting Contato instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(transientInstance);
			session.getTransaction().commit();
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}
	
	@SuppressWarnings("rawtypes")
	public List listar() {
		log.debug("listing Contato instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			List results = session.createQuery("from Contato").list();
			session.getTransaction().commit();
			log.debug("list successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("list failed", re);
			throw re;
		}
	}

	public void altera(Contato detachedInstance) {
		log.debug("updating Contato instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.update(detachedInstance);
			session.getTransaction().commit();
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	public void remover(Contato persistentInstance) {
		log.debug("deleting Contato instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
}
