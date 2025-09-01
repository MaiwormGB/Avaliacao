create database revenda_maiworm;

create table login(
	id_login serial primary key,
	nome varchar(30) not null unique,
	senha varchar(20) not null unique,
	email varchar(60) not null,
	telefone char(13) not null,
	id_endereco int references endereco(id_endereco) not null
	CHECK (LENGTH(senha) > 8) 

);

create table endereco(
	id_endereco serial primary key,
	cep char(8) not null,
	rua varchar(50) not null,
	bairro varchar(50) not null,
	cidade varchar(50) not null,
	referencia text 

);

create table produto(
	id_produto serial primary key,
	nome varchar(30) not null,
	preco numeric(6,2) not null,
	imagem bytea,
	descricao text not null,
	id_login int references login(id_login) not null

);

create table inventario(
	id_produto int references produto(id_produto) not null,
	estoque int not null

);

create table avaliacao(
	id_produto int references produto(id_produto) not null,
	id_login int references login(id_login) not null,
	avaliacao int not null

);

create table compra(
	id_compra serial primary key,
	id_login int references login(id_login) not null,
	id_produto int references produto(id_produto) not null,
	pagamento varchar(30) not null,
	valor_total numeric(6,2) not null,
	promocao bool not null
	
);

alter table login 
add column idade int;

-- INSERTS PARA TABELA ENDEREÇO
INSERT INTO endereco (cep, rua, bairro, cidade, referencia) VALUES 
('01001000', 'Praça da Sé', 'Sé', 'São Paulo', 'Lado ímpar'),
('20040000', 'Rua Primeiro de Março', 'Centro', 'Rio de Janeiro', 'Próximo ao CCBB'),
('30130005', 'Avenida Amazonas', 'Centro', 'Belo Horizonte', 'Edifício Maletta'),
('40010010', 'Rua Chile', 'Comércio', 'Salvador', 'Centro Histórico'),
('50010000', 'Rua do Bom Jesus', 'Recife Antigo', 'Recife', 'Marco Zero'),
('60010000', 'Rua Major Facundo', 'Centro', 'Fortaleza', 'Próximo à Praça do Ferreira'),
('70040900', 'Eixo Monumental', 'Asa Norte', 'Brasília', 'Setor Cultural'),
('80010000', 'Rua das Flores', 'Centro', 'Curitiba', 'Calçadão'),
('90010000', 'Rua dos Andradas', 'Centro Histórico', 'Porto Alegre', 'Mercado Público'),
('88010000', 'Rua Felipe Schmidt', 'Centro', 'Florianópolis', 'Próximo à Catedral');

-- INSERTS PARA TABELA LOGIN
INSERT INTO login (nome, senha, email, telefone, id_endereco) VALUES 
('joao_silva', 'senha123456', 'joao.silva@email.com', '11999990001', 12),
('maria_santos', 'mariA123456@', 'maria.santos@email.com', '21999990002', 23),
('pedro_oliveira', 'pedroOliveira1', 'pedro.oliveira@email.com', '31999990003', 32),
('ana_costa', 'anaCosta789!', 'ana.costa@email.com', '71999990004', 46),
('carlos_pereira', 'carlosP@123', 'carlos.pereira@email.com', '81999990005', 51),
('juliana_lima', 'julianaLima99', 'juliana.lima@email.com', '85999990006', 36),
('rafael_martins', 'rafaMartins#1', 'rafael.martins@email.com', '61999990007', 17),
('fernanda_alves', 'ferAlves2023!', 'fernanda.alves@email.com', '41999990008', 81),
('bruno_rocha', 'brunoRocha123', 'bruno.rocha@email.com', '51999990009', 39),
('camila_ribeiro', 'camilaRibeiro!', 'camila.ribeiro@email.com', '48999990010', 101);

-- INSERTS PARA TABELA PRODUTO
INSERT INTO produto (nome, preco, descricao, id_login) VALUES 
('Smartphone Galaxy S23', 2999.99, 'Smartphone Android com 128GB, 8GB RAM, câmera tripla', 1),
('Notebook Dell Inspiron', 3599.90, 'Notebook 15.6", Intel i5, 8GB RAM, SSD 256GB', 2),
('Fone Bluetooth Sony', 499.90, 'Fone sem fio com cancelamento de ruído ativo', 3),
('Smart TV 55" 4K', 2199.00, 'TV LED 4K UHD com HDR e Smart TV', 4),
('Tablet Samsung Tab S8', 1899.99, 'Tablet Android com S Pen, 128GB, 8GB RAM', 5),
('Mouse Gamer RGB', 199.90, 'Mouse óptico com iluminação RGB, 6400 DPI', 6),
('Teclado Mecânico', 349.90, 'Teclado mecânico switches blue, retroiluminação', 7),
('Monitor 27" Gaming', 1299.00, 'Monitor 144Hz, 1ms, FreeSync, 1080p', 8),
('Câmera DSLR Canon', 2899.90, 'Câmera digital 24.2MP com lente 18-55mm', 9),
('Console PlayStation 5', 4499.99, 'Console de videogame com controle DualSense', 10);

-- INSERTS PARA TABELA INVENTARIO
INSERT INTO inventario (id_produto, estoque) VALUES 
(1, 15), (2, 8), (3, 25), (4, 12), (5, 18),
(6, 30), (7, 22), (8, 10), (9, 7), (10, 5);

-- INSERTS PARA TABELA AVALIACAO
INSERT INTO avaliacao (id_produto, id_login, avaliacao) VALUES 
(1, 2, 5), (1, 3, 4), (1, 4, 5),
(2, 1, 4), (2, 5, 5), (2, 6, 3),
(3, 7, 5), (3, 8, 4), (3, 9, 5),
(4, 10, 4), (4, 1, 5), (4, 2, 4),
(5, 3, 5), (5, 4, 3), (5, 5, 4),
(6, 6, 5), (6, 7, 4), (6, 8, 5),
(7, 9, 3), (7, 10, 4), (7, 1, 5),
(8, 2, 4), (8, 3, 5), (8, 4, 4),
(9, 5, 5), (9, 6, 4), (9, 7, 3),
(10, 8, 5), (10, 9, 4), (10, 10, 5);

-- INSERTS PARA TABELA COMPRA
INSERT INTO compra (id_login, id_produto, pagamento, valor_total, promocao) VALUES 
(1, 2, 'Cartão de Crédito', 3599.90, false),
(2, 3, 'PIX', 449.91, true),
(3, 4, 'Boleto Bancário', 2199.00, false),
(4, 5, 'Cartão de Débito', 1709.99, true),
(5, 6, 'PIX', 199.90, false),
(6, 7, 'Cartão de Crédito', 314.91, true),
(7, 8, 'Boleto Bancário', 1299.00, false),
(8, 9, 'PIX', 2609.91, true),
(9, 10, 'Cartão de Crédito', 4049.99, true),
(10, 1, 'Cartão de Débito', 2999.99, false);

create view maior_de_idade as
select id_login, nome, idade
from login l
where idade > 18;



create view em_estoque as
select id_produto, nome, estoque
from produto, inventario
where estoque < 1;


select * from maior_de_idade;

select * from em_estoque;




