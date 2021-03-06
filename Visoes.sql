CREATE TABLE ENTRADA(
	idENTRADA INT NOT NULL
	AUTO_INCREMENT,
	SALARIO FLOAT,
	idFUNCIONARIO REFERENCES FUNCIONARIO(idFUNCIONARIO),
	DATAPGTO DATE,
	PRIMARY KEY(idENTRADA)
)AUTO_INCREMENT=1;

CREATE TABLE SAIDA(
	idFOLHAPGTO INT NOT NULL
	AUTO_INCREMENT,
	SALARIO FLOAT,
	idFUNCIONARIO REFERENCES FUNCIONARIO(idFUNCIONARIO),
	DATAPGTO DATE,
	PRIMARY KEY(idFOLHAPGTO)
)AUTO_INCREMENT=1;

CREATE TABLE FOLHAPGTO(
	idFOLHAPGTO INT NOT NULL
	AUTO_INCREMENT,
	SALARIO FLOAT,
	idFUNCIONARIO REFERENCES FUNCIONARIO(idFUNCIONARIO),
	DATAPGTO DATE,
	PRIMARY KEY(idFOLHAPGTO)
)AUTO_INCREMENT=1;