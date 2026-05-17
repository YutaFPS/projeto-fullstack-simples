CREATE DATABASE IF NOT EXISTS falafloripafeito;

USE falafloripafeito;

CREATE TABLE bairros (
    id_bairro INT NOT NULL AUTO_INCREMENT,
    nome_bairro VARCHAR(100) NOT NULL,
    regiao VARCHAR(50) NOT NULL,

    PRIMARY KEY (id_bairro),

    UNIQUE KEY uq_bairros_nome_regiao (
    nome_bairro,
    regiao
)
);

CREATE TABLE usuarios (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    foto LONGBLOB DEFAULT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    bairro_id INT DEFAULT NULL,

    PRIMARY KEY (id),

    UNIQUE KEY uq_usuarios_email (email),

    KEY idx_usuarios_bairro (bairro_id),

    CONSTRAINT fk_usuarios_bairros
        FOREIGN KEY (bairro_id)
        REFERENCES bairros(id_bairro)
        ON DELETE SET NULL

);

CREATE TABLE publicacoes (
    id_publicacao INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    info_A TEXT NOT NULL,
    info_B TEXT NOT NULL,
    info_C TEXT NOT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    bairro_id INT DEFAULT NULL,

    PRIMARY KEY (id_publicacao),

    KEY idx_publicacoes_usuario (usuario_id),
    KEY idx_publicacoes_bairro (bairro_id),
    KEY idx_publicacoes_data_hora (data_hora),

    CONSTRAINT fk_publicacoes_usuarios
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_publicacoes_bairros
        FOREIGN KEY (bairro_id)
        REFERENCES bairros(id_bairro)
        ON DELETE SET NULL

);

CREATE TABLE comentarios (
    id_comentario INT NOT NULL AUTO_INCREMENT,
    conteudo TEXT NOT NULL,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    publicacao_id INT NOT NULL,
    usuario_id INT NOT NULL,

    PRIMARY KEY (id_comentario),

    KEY idx_comentarios_publicacao (publicacao_id),
    KEY idx_comentarios_usuario (usuario_id),

    KEY idx_comentarios_publicacao_data (
        publicacao_id,
        data_hora
    ),

    CONSTRAINT fk_comentarios_publicacoes
        FOREIGN KEY (publicacao_id)
        REFERENCES publicacoes(id_publicacao)
        ON DELETE CASCADE,

    CONSTRAINT fk_comentarios_usuarios
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE

);

CREATE TABLE curtidas (
    id_curtida INT NOT NULL AUTO_INCREMENT,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT NOT NULL,
    publicacao_id INT NOT NULL,

    PRIMARY KEY (id_curtida),

    UNIQUE KEY uq_curtidas_usuario_publicacao (
        usuario_id,
        publicacao_id
    ),

    KEY idx_curtidas_usuario (usuario_id),
    KEY idx_curtidas_publicacao (publicacao_id),

    CONSTRAINT fk_curtidas_usuarios
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_curtidas_publicacoes
        FOREIGN KEY (publicacao_id)
        REFERENCES publicacoes(id_publicacao)
        ON DELETE CASCADE

);

INSERT INTO bairros (nome_bairro, regiao) VALUES
('Canasvieiras', 'norte'),
('Ingleses', 'norte'),
('Campeche', 'sul'),
('Tapera', 'sul'),
('Lagoa da Conceição', 'leste'),
('Barra da Lagoa', 'leste'),
('Centro Floripa', 'centro'),
('Trindade', 'centro'),
('Coqueiros', 'oeste_continente'),
('Estreito', 'oeste_continente');

INSERT INTO usuarios (id, nome, email, senha, foto, data_hora, bairro_id) VALUES
(1, 'Prof. Santusuariosusuariosiago', 'professorsantiago@senai.com', 12345, 'profsant.png', '2026-05-04 13:45:01', 7),
(2, 'Prof. Wygor', 'professorwygor@senai.com', 12345, 'profwygor.png', '2026-05-04 13:45:01', 8),
(3, 'Prof. Luan', 'professorluan@senai.com', 12345, 'profluan.png', '2026-05-04 13:45:01', 1);

INSERT INTO publicacoes (id_publicacao, titulo, info_A, info_B, info_C, data_hora, usuario_id, bairro_id) VALUES
(1, 'nome tipo A', 'aaa', '111', '0,01', '2026-05-04 13:45:01', 1, 7),
(2, 'nome tipo B', 'bbb', '222', '0,02', '2026-05-04 13:45:01', 2, 8),
(3, 'nome tipo C', 'ccc', '333', '0,03', '2026-05-04 13:45:01', 3, 1);

/*SELECTS*/

SELECT * FROM usuarios;
SELECT * FROM bairros;
SELECT * FROM publicacoes;