package com.finanest.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
//import javax.faces.bean.RequestScoped;

import javax.faces.model.SelectItem;
import javax.faces.model.SelectItemGroup;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.finanest.Util.HibernateUtil;
import com.finanest.annotations.Contato;
import com.finanest.annotations.Estoque;
import com.finanest.annotations.Estoque;
import com.finanest.annotations.Fornecedor;
import com.finanest.annotations.Usuario;

@ManagedBean(name = "EstoqueDAO", eager = true)
@RequestScoped
public class EstoqueDAO {
	private static Session session;

	public EstoqueDAO() {
	}

	// Salvar
	public void salvar(Estoque transientInstance) {
		Estoque transientInstanceTmp = transientInstance;

		List<Estoque> listaItensEstoque = listar();
		Estoque item = buscarItemPorFornecedor(
				transientInstance.getIdFornecedor(),
				transientInstance.getInsumo());
		if (item == null) {
			if (transientInstanceTmp.getData() == null)
				transientInstanceTmp.setData(new Date());

			// log.debug("persisting Estoque instance");
			try {
				HibernateUtil.setUp();
				session = HibernateUtil.getSessionFactory().getCurrentSession();
				session.beginTransaction();
				session.save(transientInstanceTmp);
				session.getTransaction().commit();
				itemLista = mapear();
				//selecao = agrupar();
				// log.debug("persist successful");
			} catch (RuntimeException re) {
				// log.error("persist failed", re);
				throw re;
			}
		}
	}

	// Listar
	// ArrayList
	private static ArrayList<Estoque> itemLista = mapear();

	public static ArrayList<Estoque> mapear() {
		ArrayList<Estoque> tabela = new ArrayList<Estoque>();

		List<Estoque> lista = listar();
		for (Estoque item : lista) {
			tabela.add(item);
		}

		return tabela;
	}

	public ArrayList<Estoque> getEstoqueLista() {
		return itemLista;
	}

	// List
	public static List listar() {
		// log.debug("listing Estoque instances");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().openSession();
			session.beginTransaction();
			List results = session.createQuery("from Estoque").list();
			session.getTransaction().commit();
			// log.debug("list successful, result size: "
			// + results.size());
			return results;
		} catch (RuntimeException re) {
			// log.error("list failed", re);
			throw re;
		}
	}

	// Seleção
	public static List<SelectItem> selecao = agrupar();
	
	public static List<SelectItem> agrupar() {
		List<SelectItem> menu = new ArrayList<SelectItem>();

		List<Estoque> lista = listar();

		SelectItemGroup produtos = new SelectItemGroup("Produto");
		SelectItem itensProdutos[] = new SelectItem[lista.size()];
		int i = 0;
		int numProdutos = 0;
		for (Estoque item : lista) {
			if (item.getTipo().equalsIgnoreCase("Produto")) {
				String itemNome = item.getInsumo();
				itemNome += " (";
				// itemNome += item.getIdFornecedor();
				itemNome += (new FornecedorDAO()).buscarNomeFantasia(item
						.getIdFornecedor());
				itemNome += ") R$ ";
				itemNome += item.getPreco();
				itemNome += " (";
				itemNome += item.getQtde();
				itemNome += " em estoque)";

				itensProdutos[i] = new SelectItem(item.getIdEstoque(), itemNome);
				i++;
				numProdutos++;
			} else
				i++;
		}
		if (numProdutos > 0)
			produtos.setSelectItems(itensProdutos);
		else {
			SelectItem nenhumProduto[] = new SelectItem[1];
			nenhumProduto[0] = new SelectItem("", "Nenhum produto");
			produtos.setSelectItems(nenhumProduto);
		}
		menu.add(produtos);

		SelectItemGroup servicos = new SelectItemGroup("Serviço");
		SelectItem itensServicos[] = new SelectItem[lista.size()];
		i = 0;
		int numServicos = 0;
		for (Estoque item : lista) {
			if (item.getTipo().equalsIgnoreCase("Serviço")) {
				String itemNome = item.getInsumo();
				itemNome += " (";
				// itemNome += item.getIdFornecedor();
				itemNome += (new FornecedorDAO()).buscarNomeFantasia(item
						.getIdFornecedor());
				itemNome += ") R$ ";
				itemNome += item.getPreco();
				itemNome += " (";
				itemNome += item.getQtde();
				itemNome += " à disposição)";

				itensServicos[i] = new SelectItem(item.getIdEstoque(), itemNome);
				i++;
				numServicos++;
			} else
				i++;
		}
		if (numServicos > 0)
			servicos.setSelectItems(itensServicos);
		else {
			SelectItem nenhumServico[] = new SelectItem[1];
			nenhumServico[0] = new SelectItem("", "Nenhum serviço");
			servicos.setSelectItems(nenhumServico);
		}
		menu.add(servicos);

		return menu;
	}
	
	public List<SelectItem> getMenuLista() {
		try {
			return selecao;
		} catch (Exception e) {
			List<SelectItem> menu = new ArrayList<SelectItem>();
			SelectItem semItens = new SelectItem("", "Nada disponível");
			menu.add(semItens);
			
			return menu;
		}
	}

	// Busca
	public Estoque buscarItemPorFornecedor(Integer idFornecedor, String insumo) {
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			Estoque estoque = (Estoque) session.createCriteria(Estoque.class)
					.add(Restrictions.eq("idFornecedor", idFornecedor))
					.add(Restrictions.eq("insumo", insumo)).uniqueResult();
			session.getTransaction().commit();
			return estoque;
		} catch (RuntimeException re) {
			// log.error("get failed", re);
			throw re;
		}
	}

	public Estoque buscarItemPorIdEstoque(Integer idEstoque) {
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();

			Estoque item = (Estoque) session.createCriteria(Estoque.class)
					.add(Restrictions.idEq(idEstoque)).uniqueResult();

			session.getTransaction().commit();
			return item;
		} catch (RuntimeException re) {
			// log.error("get failed", re);
			throw re;
		}
	}

	public static ArrayList<Estoque> buscarItemPorTipo(String tipo) {
		ArrayList<Estoque> subtabela = new ArrayList<Estoque>();

		List<Estoque> lista = listar();
		for (Estoque item : lista) {
			if (item.getTipo().equalsIgnoreCase(tipo)) {
				subtabela.add(item);
			}
		}

		return subtabela;
	}

	// Alterar
	public void altera(Estoque detachedInstance) {
		// log.debug("updating Estoque instance");
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

	public void repor(Estoque detachedInstance) {
		(new CaixaDAO()).salvar(detachedInstance);

		Estoque detachedInstanceTmp = buscarItemPorIdEstoque(detachedInstance
				.getIdEstoque());
		detachedInstanceTmp
				.setData(detachedInstance.getData() == null ? new Date()
						: detachedInstance.getData());
		detachedInstanceTmp.setQtde(detachedInstanceTmp.getQtde()
				+ detachedInstance.getQtde());

		// log.debug("updating Estoque instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.update(detachedInstanceTmp);
			session.getTransaction().commit();
			itemLista = mapear();
			//selecao = agrupar();
			// log.debug("update successful");
		} catch (RuntimeException re) {
			// log.error("update failed", re);
			throw re;
		}
	}

	public void comprar(Estoque detachedInstance) {
		(new CaixaDAO()).salvarCompra(detachedInstance);

		Estoque detachedInstanceTmp = buscarItemPorIdEstoque(detachedInstance
				.getIdEstoque());
		detachedInstanceTmp
				.setData(detachedInstance.getData() == null ? new Date()
						: detachedInstance.getData());
		detachedInstanceTmp.setQtde(detachedInstanceTmp.getQtde()
				- detachedInstance.getQtde());

		// log.debug("updating Estoque instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.update(detachedInstanceTmp);
			session.getTransaction().commit();
			itemLista = mapear();
			//selecao = agrupar();
			// log.debug("update successful");
		} catch (RuntimeException re) {
			// log.error("update failed", re);
			throw re;
		}
	}

	// Remover
	public void remover(Estoque persistentInstance) {
		// log.debug("deleting Estoque instance");
		try {
			HibernateUtil.setUp();
			session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.beginTransaction();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			itemLista = mapear();
			//selecao = agrupar();
			// log.debug("delete successful");
		} catch (RuntimeException re) {
			// log.error("delete failed", re);
			throw re;
		}
	}
}
