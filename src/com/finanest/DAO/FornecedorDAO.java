package com.finanest.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Estoque;
import com.finanest.annotations.Fornecedor;
import com.finanest.annotations.Fornecedor;

@ManagedBean(name = "FornecedorDAO", eager = true)
@RequestScoped
public class FornecedorDAO {
	private static Session session;

	public FornecedorDAO() {
	}

	public void salvar(Fornecedor transientInstance) {
		// log.debug("persisting Fornecedor instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(transientInstance);
			session.getTransaction().commit();
			// log.debug("persist successful");
		} catch (RuntimeException re) {
			// log.error("persist failed", re);
			throw re;
		}
	}

	public ArrayList<Fornecedor> getFornecedorLista() {
		ArrayList<Fornecedor> tabela = new ArrayList<Fornecedor>();

		List<Fornecedor> lista = listar();
		for (Fornecedor fornecedor : lista) {
			tabela.add(fornecedor);
		}

		return tabela;
	}

	public static List listar() {
		// log.debug("listing Fornecedor instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List results = session.createQuery("from Fornecedor").list();
			session.getTransaction().commit();
			// log.debug("list successful, result size: "
			// + results.size());
			return results;
		} catch (RuntimeException re) {
			// log.error("list failed", re);
			throw re;
		}
	}

	public void altera(Fornecedor detachedInstance) {
		// log.debug("updating Fornecedor instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.update(detachedInstance);
			session.getTransaction().commit();
			// log.debug("update successful");
		} catch (RuntimeException re) {
			// log.error("update failed", re);
			throw re;
		}
	}

	public void remover(Fornecedor persistentInstance) {
		// log.debug("deleting Fornecedor instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			// log.debug("delete successful");
		} catch (RuntimeException re) {
			// log.error("delete failed", re);
			throw re;
		}
	}

	public String buscarNomeFantasia(Integer idFornecedor) {

		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			Fornecedor fornecedor = (Fornecedor) session
					.createCriteria(Fornecedor.class)
					.add(Restrictions.idEq(idFornecedor)).uniqueResult();

			session.getTransaction().commit();
			return fornecedor.getNmfantasia();

		} catch (RuntimeException re) {
			// log.error("get failed", re);
			return null;
		}
	}
}
