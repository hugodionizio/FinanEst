package com.finanest.annotations;

// Generated 09/12/2015 08:38:48 by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Fornecedor generated by hbm2java
 */
@Entity
@Table(name = "FORNECEDOR", catalog = "FinanEst")
public class Fornecedor implements java.io.Serializable {

	private Integer idFornecedor;
	private String rzsocial;
	private String nmfantasia;
	private String cnpj;
	private String endereco;
	private String foneprn;
	private String fonesec;
	private String email;
	private String site;

	public Fornecedor() {
	}

	public Fornecedor(String rzsocial, String nmfantasia, String cnpj,
			String endereco, String foneprn, String fonesec, String email,
			String site) {
		this.rzsocial = rzsocial;
		this.nmfantasia = nmfantasia;
		this.cnpj = cnpj;
		this.endereco = endereco;
		this.foneprn = foneprn;
		this.fonesec = fonesec;
		this.email = email;
		this.site = site;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "idFORNECEDOR", unique = true, nullable = false)
	public Integer getIdFornecedor() {
		return this.idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	@Column(name = "RZSOCIAL", length = 20)
	public String getRzsocial() {
		return this.rzsocial;
	}

	public void setRzsocial(String rzsocial) {
		this.rzsocial = rzsocial;
	}

	@Column(name = "NMFANTASIA", length = 20)
	public String getNmfantasia() {
		return this.nmfantasia;
	}

	public void setNmfantasia(String nmfantasia) {
		this.nmfantasia = nmfantasia;
	}

	@Column(name = "CNPJ", length = 20)
	public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	@Column(name = "ENDERECO", length = 40)
	public String getEndereco() {
		return this.endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	@Column(name = "FONEPRN", length = 20)
	public String getFoneprn() {
		return this.foneprn;
	}

	public void setFoneprn(String foneprn) {
		this.foneprn = foneprn;
	}

	@Column(name = "FONESEC", length = 20)
	public String getFonesec() {
		return this.fonesec;
	}

	public void setFonesec(String fonesec) {
		this.fonesec = fonesec;
	}

	@Column(name = "EMAIL", length = 30)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "SITE", length = 30)
	public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Fornecedor [idFornecedor=" + idFornecedor + ", rzsocial="
				+ rzsocial + ", nmfantasia=" + nmfantasia + ", cnpj=" + cnpj
				+ ", endereco=" + endereco + ", foneprn=" + foneprn
				+ ", fonesec=" + fonesec + ", email=" + email + ", site="
				+ site + "]";
	}

}
