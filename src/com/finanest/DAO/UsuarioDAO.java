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
import com.finanest.annotations.Usuario;
import com.finanest.annotations.Usuario;

@ManagedBean(name = "UsuarioDAO", eager = true)
@RequestScoped
public class UsuarioDAO {
	private static Session session;

	public UsuarioDAO() {
	}

	public void salvar(Usuario transientInstance) {
		// log.debug("persisting Usuario instance");
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

	public ArrayList<Usuario> getUsuarioLista() {
		ArrayList<Usuario> tabela = new ArrayList<Usuario>();

		List<Usuario> lista = listar();
		for (Usuario usuario : lista) {
			tabela.add(usuario);
		}

		return tabela;
	}

	public static List listar() {
		// log.debug("listing Usuario instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			List results = session.createQuery("from Usuario").list();
			session.getTransaction().commit();
			// log.debug("list successful, result size: "
			// + results.size());
			return results;
		} catch (RuntimeException re) {
			// log.error("list failed", re);
			throw re;
		}
	}

	public void altera(Usuario detachedInstance) {
		// log.debug("updating Usuario instance");
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

	public void remover(Usuario persistentInstance) {
		// log.debug("deleting Usuario instance");
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

	public String verificarLogin(String email, String senha) {
		/*
		 * Usuario usuario = new Usuario(); usuario.setEmail(email);
		 * usuario.setSenha(senha); System.out.println(usuario.toString());
		 */
		// log.debug("verifing Usuario instance with email: " + email +
		// " and senha: " + senha);
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			Usuario usuario = (Usuario) session.createCriteria(Usuario.class)

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
			if (usuario != null) {
				System.out.println("OK");
				return "Administrador/AreaAdmin";
			} else {
				System.out.println("Erro...");
				return "";
			}
		} catch (RuntimeException re) {
			// log.error("get failed", re);
			throw re;
		}
	}

	public String trash_verificarLogin(String email, String senha) {
		if (email.equalsIgnoreCase("root") && senha.equalsIgnoreCase("ufersa")) {
			System.out.println("OK");
			return "Administrador/AreaAdmin";
		} else {
			System.out.println("Erro...");
			return "";
		}
	}

	public void intermediar(String email, String senha) {
		System.out.println("Seu e-mail é: " + email + " e a senha: " + senha);
	}

	public String contactar() {
		return "Contato";
	}
}
