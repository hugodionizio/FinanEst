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
import com.finanest.annotations.Cliente;
import com.finanest.annotations.Cliente;

@ManagedBean(name = "ClienteDAO", eager = true)
@RequestScoped
public class ClienteDAO {
	private static Session session;

	public ClienteDAO() {
	}

	public void salvar(Cliente transientInstance) {
		// log.debug("persisting Cliente instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(transientInstance);
			session.getTransaction().commit();
			clienteLista = mapear();
			// log.debug("persist successful");
		} catch (RuntimeException re) {
			// log.error("persist failed", re);
			throw re;
		}
	}

	public static List listar() {
		// log.debug("listing Cliente instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			List results = session.createQuery("from Cliente").list();
			session.getTransaction().commit();
			// log.debug("list successful, result size: "
			// + results.size());
			return results;
		} catch (RuntimeException re) {
			// log.error("list failed", re);
			throw re;
		}
	}

	private static ArrayList<Cliente> clienteLista = mapear();
	public static ArrayList<Cliente> mapear() {
		ArrayList<Cliente> tabela = new ArrayList<Cliente>();
		
		List<Cliente> lista = listar();
		for (Cliente cliente : lista) {
			tabela.add(cliente);
		}
		
		return tabela;
	}
	
	public ArrayList<Cliente> getClienteLista () {
		return clienteLista;
	}

	public void altera(Cliente detachedInstance) {
		System.out.print(detachedInstance.toString());
		// log.debug("updating Cliente instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			session.update(detachedInstance);
			session.getTransaction().commit();
			clienteLista = mapear();
			// log.debug("update successful");
		} catch (RuntimeException re) {
			// log.error("update failed", re);
			throw re;
		}
	}

	public void remover(Cliente persistentInstance) {
		// log.debug("deleting Cliente instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			clienteLista = mapear();
			// log.debug("delete successful");
		} catch (RuntimeException re) {
			// log.error("delete failed", re);
			throw re;
		}
	}

	public String verificarLogin(String email, String senha) {
		/*
		 * Usuario usuario = new Usuario(); usuario.setEmail(email);
		 * usuario.setSenha(senha); System.out.println(usuario.toString());
		 */
		// log.debug("verifing Usuario instance with email: " + email +
		// " and senha: " + senha);
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();

			Cliente cliente = (Cliente) session.createCriteria(Cliente.class)

			// AQUI DIGO QUE DEVE TER O LOGIN IGUAL AO PASSADO POR PARAMETRO
					.add(Restrictions.eq("email", email))

					// AQUI DIGO QUE DEVE TER O SENHA IGUAL AO PASSADO POR
					// PARAMETRO
					.add(Restrictions.eq("senha", senha))

					// AQUI SETO PARA ME RETORNAR APENAS 1 RESULTADO
					// AFINAL LOGIN E SENHA É UNICO NO SISTEMA
					.uniqueResult();

			// Query query = session.createQuery(hql);
			// List result = query.list();
			if (cliente != null) {
				// user = cliente.getIdCliente();
				System.out.println("OK");
				clienteLista = mapear();
				return "Cliente/AreaCliente?login="
						+ cliente.getIdCliente().toString();
			} else {
				System.out.println("Erro...");
				return "";
			}
		} catch (RuntimeException re) {
			// log.error("get failed", re);
			throw re;
		}
	}

}
