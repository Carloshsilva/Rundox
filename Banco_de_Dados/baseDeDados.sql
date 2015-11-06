CREATE TABLE Endereco (
  cep INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  logradouro VARCHAR NOT NULL,
  numero INTEGER UNSIGNED NOT NULL,
  complemento VARCHAR NULL,
  bairro VARCHAR NOT NULL,
  cidade VARCHAR NOT NULL,
  estado VARCHAR NOT NULL,
  PRIMARY KEY(cep)
);

CREATE TABLE Credencial (
  usuario VARCHAR NOT NULL,
  senha VARCHAR NOT NULL,
  PRIMARY KEY(usuario)
);

CREATE TABLE Categoria (
  id VARCHAR NOT NULL AUTO_INCREMENT,
  nome VARCHAR NOT NULL,
  descricao VARCHAR NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Usuario (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cep INTEGER UNSIGNED NOT NULL,
  usuario VARCHAR NOT NULL,
  nome VARCHAR NOT NULL,
  sobrenome VARCHAR NOT NULL,
  dataNascimento INTEGER UNSIGNED NOT NULL,
  email VARCHAR NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario)
    REFERENCES Credencial(usuario),
  FOREIGN KEY(cep)
    REFERENCES Endereco(cep)
);

CREATE TABLE Topico (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  topico_pai INTEGER UNSIGNED NOT NULL,
  categoria VARCHAR NOT NULL,
  usuario INTEGER UNSIGNED NOT NULL,
  titulo VARCHAR NOT NULL,
  descricao VARCHAR NOT NULL,
  link_video VARCHAR NOT NULL,
  data_criacao TIMESTAMP NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario)
    REFERENCES Usuario(id),
  FOREIGN KEY(categoria)
    REFERENCES Categoria(id),
  FOREIGN KEY(topico_pai)
    REFERENCES Topico(id)
);


