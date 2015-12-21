package com.finanest.annotations;

// Generated 09/12/2015 08:38:48 by Hibernate Tools 4.3.1

import java.util.Date;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Estoque generated by hbm2java
 */
@Entity
@Table(name = "ESTOQUE", catalog = "FinanEst")
@ManagedBean(name = "estoqueBean", eager=true)
@RequestScoped
public class Estoque implements java.io.Serializable {

	@ManagedProperty(value="#{idEstoque}")
	private Integer idEstoque;
	@ManagedProperty(value="#{tipo}")
	private String tipo;
	@ManagedProperty(value="#{insumo}")
	private String insumo;
	@ManagedProperty(value="#{preco}")
	private Float preco;
	@ManagedProperty(value="#{qtde}")
	private Integer qtde;
	@ManagedProperty(value="#{data}")
	private Date data;
	@ManagedProperty(value="#{idFornecedor}")
	private Integer idFornecedor;
	public Estoque() {
	}

	public Estoque(String tipo, String insumo, Float preco, Integer qtde,
			Date data, Integer idFornecedor) {
		this.tipo = tipo;
		this.insumo = insumo;
		this.preco = preco;
		this.qtde = qtde;
		this.data = data;
		this.idFornecedor = idFornecedor;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "idESTOQUE", unique = true, nullable = false)
	public Integer getIdEstoque() {
		return this.idEstoque;
	}

	public void setIdEstoque(Integer idEstoque) {
		this.idEstoque = idEstoque;
	}

	@Column(name = "TIPO", length = 20)
	public String getTipo() {
		return this.tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Column(name = "INSUMO", length = 30)
	public String getInsumo() {
		return this.insumo;
	}

	public void setInsumo(String insumo) {
		this.insumo = insumo;
	}

	@Column(name = "PRECO", precision = 12, scale = 0)
	public Float getPreco() {
		return this.preco;
	}

	public void setPreco(Float preco) {
		this.preco = preco;
	}

	@Column(name = "QTDE")
	public Integer getQtde() {
		return this.qtde;
	}

	public void setQtde(Integer qtde) {
		this.qtde = qtde;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DATA", length = 10)
	public Date getData() {
		return this.data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	@Column(name = "idFORNECEDOR")
	public Integer getIdFornecedor() {
		return this.idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Estoque [idEstoque=" + idEstoque + ", tipo=" + tipo
				+ ", insumo=" + insumo + ", preco=" + preco + ", qtde=" + qtde
				+ ", data=" + data + ", idFornecedor=" + idFornecedor
				+ "]";
	}

}
