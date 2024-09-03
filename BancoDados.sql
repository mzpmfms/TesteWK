-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando dados para a tabela wk.clientes: ~20 rows (aproximadamente)
INSERT IGNORE INTO `clientes` (`codigo`, `nome`, `cidade`, `UF`) VALUES
	(1, 'João da Silva', 'São Paulo', 'SP'),
	(2, 'Maria Oliveira', 'Rio de Janeiro', 'RJ'),
	(3, 'Carlos Souza', 'Belo Horizonte', 'MG'),
	(4, 'Ana Costa', 'Curitiba', 'PR'),
	(5, 'Pedro Santos', 'Porto Alegre', 'RS'),
	(6, 'Lucas Pereira', 'Recife', 'PE'),
	(7, 'Julia Mendes', 'Salvador', 'BA'),
	(8, 'Fernando Lima', 'Fortaleza', 'CE'),
	(9, 'Mariana Carvalho', 'Brasília', 'DF'),
	(10, 'Rafael Almeida', 'Manaus', 'AM'),
	(11, 'Bruno Rodrigues', 'Goiânia', 'GO'),
	(12, 'Carla Fernandes', 'Belém', 'PA'),
	(13, 'Eduardo Azevedo', 'Vitória', 'ES'),
	(14, 'Amanda Ribeiro', 'Florianópolis', 'SC'),
	(15, 'Gustavo Martins', 'Natal', 'RN'),
	(16, 'Isabela Ferreira', 'João Pessoa', 'PB'),
	(17, 'Felipe Gomes', 'Maceió', 'AL'),
	(18, 'Camila Rocha', 'Aracaju', 'SE'),
	(19, 'Rodrigo Monteiro', 'Cuiabá', 'MT'),
	(20, 'Patrícia Nunes', 'Campo Grande', 'MS');

-- Copiando dados para a tabela wk.pedido: ~0 rows (aproximadamente)

-- Copiando dados para a tabela wk.pedidos_produtos: ~1 rows (aproximadamente)
INSERT IGNORE INTO `pedidos_produtos` (`id`, `numero_pedido`, `codigo_produto`, `quantidade`, `valor_unitario`, `valor_total`) VALUES
	(2, 1, 2, 1, 3499.00, 3499.00);

-- Copiando dados para a tabela wk.produtos: ~20 rows (aproximadamente)
INSERT IGNORE INTO `produtos` (`codigo`, `descricao`, `preco_venda`) VALUES
	(1, 'Smartphone XYZ', 1999.90),
	(2, 'Notebook Alpha', 3499.00),
	(3, 'Televisão Ultra HD 50"', 2799.99),
	(4, 'Geladeira Frost Free', 2399.00),
	(5, 'Máquina de Lavar 12kg', 1599.90),
	(6, 'Micro-ondas 30L', 499.99),
	(7, 'Cafeteira Elétrica', 199.90),
	(8, 'Aspirador de Pó', 349.90),
	(9, 'Ventilador Turbo', 129.90),
	(10, 'Fogão 4 Bocas', 899.00),
	(11, 'Liquidificador Power', 149.90),
	(12, 'Câmera Digital 20MP', 999.90),
	(13, 'Fone de Ouvido Bluetooth', 249.90),
	(14, 'Relógio Smartwatch', 499.90),
	(15, 'Impressora Multifuncional', 699.90),
	(16, 'Monitor LED 24"', 799.90),
	(17, 'Teclado Mecânico', 399.90),
	(18, 'Mouse Gamer', 249.90),
	(19, 'SSD 1TB', 499.90),
	(20, 'Caixa de Som Bluetooth', 349.90);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
