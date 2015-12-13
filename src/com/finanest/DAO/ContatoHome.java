package com.finanest.DAO;

// Generated 09/12/2015 08:56:31 by Hibernate Tools 4.3.1

import java.util.List;

import javax.naming.InitialContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Contato;

/**
 * Home object for domain model class Contato.
 * @see com.finanest.DAO.Contato
 * @author Hibernate Tools
 */
public class ContatoHome {
	
	private Session session;

	private static final Log log = LogFactory.getLog(ContatoHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Contato transientInstance) {
		log.debug("persisting Contato instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Contato instance) {
		log.debug("attaching dirty Contato instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Contato instance) {
		log.debug("attaching clean Contato instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Contato persistentInstance) {
		log.debug("deleting Contato instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Contato merge(Contato detachedInstance) {
		log.debug("merging Contato instance");
		try {
			Contato result = (Contato) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Contato findById(java.lang.Integer id) {
		log.debug("getting Contato instance with id: " + id);
		try {
			Contato instance = (Contato) sessionFactory.getCurrentSession()
					.get("com.finanest.DAO.Contato", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Contato instance) {
		log.debug("finding Contato instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.finanest.DAO.Contato")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List listar() {
		HibernateUtil.setUp();
		session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		List l1 = session.createQuery("from Contato").list();
		session.getTransaction().commit();
		return l1;
	}
}
