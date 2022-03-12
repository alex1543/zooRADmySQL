
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS zoo;

CREATE TABLE `administration` (
  `id_admin` int(11) NOT NULL,
  `director_name` varchar(30) NOT NULL,
  `place_admin_building` text NOT NULL,
  `vetСouncil` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `administration`
--

INSERT INTO `administration` (`id_admin`, `director_name`, `place_admin_building`, `vetСouncil`) VALUES
(1, 'Nikolay Akimov', 'On the street', 'good');

-- --------------------------------------------------------

--
-- Структура таблицы `animals`
--

CREATE TABLE `animals` (
  `id_animals` int(11) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `nickname` varchar(25) NOT NULL,
  `cell` varchar(150) NOT NULL,
  `place_origin` text NOT NULL,
  `country` varchar(50) NOT NULL,
  `count_food` int(11) NOT NULL,
  `type_animals` varchar(40) NOT NULL,
  `type_food` varchar(20) NOT NULL,
  `under_type_food` text NOT NULL,
  `date_add` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `animals`
--

INSERT INTO `animals` (`id_animals`, `id_worker`, `nickname`, `cell`, `place_origin`, `country`, `count_food`, `type_animals`, `type_food`, `under_type_food`, `date_add`) VALUES
(1, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(2, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(3, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(4, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(5, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(6, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(7, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(8, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(9, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(10, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(11, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(12, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(13, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00'),
(14, 1, 'Найда', 'Вольер', 'Лес', 'США', 2, 'волк', 'мясо', 'кролик', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `text`, `description`, `keywords`) VALUES
(1, 'Name1', 'Desc.', 'key1, 2 ...'),
(2, 'Name1', 'Desc.', 'key1, 2 ...'),
(3, 'Name1', 'Desc.', 'key1, 2 ...'),
(4, 'Name1', 'Desc.', 'key1, 2 ...'),
(5, 'Name1', 'Desc.', 'key1, 2 ...'),
(6, 'Name1', 'Desc.', 'key1, 2 ...'),
(7, 'Name1', 'Desc.', 'key1, 2 ...'),
(8, 'Name1', 'Desc.', 'key1, 2 ...'),
(9, 'Name1', 'Desc.', 'key1, 2 ...'),
(10, 'Name1', 'Desc.', 'key1, 2 ...'),
(11, 'Name1', 'Desc.', 'key1, 2 ...');

-- --------------------------------------------------------

--
-- Структура таблицы `univer`
--

CREATE TABLE `univer` (
  `id_univer` int(11) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `nameUniver` varchar(370) NOT NULL,
  `nameFacultaty` varchar(450) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `id_worker` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `administration`
--
ALTER TABLE `administration`
  ADD PRIMARY KEY (`id_admin`);

--
-- Индексы таблицы `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id_animals`),
  ADD KEY `id_worker` (`id_worker`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `univer`
--
ALTER TABLE `univer`
  ADD PRIMARY KEY (`id_univer`),
  ADD KEY `id_worker` (`id_worker`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id_worker`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `animals`
--
ALTER TABLE `animals`
  MODIFY `id_animals` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `univer`
--
ALTER TABLE `univer`
  ADD CONSTRAINT `univer_ibfk_1` FOREIGN KEY (`id_worker`) REFERENCES `workers` (`id_worker`);

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administration` (`id_admin`),
  ADD CONSTRAINT `workers_ibfk_2` FOREIGN KEY (`id_worker`) REFERENCES `animals` (`id_worker`);
COMMIT;

