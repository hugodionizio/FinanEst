package com.finanest.DAO;

// Generated 09/12/2015 08:56:31 by Hibernate Tools 4.3.1

import java.util.List;

import javax.naming.InitialContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.finanest.annotations.Caixa;

/**
 * Home object for domain model class Caixa.
 * @see com.finanest.DAO.Caixa
 * @author Hibernate Tools
 */
public class CaixaHome {

	private static final Log log = LogFactory.getLog(CaixaHome.class);

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

	public void persist(Caixa transientInstance) {
		log.debug("persisting Caixa instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Caixa instance) {
		log.debug("attaching dirty Caixa instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Caixa instance) {
		log.debug("attaching clean Caixa instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Caixa persistentInstance) {
		log.debug("deleting Caixa instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Caixa merge(Caixa detachedInstance) {
		log.debug("merging Caixa instance");
		try {
			Caixa result = (Caixa) sessionFactory.getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Caixa findById(java.lang.Integer id) {
		log.debug("getting Caixa instance with id: " + id);
		try {
			Caixa instance = (Caixa) sessionFactory.getCurrentSession().get(
					"com.finanest.DAO.Caixa", id);
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

	public List findByExample(Caixa instance) {
		log.debug("finding Caixa instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.finanest.DAO.Caixa")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
