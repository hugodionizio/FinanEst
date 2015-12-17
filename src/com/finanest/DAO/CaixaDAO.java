package com.finanest.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;




import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Caixa;
import com.finanest.annotations.Caixa;

@ManagedBean(name="CaixaDAO", eager = true)
@RequestScoped
public class CaixaDAO {
	private static Session session;
	public CaixaDAO(){}
	
	public void salvar(Caixa transientInstance) {
		//log.debug("persisting Caixa instance");
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
	
	private static final ArrayList<Caixa> itemLista = mapear();
	public static ArrayList<Caixa> mapear() {
		ArrayList<Caixa> tabela = new ArrayList<Caixa>();
		
		List<Caixa> lista = listar();
		for (Caixa item : lista) {
			tabela.add(item);
		}
		
		return tabela;
	}
	
	public ArrayList<Caixa> getCaixaLista () {
		return itemLista;
	}
	
	public static List listar() {
		//log.debug("listing Caixa instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List results = session.createQuery("from Caixa").list();
			session.getTransaction().commit();
			//log.debug("list successful, result size: "
			//		+ results.size());
			return results;
		} catch (RuntimeException re) {
			//log.error("list failed", re);
			throw re;
		}
	}
	
	public void altera(Caixa detachedInstance) {
		//log.debug("updating Caixa instance");
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
	
	public void remover(Caixa persistentInstance) {
		//log.debug("deleting Caixa instance");
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
