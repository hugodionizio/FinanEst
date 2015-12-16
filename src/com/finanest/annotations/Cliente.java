package com.finanest.annotations;

// Generated 09/12/2015 08:38:48 by Hibernate Tools 4.3.1

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Cliente generated by hbm2java
 */
@Entity
@Table(name = "CLIENTE", catalog = "FinanEst")
@ManagedBean(name = "clienteBean", eager=true)
@RequestScoped
public class Cliente implements java.io.Serializable {

	@ManagedProperty(value="#{idCliente}")
	private Integer idCliente;
	@ManagedProperty(value="#{nome}")
	private String nome;
	@ManagedProperty(value="#{cpf}")
	private String cpf;
	@ManagedProperty(value="#{senha}")
	private String senha;
	@ManagedProperty(value="#{endereco}")
	private String endereco;
	@ManagedProperty(value="#{foneprn}")
	private String foneprn;
	@ManagedProperty(value="#{fonesec}")
	private String fonesec;
	@ManagedProperty(value="#{email}")
	private String email;

	public Cliente() {
	}

	public Cliente(String nome, String cpf, String senha, String endereco,
			String foneprn, String fonesec, String email) {
		this.nome = nome;
		this.cpf = cpf;
		this.senha = senha;
		this.endereco = endereco;
		this.foneprn = foneprn;
		this.fonesec = fonesec;
		this.email = email;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "idCLIENTE", unique = true, nullable = false)
	public Integer getIdCliente() {
		return this.idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	@Column(name = "NOME", length = 20)
	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(name = "CPF", length = 20)
	public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Column(name = "SENHA", length = 20)
	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", nome=" + nome + ", cpf="
				+ cpf + ", senha=" + senha + ", endereco=" + endereco
				+ ", foneprn=" + foneprn + ", fonesec=" + fonesec + ", email="
				+ email + "]";
	}

}
