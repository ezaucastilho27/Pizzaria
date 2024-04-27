-- Criar a tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    telefone VARCHAR(15),
    endereco VARCHAR(100)
);

-- Criar a tabela Pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status ENUM('Pendente', 'Em preparo', 'Pronto', 'Entregue') DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Criar a tabela Pizzas
CREATE TABLE Pizzas (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    sabor VARCHAR(50),
    preco DECIMAL(8, 2)
);

-- Criar a tabela Ingredientes (caso não exista)
CREATE TABLE IF NOT EXISTS Ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Criar a tabela Pizza_Ingredientes
CREATE TABLE Pizza_Ingredientes (
    pizza_id INT,
    ingrediente_id INT,
    FOREIGN KEY (pizza_id) REFERENCES Pizzas(id_pizza),
    FOREIGN KEY (ingrediente_id) REFERENCES Ingredientes(id_ingrediente),
    PRIMARY KEY (pizza_id, ingrediente_id)
);

-- Inserir clientes
INSERT INTO Clientes (nome, telefone, endereco)
VALUES 
('Ezau Felipe', '81-999012301', 'Rua bacuri 1213'),
('Wesley William', '81-999012801', 'Rua apipucos 13'),
('Ycaro Felipe', '81-99123801', 'Rua visconde suassuna 73'),
('Wanderson Matheus', '81-9514801', 'Rua mandacaru 12'),
('Taciana Ferreira', '81-992134134', 'Dois unidos 412');
SELECT * FROM Clientes;
-- Inserir pizzas
INSERT INTO Pizzas (sabor, preco)
VALUES 
('Rocombole', 25.00),
('Calabresa', 27.99),
('Frango', 30.00),
('Bacon', 35.00),
('Frabacon', 40.00);

-- Mostrar todas as pizzas
SELECT * FROM Pizzas;

INSERT INTO Ingredientes (nome)
VALUES 
('Tomate'),
('Cebola'),
('Azeitona'),
('Mussarela'),
('Frango');
SELECT * FROM Ingredientes;

INSERT INTO Pizza_Ingredientes (pizza_id, ingrediente_id)
VALUES (1, 2);
SELECT * FROM Pizza_Ingredientes;