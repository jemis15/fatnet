-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Fev-2020 às 20:16
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fastnet`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `documento` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `celular` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `preferencia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `user_creador` int(11) NOT NULL,
  `user_modificado` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `tipo`, `documento`, `celular`, `correo`, `preferencia`, `user_creador`, `user_modificado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'flores meza james', 'persona', '71118137', '931932916', 'floresmezajames1999@outlook.com', 'las visitas por las mañanas nomas', 1, 1, '2020-02-20 00:00:00', '2020-02-20 16:23:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `referencia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_contrato` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `router_user` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `router_pass` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `user_creador` int(11) NOT NULL,
  `user_modificado` int(11) NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Extraindo dados da tabela `contratos`
--

INSERT INTO `contratos` (`id`, `plan_id`, `cliente_id`, `fecha_inicio`, `direccion`, `referencia`, `tipo_contrato`, `ip`, `router_user`, `router_pass`, `user_creador`, `user_modificado`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2020-02-20', 'Av marginal', 'tienda selva andina', 'HOGAR', '192.168.1.10', 'ADMIN', '123456', 1, 1, 'ok', '2020-02-20 00:00:00', '2020-02-20 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `planes`
--

CREATE TABLE `planes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `subida` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `bajada` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Extraindo dados da tabela `planes`
--

INSERT INTO `planes` (`id`, `nombre`, `subida`, `bajada`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Basico', '5', '2', '2020-02-20 00:00:00', '2020-02-20 00:00:00', '0000-00-00 00:00:00'),
(2, 'Premium', '10', '4', '2020-02-20 00:00:00', '2020-02-20 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `contrato` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `direccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `referencia` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_servicio` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `motivo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `motivo_descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `comentario_tecnico` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Extraindo dados da tabela `tickets`
--

INSERT INTO `tickets` (`id`, `cliente_id`, `contrato`, `fecha_inicio`, `direccion`, `referencia`, `tipo_servicio`, `motivo`, `motivo_descripcion`, `comentario_tecnico`, `estado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2020-02-20', 'Av. micaela vastidas', 'colegio sandaniel', 'alta', 'Rourter desconfigurado', 'el cliente quiso cambiar el nombre del wifi y se confindio en aserlo, logrando averiar la configurac', '', 'pendiente', '2020-02-20 00:00:00', '2020-02-20 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets_tecnico`
--

CREATE TABLE `tickets_tecnico` (
  `id` int(11) NOT NULL,
  `tecnico_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Índices para tabela `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tickets_tecnico`
--
ALTER TABLE `tickets_tecnico`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `planes`
--
ALTER TABLE `planes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tickets_tecnico`
--
ALTER TABLE `tickets_tecnico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `planes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
