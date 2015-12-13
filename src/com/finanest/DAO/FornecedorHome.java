package com.finanest.DAO;

// Generated 09/12/2015 08:56:31 by Hibernate Tools 4.3.1

import java.util.List;

import javax.naming.InitialContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.finanest.annotations.Fornecedor;

/**
 * Home object for domain model class Fornecedor.
 * @see com.finanest.DAO.Fornecedor
 * @author Hibernate Tools
 */
public class FornecedorHome {

	private static final Log log = LogFactory.getLog(FornecedorHome.class);

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

	public void persist(Fornecedor transientInstance) {
		log.debug("persisting Fornecedor instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Fornecedor instance) {
		log.debug("attaching dirty Fornecedor instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Fornecedor instance) {
		log.debug("attaching clean Fornecedor instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Fornecedor persistentInstance) {
		log.debug("deleting Fornecedor instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Fornecedor merge(Fornecedor detachedInstance) {
		log.debug("merging Fornecedor instance");
		try {
			Fornecedor result = (Fornecedor) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Fornecedor findById(java.lang.Integer id) {
		log.debug("getting Fornecedor instance with id: " + id);
		try {
			Fornecedor instance = (Fornecedor) sessionFactory
					.getCurrentSession().get("com.finanest.DAO.Fornecedor", id);
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

	public List findByExample(Fornecedor instance) {
		log.debug("finding Fornecedor instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.finanest.DAO.Fornecedor")
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
