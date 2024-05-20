-- Inserindo dados na tabela endereco
INSERT INTO endereco (tipo, logradouro, numero, cep, complemento, bairro, cidade, estado) VALUES
('Residencial', 'Rua das Flores', 123, '12345-678', 'Apto 101', 'Centro', 'Cidade A', 'UF'),
('Comercial', 'Avenida dos Estados', 456, '54321-876', 'Sala 201', 'Centro', 'Cidade B', 'UF');

-- Inserindo dados na tabela User
INSERT INTO User (nome, sobrenome, email, endereco_id, tipo_usuario) VALUES
('João', 'Silva', 'joao@example.com', 1, 1),
('Maria', 'Santos', 'maria@example.com', 2, 0);

-- Inserindo dados na tabela animal
INSERT INTO animal (nome, especie, status_castracao, bairro_localizacao, id_usuario, disp_adocao, id_saude, id_vacina) VALUES
('Rex', 'Cachorro', 0, 'Centro', NULL, 1, NULL, NULL),
('Mimi', 'Gato', 1, 'Bairro A', 1, 1, NULL, NULL);

-- Inserindo dados na tabela clinica_parceira
INSERT INTO clinica_parceira (nome, CMRV, telefone, User_id, endereco_id) VALUES
('Clínica Veterinária A', '1234-CRMV', '123456789', 1, 1),
('Clínica Veterinária B', '5678-CRMV', '987654321', 1, 2);

-- Inserindo dados na tabela status_saude
INSERT INTO status_saude (data_atualizacao, observacoes, vermifugo, antiparasitario, User_id, animal_id) VALUES
('2024-05-16', 'Exames realizados.', 1, 0, 1, 1),
('2024-05-15', 'Vermifugado recentemente.', 1, 1, 1, 2);

-- Inserindo dados na tabela status_vacinal
INSERT INTO status_vacinal (data_atualizacao, tipo_vacina, satatus_vacinalcol, User_idUser, animal_id1) VALUES
('2024-05-14', 'V8', 'Vacinação completa', 1, 1),
('2024-05-14', 'V4', 'Falta a última dose', 1, 2);

-- Inserindo dados na tabela user_has_animal
INSERT INTO user_has_animal (animal_id, User_id) VALUES
(1, 1),
(2, 2);

-- Inserindo dados na tabela clinica_parceira_has_animal
INSERT INTO clinica_parceira_has_animal (animal_id, clinica_parceira_id) VALUES
(1, 1),
(2, 2);