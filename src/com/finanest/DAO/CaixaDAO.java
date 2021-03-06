package com.finanest.DAO;

import java.util.ArrayList;
import java.util.Date;
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
import com.finanest.annotations.Contato;
import com.finanest.annotations.Estoque;
import com.finanest.annotations.Fornecedor;

@ManagedBean(name = "CaixaDAO", eager = true)
@RequestScoped
public class CaixaDAO {
	private static Session session;

	public CaixaDAO() {
	}

	public void salvar(Caixa transientInstance) {
		// log.debug("persisting Caixa instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.save(transientInstance);
			session.getTransaction().commit();
			itemLista = mapear();
			// log.debug("persist successful");
		} catch (RuntimeException re) {
			// log.error("persist failed", re);
			throw re;
		}
	}

	public void salvar(Estoque transientInstance) {
		Estoque transientInstanceTmp = (new EstoqueDAO())
				.buscarItemPorIdEstoque(transientInstance.getIdEstoque());

		Double saida = transientInstanceTmp.getPreco().doubleValue()
				* transientInstance.getQtde().doubleValue();

		Caixa caixa = new Caixa(
				transientInstance.getData() == null ? new Date()
						: transientInstance.getData(), 0.0, saida,
				transientInstanceTmp.getIdFornecedor(),
				(int) transientInstance.getQtde(),
				transientInstanceTmp.getTipo(),
				(int) transientInstance.getIdEstoque());

		String historico = "(" + transientInstance.getQtde() + ") "
				+ transientInstanceTmp.getInsumo();
		caixa.setHistorico(historico);

		String complemento = (new FornecedorDAO())
				.buscarNomeFantasia(transientInstanceTmp.getIdFornecedor());
		caixa.setComplemento(complemento);

		List<Caixa> listaItens = listar();
		if ((listaItens.size() - 1) >= 0) {
			Double saldo = listaItens.get(listaItens.size() - 1).getSaldo();
			caixa.setSaldo(saldo - saida);
		} else
			caixa.setSaldo(0 - saida);

		salvar(caixa);
	}

	public void salvarCompra(Estoque transientInstance) {
		Estoque transientInstanceTmp = (new EstoqueDAO())
				.buscarItemPorIdEstoque(transientInstance.getIdEstoque());

		Double entrada = transientInstanceTmp.getPreco().doubleValue()
				* transientInstance.getQtde().doubleValue();

		Caixa caixa = new Caixa(
				transientInstance.getData() == null ? new Date()
						: transientInstance.getData(), entrada, 0.0,
				transientInstanceTmp.getIdFornecedor(),
				(int) transientInstance.getQtde(),
				transientInstanceTmp.getTipo(),
				(int) transientInstance.getIdEstoque());

		String historico = "(" + transientInstance.getQtde() + ") "
				+ transientInstanceTmp.getInsumo();
		caixa.setHistorico(historico);

		String complemento = "Cliente";
		caixa.setComplemento(complemento);

		List<Caixa> listaItens = listar();
		if ((listaItens.size() - 1) >= 0) {
			Double saldo = listaItens.get(listaItens.size() - 1).getSaldo();
			caixa.setSaldo(saldo + entrada);
		} else
			caixa.setSaldo(0 + entrada);

		salvar(caixa);
	}

	private static ArrayList<Caixa> itemLista = mapear();

	public static ArrayList<Caixa> mapear() {
		ArrayList<Caixa> tabela = new ArrayList<Caixa>();

		List<Caixa> lista = listar();
		for (Caixa item : lista) {
			tabela.add(item);
		}

		return tabela;
	}

	public ArrayList<Caixa> getCaixaLista() {
		return itemLista;
	}

	public static List listar() {
		// log.debug("listing Caixa instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			List results = session.createQuery("from Caixa").list();
			session.getTransaction().commit();
			// log.debug("list successful, result size: "
			// + results.size());
			return results;
		} catch (RuntimeException re) {
			// log.error("list failed", re);
			throw re;
		}
	}

	public void altera(Caixa detachedInstance) {
		// log.debug("updating Caixa instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.update(detachedInstance);
			session.getTransaction().commit();
			itemLista = mapear();
			// log.debug("update successful");
		} catch (RuntimeException re) {
			// log.error("update failed", re);
			throw re;
		}
	}

	public void remover(Caixa persistentInstance) {
		// log.debug("deleting Caixa instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			itemLista = mapear();
			// log.debug("delete successful");
		} catch (RuntimeException re) {
			// log.error("delete failed", re);
			throw re;
		}
	}
}
