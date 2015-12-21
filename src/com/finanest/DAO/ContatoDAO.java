package com.finanest.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;

import javax.faces.bean.ManagedProperty;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Contato;

@ManagedBean(name = "ContatoDAO", eager = true)
@RequestScoped
public class ContatoDAO {
	private static Session session;

	public ContatoDAO() {
	}

	Integer idContato;
	String nome;
	String email;
	String instituicao;
	String assunto;
	String mensagem;
	Date data;

	public void salvar(Contato transientInstance) {
		Contato transientInstanceTmp = transientInstance;
		if (transientInstanceTmp.getData() == null)
			transientInstanceTmp.setData(new Date());

		// log.debug("persisting Contato instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(transientInstanceTmp);
			session.getTransaction().commit();
			// log.debug("persist successful");
		} catch (RuntimeException re) {
			// log.error("persist failed", re);
			throw re;
		}
	}

	public ArrayList<Contato> getContatoLista() {
		ArrayList<Contato> tabela = new ArrayList<Contato>();

		List<Contato> lista = listar();
		for (Contato contato : lista) {
			tabela.add(contato);
		}

		return tabela;
	}

	public static List listar() {
		// log.debug("listing Contato instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List results = session.createQuery("from Contato").list();
			session.getTransaction().commit();
			// log.debug("list successful, result size: "
			// + results.size());
			return results;
		} catch (RuntimeException re) {
			// log.error("list failed", re);
			throw re;
		}
	}

	public List<Contato> getLista() {
		return (List<Contato>) listar();
	}

	List<String> columns = new ArrayList<String>();
	List<List<String>> dados = new ArrayList<List<String>>();

	public void setData() {
		this.columns.add("Registro");
		this.columns.add("Nome");
		this.columns.add("E-mail");
		this.columns.add("Instituição");
		this.columns.add("Assunto");
		this.columns.add("Mensagem");
		this.columns.add("Data");
		this.columns.add("Ação");

		@SuppressWarnings("unchecked")
		List<Contato> listaContatos = (new ContatoDAO()).listar();
		for (Contato contato : listaContatos) {
			List<String> tuple = new ArrayList<String>();
			tuple.add(contato.getIdContato().toString());
			tuple.add(contato.getNome());
			tuple.add(contato.getEmail());
			tuple.add(contato.getInstituicao());
			tuple.add(contato.getAssunto());
			tuple.add(contato.getMensagem());
			tuple.add(contato.getData().toString());
			tuple.add(contato.getIdContato().toString());
			this.dados.add(tuple);
		}
	}

	public List<String> getListHeader() {
		return this.columns;
	}

	public List<List<String>> getListData() {
		return this.dados;
	}

	public void altera(Contato detachedInstance) {
		// log.debug("updating Contato instance");
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

	public void remover(Contato persistentInstance) {
		// log.debug("deleting Contato instance");
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

	public static class ContatoInt extends Contato {

	}
}
