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
import com.finanest.annotations.Funcionario;
import com.finanest.annotations.Funcionario;

@ManagedBean(name="FuncionarioDAO", eager = true)
@RequestScoped
public class FuncionarioDAO {
	private static Session session;
	public FuncionarioDAO(){}
	
	public void salvar(Funcionario transientInstance) {
		//log.debug("persisting Funcionario instance");
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
	
	private static final ArrayList<Funcionario> funcionarioLista = mapear();
	public static ArrayList<Funcionario> mapear() {
		ArrayList<Funcionario> tabela = new ArrayList<Funcionario>();
		
		List<Funcionario> lista = listar();
		for (Funcionario funcionario : lista) {
			tabela.add(funcionario);
		}
		
		return tabela;
	}
	
	public ArrayList<Funcionario> getFuncionarioLista () {
		return funcionarioLista;
	}
	
	public static List listar() {
		//log.debug("listing Funcionario instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			List results = session.createQuery("from Funcionario").list();
			session.getTransaction().commit();
			//log.debug("list successful, result size: "
			//		+ results.size());
			return results;
		} catch (RuntimeException re) {
			//log.error("list failed", re);
			throw re;
		}
	}
	
	public void altera(Funcionario detachedInstance) {
		//log.debug("updating Funcionario instance");
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
	
	public void remover(Funcionario persistentInstance) {
		//log.debug("deleting Funcionario instance");
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
