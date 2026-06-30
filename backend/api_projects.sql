-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2026 a las 18:01:35
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_projects`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `createdAt`, `updatedAt`) VALUES
(1, 'Lámparas decorativas', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Lámparas para interior', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Lámparas para exterior', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Bombillos LED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Iluminación Inteligente', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Control de Iluminación', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Cintas LED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Ferretería', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','out_of_stock') DEFAULT 'active',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `image_url`, `status`, `createdAt`, `updatedAt`, `category_id`) VALUES
(1, 'Lámpara de mesa Florencia', 'Luminaria de mesa para uso interior. Elaborada en hierro con pintura electrostática o electroquímica.  \r\n\r\nAltura total 40 cm\r\nEsfera P12\r\nBase 18 cm diámetro\r\n\r\n', 550000.00, 11, 'https://assets.boconcept.com/a8b489be-92fb-42fc-8943-b30c0091894f/2802663_PNG-Web%2072dpi.png?format=webply&fit=bounds&width=3020&quality=75', 'active', '2026-06-29 21:22:37', '2026-06-29 21:22:37', 1),
(2, 'Lámpara de mesa - Mira Negro', 'Alto total: 32 cm\r\n\r\nAcabado: negro total, mate\r\n\r\nPantalla en tono uniforme — coherencia visual completa\r\n\r\nBombillo no incluido (recomendado: E14 LED cálido, máx. 25W)', 529000.00, 6, 'https://cdn.wonderstatic.com/product-image/lampa-stolowa-mala-stalowa-kolor-czarny-32-cm-1-cbvvf.jpg?width=850&height=650&quality=85&dpr=1.25&format=pjpg&auto=webp&fit=bounds&io=true', 'active', '2026-06-29 22:58:11', '2026-06-29 22:58:11', 1),
(3, 'Lámpara Decorativa Colgante Lynet', 'Diámetro: 20 cm\r\nAltura: 19.5 cm\r\nBase de techo: 13 cm\r\nMateriales: Aluminio o lámina cold rolle, Cable encauchado o textil de 1 metro (según paleta de colores)\r\nRosca E-27 (compatible con la mayoría de bombillas)\r\nSolo para uso en interiores\r\n', 130000.00, 0, 'https://il-luminar.com.co/wp-content/uploads/2023/03/PD-LYNET-I-GALICIA.jpg', 'active', '2026-06-29 23:04:53', '2026-06-29 23:04:53', 1),
(4, 'Lámpara de Techo Charlote', 'Dimensiones: 16.5 cm (alto) x 16.5 cm (ancho)\r\nCable: 1 metro\r\nMaterial: Hierro\r\nBase: 13 cm\r\nRosca: E-27\r\nUso: Exclusivo para interiores\r\n', 107900.00, 11, 'https://il-luminar.com.co/wp-content/uploads/2022/08/charlote-cubo-cuadrado.jpg', 'active', '2026-06-29 23:07:36', '2026-06-29 23:07:36', 1),
(8, 'Cinta Luz Led 5 Metros Multicolor\r\n', 'Diseño Flexible y Adaptable: Estructura que permite doblarse y ajustarse a esquinas y superficies curvas sin dañarse.\r\n\r\nIluminación Multicolor: Amplia variedad de colores y efectos para personalizar el ambiente según la ocasión.', 30000.00, 15, 'https://cdn1.totalcommerce.cloud/laplazamorada/product-zoom/es/cinta-luz-led-5-metros-multicolor-1.webp', 'active', '2026-06-30 01:16:29', '2026-06-30 01:16:29', 7),
(11, 'Cinta led de luz blanca 12 V\r\n', 'Se puede cortar cada 3 led. \r\n\r\nMayor facilidad de manejo al realizar maquetas o manualidades que requieren este tipo de elementos. \r\n\r\n', 17800.00, 9, 'https://panamericana.vtexassets.com/arquivos/ids/201599-1200-auto?v=636291000479900000&width=1200&height=auto&aspect=true', 'active', '2026-06-30 01:42:07', '2026-06-30 01:42:07', 7),
(12, 'Cinta Led Doble Carril', 'Potencia: 9W\r\nCinta LED Luz Calida y Neutra\r\nVida de 40.000 horas\r\nTensión de 110V\r\n', 16500.00, 13, 'https://image.made-in-china.com/202f0j00zUYfayRqqvoc/High-Quality-5050-Rigid-LED-Strip-Lighting-12V-LED-Tape-Light-Strip.webp', 'active', '2026-06-30 01:55:41', '2026-06-30 01:55:41', 7),
(13, 'CINTA LED PARA TV RGB BLUETOOTH LUCES USB RETROILUMINACION 5MTS', 'Longitud 5 metros.\r\nAdhesivo en el dorso para su instalación, para mayor fijación y duración reforzar con silicona\r\nAudio rítmica desde la app.\r\n\r\nBajo consumo de energía, super brillante.\r\n', 25000.00, 3, 'https://puntoscolombia.vtexassets.com/arquivos/ids/28475054-1200-auto?v=638655273008200000&width=1200&height=auto&aspect=true', 'active', '2026-06-30 01:59:49', '2026-06-30 01:59:49', 7),
(14, 'Lampara de mesa Magna', 'Esta lámpara recargable multifunción es la compañera perfecta en la casa. Básicamente son tres lámparas en una.', 104000.00, 7, 'https://decolum.co/cdn/shop/files/1-2.jpg?v=1769704030&width=1780', 'active', '2026-06-30 02:06:35', '2026-06-30 02:06:35', 1),
(15, 'LÁMPARA MESA DIM BLANCO Y NEGRO', 'Potencia: Depende de la fuente de luz\r\nSoket: E27 x 1\r\nMedidas: 19 cm x 16 cm x 36 cm\r\nMaterial: PC\r\nColor: Negro\r\n\r\n', 103000.00, 9, 'https://decolum.co/cdn/shop/files/Grupo6_b1b4b4ec-3cb3-4f6a-a2ae-de378fb8141b.jpg?v=1752160772&width=1780', 'active', '2026-06-30 02:12:44', '2026-06-30 02:12:44', 1),
(16, 'Lampara de Mesa Korty', 'Tensión: 50 v/60 hz\r\nIP: 20 \r\n20 x 48 cm de diámetro \r\nColor: Cromo\r\n\r\n', 140000.00, 8, 'https://decolum.co/cdn/shop/files/Grupo25_6010482e-8604-4998-b088-6b405b00eaa6.jpg?v=1772044218&width=1100', 'active', '2026-06-30 02:14:14', '2026-06-30 02:14:14', 1),
(17, 'Lámpara de Mesa Simply Negra', 'Potencia: 40W\r\nSocket: E27\r\nVoltaje: 100-240V\r\nFrecuencia: 50/60Hz\r\nMaterial: madera\r\n\r\n', 128900.00, 6, 'https://decolum.co/cdn/shop/files/Grupo27_99ba4179-4180-409e-8df1-c1bb6f08c73f.jpg?v=1752161368&width=1100', 'active', '2026-06-30 02:19:52', '2026-06-30 02:19:52', 1),
(18, 'Spot magnético 5W 48V – Cálida', 'Spot LED Magnético de Acento 5W (48V)Dale un toque minimalista y elegante a tus espacios con este proyector LED de alta precisión', 100000.00, 7, 'https://iluconcept.com/wp-content/uploads/2026/06/SPOT-MAGNETICO-REF.-10070342.jpg', 'active', '2026-06-30 02:26:53', '2026-06-30 02:26:53', 2),
(19, 'LED GIRON Lámpara de pared / techo', 'Lumen completo:	1.500\r\nKelvin completo:	3000\r\nNúmero de material:	93306\r\nMaterial de la carcasa:	Acero\r\nColor de la carcasa:	Blanco\r\nMaterial del vidrio / pantalla:	Plástico\r\nColor del vidrio / pantalla:	Blanco\r\nTipo de protección:	IP20\r\nBombillas incl. 1:	Incluidas\r\nLamp socket 1:	LED\r\nCaracterísticas:	LED reemplazables', 120000.00, 6, 'https://www.eglo.com/media/catalog/product/cache/71dd1569cc8a65400824485a16943362/dam/cumulus/56d2defceeaa4_101_0001.jpg', 'active', '2026-06-30 02:29:48', '2026-06-30 02:29:48', 2),
(20, 'Bala De Empotrar Ajustable Satin', 'BALA INYECTADA SATIN GU10 escualizable, perfecto para todo tipo de estilos tanto en hogares, como en oficinas y comercios, perfecto para resaltar zonas y crear un espacio acogedor.\r\n\r\n', 25000.00, 10, 'https://ilumax.com.co/wp-content/uploads/2021/09/Bala_De_Empotrar_Ajustable_Satin_1091_1.jpg-768x768.jpg.webp', 'active', '2026-06-30 02:34:55', '2026-06-30 02:34:55', 2),
(21, 'Panel Led 12W Lc 25000H ILM ECO', 'Ideal para oficinas, casas, cocinas, locales comerciales y lugares de trabajo. Diseño moderno y una larga vida útil.', 8900.00, 15, 'https://ilumax.com.co/wp-content/uploads/2024/03/Panel_LED_2276_12W_ILUMAX_ECO_1-300x300.jpg', 'active', '2026-06-30 03:01:25', '2026-06-30 03:01:25', 2),
(22, 'Panel LED 12W Sobreponer Cuadrado Luz Fresca 16cm', 'Paneles cuadrados de sobreponer para cualquier tipo de aplicación Hogar, Comercial, Industrial, etc. Tienen un óptimo consumo energético y un alto desempeño lumínico. Diseños limpios y sofisticados.', 15000.00, 4, 'https://ilumax.com.co/wp-content/uploads/2022/10/Panel_LED_12W_Sobreponer_Cuadrado_Luz_Fresca_2006_1.jpg-300x300.jpg.webp', 'active', '2026-06-30 03:03:25', '2026-06-30 03:03:25', 2),
(23, 'Panel LED 48W Plano Luz Blanca 30X120Cm', 'Panel rectangular de incrustar para cualquier tipo de aplicación Hogar, Comercial, Industrial, etc. Tienen un óptimo consumo energético y un alto desempeño lumínico. Diseños limpios y Sofisticados', 137000.00, 12, 'https://ilumax.com.co/wp-content/uploads/2021/08/PANEL_LED_48W_PLANO_LUZ_BLANCA_30X120CM_794_1.jpg-768x768.jpg.webp', 'active', '2026-06-30 03:05:58', '2026-06-30 03:05:58', 2),
(24, 'Reflector Led 50W Lb 20000H ECO', 'Reflector LED, adecuado para instalaciones de exterior e interior como por ejemplo jardines, parques, bodegas y muchos más', 43000.00, 15, 'https://ilumax.com.co/wp-content/uploads/2024/03/Reflector_LED_2262_50W_ILUMAX_ECO_1-768x768.jpg', 'active', '2026-06-30 03:08:54', '2026-06-30 03:08:54', 2),
(25, 'TORTUGA LED CON SENSOR 12W LUZ BLANCA', 'Tortuga LED con sensor de movimiento 12 luz blanca', 24000.00, 5, 'https://ilumax.com.co/wp-content/uploads/2026/01/2547-PRODUCTO1-1200x1200.jpg', 'active', '2026-06-30 03:15:01', '2026-06-30 03:15:01', 5),
(26, 'Reflector LED 50W Smart CCT RGB', 'Reflector inteligente LED para exteriores resistente a la intemperie e impactos, ideal para aplicaciones en interiores y exteriores. para uso en parqueaderos, fachadas, parques y senderos', 121000.00, 2, 'https://ilumax.com.co/wp-content/uploads/2022/10/Reflector_LED_50W_Smart_CCT_RGB_1963_3.jpg-768x768.jpg.webp', 'active', '2026-06-30 03:17:46', '2026-06-30 03:17:46', 5),
(27, 'Tubo LED Luz Blanca 9W Vidrio', 'Tubo LED T8, más brillante que los tubos convencionales fluorescentes, sin parpadeo, sin radiación uv, libre de mercurio contaminante, ideal para oficinas, iluminación de áreas, publicidad, espacios comerciales, áreas privadas, lugares de trabajo. Diseño moderno y una larga vida útil.\r\n\r\n', 9000.00, 11, 'https://ilumax.com.co/wp-content/uploads/2021/08/Tubo_LED_Luz_Blanca_9W_Vidrio_807_1.jpg.jpg.webp', 'active', '2026-06-30 04:30:59', '2026-06-30 04:30:59', 2),
(28, 'Estaca GU10 para Jardín GRDGU10B\r\n', 'Estaca para jardín con base GU10, ideal para iluminación decorativa y puntual en exteriores.\r\n\r\n• Compatible con bombillo LED GU10 hasta 7W (no incluido), perfecta para resaltar jardines y paisajismo', 29000.00, 6, 'https://www.ecolite.com.co/wp-content/uploads/2026/02/GRDGU10B-02.webp', 'active', '2026-06-30 04:43:53', '2026-06-30 04:43:53', 3),
(29, 'Bala de piso LED 3W ECOBP3W', 'Bala de piso LED 3W, es la solución perfecta para iluminar tus espacios al aire libre con estilo y eficiencia. Diseñada para resistir condiciones adversas, como la humedad, la lluvia y el polvo; esta luminaria es ideal para aplicaciones en exteriores que requieren durabilidad y resistencia', 64900.00, 4, 'https://www.ecolite.com.co/wp-content/uploads/2023/05/ECOBP3W_PAGWEB8-1.webp', 'active', '2026-06-30 04:54:30', '2026-06-30 04:54:30', 3),
(30, 'Bala de piso para bombillo GU10', 'Bala de piso diseñada para instalarse directamente en el suelo, ideal para resaltar jardines, fachadas, senderos, entradas, muros y áreas exteriores con un acabado moderno y discreto.', 58900.00, 11, 'https://www.ecolite.com.co/wp-content/uploads/2025/11/ECOBPGU10A.webp', 'active', '2026-06-30 04:56:29', '2026-06-30 04:56:29', 3),
(31, 'Estaca LED 0.06W Solar Luz Blanca', 'Estaca LED Solar, ideal para decoración en exteriores como terrazas, jardines, parques fachadas y mas.', 13900.00, 7, 'https://ilumax.com.co/wp-content/uploads/2022/03/Estaca_LED_0.06W_Solar_Luz_Blanca_1343_1.jpg-1200x1200.jpg.webp', 'active', '2026-06-30 05:01:49', '2026-06-30 05:01:49', 3),
(32, 'Reflector LED 10W Nova II Luz Cálida', 'Reflector LED para exteriores resistente a impactos, ideal para aplicaciones en interiores y exteriores. para uso en parqueaderos, fachadas, parques y senderos', 24900.00, 10, 'https://ilumax.com.co/wp-content/uploads/2021/09/Reflector_LED_10W_Nova_II_Luz_Calida_1813_2.jpg-1200x1200.jpg.webp', 'active', '2026-06-30 05:07:23', '2026-06-30 05:07:23', 3),
(33, 'Reflector LED 10W Solar con Sensor de Movimiento Luz Blanca', 'Reflector LED con sensor de presencia detectando Luz y Movimiento para uso interior, exterior y fachadas', 309900.00, 2, 'https://ilumax.com.co/wp-content/uploads/2021/09/Reflector_LED_10W_Solar_con_Sensor_de_Movimiento_Luz_Blanca_1855_2.jpg-1200x1200.jpg.webp', 'active', '2026-06-30 05:14:58', '2026-06-30 05:14:58', 3),
(34, 'Bala De Piso LED 1W Luz Cálida', 'Brillantes, innovadoras de diferentes diseños, potencias, tamaños las Balas para pisos en cerámica, madera, mármol y otras decoraciones', 68900.00, 5, 'https://ilumax.com.co/wp-content/uploads/2021/08/BALA_DE_PISO_LED_1W_LUZ_CALIDA_902_2.jpg-768x768.jpg.webp', 'active', '2026-06-30 05:18:38', '2026-06-30 05:18:38', 3),
(35, 'Luminaria Alumbrado Exterior Solar LED 4W Luz Blanca', 'Luminaria LED Solar de Alumbrado Exterior. Ideal para zonas residenciales, plazas, escuelas, parques, patios', 175900.00, 3, 'https://ilumax.com.co/wp-content/uploads/2021/08/Luminaria_Alumbrado_Exterior_Solar_LED_4W_Luz_Blanca_1.jpg-1200x1200.jpg.webp', 'active', '2026-06-30 05:21:53', '2026-06-30 05:21:53', 3),
(36, 'Bombillo LED A60 9w Luz Fría Certificado', 'Tipo : Bombillos led\r\n•Rosca : E27\r\n•Temperatura de color : 6500 K\r\n•Tipo de instalación : Empotrado', 4900.00, 21, 'https://media.falabella.com/sodimacCO/904422/w=1036,h=832,f=webp,fit=contain,q=85', 'active', '2026-06-30 05:27:42', '2026-06-30 05:27:42', 4),
(37, 'Bombillo Led 20w Luz Fría Certificado\r\n', 'Tipo : Bombillos led\r\n•Rosca : E27\r\n•Tipo de instalación : Sobrepuesto\r\n\r\n', 7500.00, 12, 'https://media.falabella.com/sodimacCO/290613/w=1036,h=832,f=webp,fit=contain,q=85', 'active', '2026-06-30 05:29:30', '2026-06-30 05:29:30', 4),
(38, 'Bombillo Led 5w 450 Lúmenes Luz Fría ', 'Tipo : Bombillos led\r\n•Rosca : E27\r\n•Temperatura de color : 6500 K\r\n•Tipo de instalación : Empotrado', 7600.00, 10, 'https://media.falabella.com/sodimacCO/449932/w=1036,h=832,f=webp,fit=contain,q=85', 'active', '2026-06-30 05:34:00', '2026-06-30 05:34:00', 4),
(39, 'Bombillo Led 350 Lúmenes 4w Luz Fría Certificado\r\n', 'Tipo : Bombillos led\r\n•Rosca : GU10\r\n•Temperatura de color : 6500 K\r\n•Tipo de instalación : Empotrado', 8500.00, 13, 'https://media.falabella.com/sodimacCO/496244/w=1324,h=832,f=webp,fit=contain,q=85', 'active', '2026-06-30 05:40:09', '2026-06-30 05:40:09', 4),
(40, 'Bombillo LED 20W Luz Cálida', 'El Bombillo LED de 20W Luz Cálida es la solución perfecta. Combina la potencia bruta de un reflector pequeño con el tono dorado y relajante (3000K) que tanto gusta para el descanso y la vida social.', 8100.00, 15, 'https://siriuscol.com/cdn/shop/files/IBL31_BOMBILLO_LED_20W_LUZ_CALIDA_1.webp?v=1723157798&width=990', 'active', '2026-06-30 06:19:26', '2026-06-30 06:19:26', 4),
(41, 'Bombillo LED 7W Luz Blanca', 'Es ideal para quienes aman los ambientes \"hogareños\" y elegantes, pero necesitan suficiente luz para ver bien, leer cómodamente o recibir visitas en espacios de gran metraje o techos altos.\r\n\r\n', 3900.00, 20, 'https://siriuscol.com/cdn/shop/files/IBL30-BOMBILLO_LED_7W_E27_LUZ_BLANCA_1.webp?v=1722963092&width=990', 'active', '2026-06-30 06:21:00', '2026-06-30 06:21:00', 4),
(42, 'Bombillo IBL21 LED 4W E27 2700K Mercury', 'Color: Blanco\r\nTipo de Producto: Bombillos Led\r\nModelo: IBL21\r\nOrigen: Importado\r\nPaís de Origen: China\r\n', 10900.00, 14, 'https://easycolombia.vtexassets.com/arquivos/ids/1109269-1600-1600?v=639156597165170000&width=1600&height=1600&aspect=true', 'active', '2026-06-30 06:26:02', '2026-06-30 06:26:02', 4),
(43, 'Bombillo Led Filamento Pera ST64 6W Luz Cálida Amb', 'Ilumina tus espacios con un toque de elegancia y calidez. Este bombillo LED de filamento estilo pera ST64, con su luz cálida y diseño vintage moderno, es perfecto para crear ambientes acogedores y llenos de estilo. Su tecnología LED garantiza una larga vida útil y un consumo eficiente, ideal para darle un toque especial a tu hogar o negocio.\r\n\r\n', 23900.00, 11, 'https://media.falabella.com/sodimacCO/917841_01/w=1200,h=1200,fit=pad', 'active', '2026-06-30 06:29:48', '2026-06-30 06:29:48', 4),
(44, 'Track Light LED para Sistema de Riel Magnético 24W', 'El Track Light LED de 24W para Riel Magnético ofrece una iluminación potente y eficiente para interiores decorativos', 113900.00, 3, 'https://www.ecolite.com.co/wp-content/uploads/2024/05/TLMSP2-1.webp', 'active', '2026-06-30 06:37:21', '2026-06-30 06:37:21', 5),
(45, 'Control De Iluminación Inteligente Ray Ii 240V', 'Transforma tu hogar con nuestro innovador control de iluminación inteligente. Controla tus luces fácilmente desde tu celular o con tu asistente de voz, creando el ambiente perfecto sin moverte del sofá. Disfruta de la comodidad y la tecnología que te permite automatizar tu espacio y hacerlo más funcional.\r\n\r\n', 130900.00, 2, 'https://media.falabella.com/sodimacCO/626293_03/w=1036,h=832,f=webp,fit=contain,q=85', 'active', '2026-06-30 06:40:26', '2026-06-30 06:40:26', 6),
(46, 'Sensor Sylvania Infrarojo Techo 360G 6M Blanco', 'Sensor Sylvania InfraROJO para techo 360G con un alcance de 6 metros en color Blanco , una innovación que optimizará por completo tu sistema de iluminación.', 21200.00, 13, 'https://nalelectricos.com.co/wp-content/uploads/2025/09/SL04SMT.jpg', 'active', '2026-06-30 06:43:28', '2026-06-30 06:43:28', 6),
(47, 'Roseta plastica 150W E27 Legrand', 'Roseta Plástica de 150W con base E27, una solución versátil y eficiente para iluminación residencial y comercial.\r\n\r\n', 8900.00, 27, 'https://nalelectricos.com.co/wp-content/uploads/2025/09/SL46RB.jpg', 'active', '2026-06-30 06:45:08', '2026-06-30 06:45:08', 6),
(48, 'Sensor de pared escualizable 140 grados de 12 metros', 'Sensor de Pared Ecualizable, una solución avanzada que combina precisión y versatilidad para satisfacer las necesidades de control de iluminación en una variedad de entornos residenciales y comerciales', 28900.00, 16, 'https://nalelectricos.com.co/wp-content/uploads/2025/09/SL72ISIM.jpg', 'active', '2026-06-30 06:47:04', '2026-06-30 06:47:04', 6),
(49, 'Roseta Loza E27 Blanco Corona', 'La roseta loza E27 blanca corona es un accesorio de iluminación clásico y funcional, diseñado para alojar bombillas de tipo E27, que es uno de los tipos de casquillos más comunes y utilizados en iluminación residencial y comercial', 4000.00, 40, 'https://nalelectricos.com.co/wp-content/uploads/2025/09/SL93RLC.jpg', 'active', '2026-06-30 06:48:12', '2026-06-30 06:48:12', 6),
(50, 'Controlador De Luz RGB Con Control Remoto', 'Nombre de la marca:Viktorovna\r\n\r\nTipo de artículo:RGB Controler\r\n\r\nLuces aplicables:Tiras de led 3528/5050\r\n\r\nEnergía máxima de la carga:100w\r\n\r\nPotencia:100w\r\n\r\n', 12900.00, 5, 'https://cdnx.jumpseller.com/mactornica/image/8866471/resize/1140/1530?1651532451', 'active', '2026-06-30 06:50:01', '2026-06-30 06:50:01', 6),
(51, 'Controlador Remoto Dc12 A 24 V Con Regulador De Intensidad', 'Función de control de atenuación inteligente:\r\ncontrolador de atenuación: el atenuador infrarrojo de 12 teclas se utiliza como controlador de atenuación inteligente de la iluminación LED, adopta la avanzada tecnología PWM (modulación de ancho de pulso). Ajuste de luz: admite mando manual, brillo continuo y control remoto inalámbrico IR; adecuado para cajas inferiores de enchufe tipo 86 estándar comercial o doméstico.', 40000.00, 3, 'https://http2.mlstatic.com/D_Q_NP_2X_923915-MCO103481617729_012026-F.webp', 'active', '2026-06-30 06:51:52', '2026-06-30 06:51:52', 6),
(52, 'Sensor Ciles humo 9VDC 120VAC 12M blanco', 'El sensor de humo CILES en color Blanco , con alimentación de 9VDC y 120VAC.\r\n\r\n', 25900.00, 5, 'https://nalelectricos.com.co/wp-content/uploads/2025/09/SL02SH.jpg', 'active', '2026-06-30 06:56:20', '2026-06-30 06:56:20', 6),
(53, 'Cinta Aislante 19Mm X 10 Mts Negra Tesa\r\n', 'La cinta aislante tesa de PVC es la ayuda fiable para electricistas, mecánicos y otros profesionales. Se caracteriza por su soporte relativamente grueso, un alto grado de flexibilidad y un rendimiento adhesivo muy bueno (incluso en acero y a bajas temperaturas).', 3900.00, 15, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000052360_61421387.png?optimize=low&fit=bounds&height=700&width=700&format=jpeg', 'active', '2026-06-30 07:31:52', '2026-06-30 07:31:52', 8),
(54, 'Espátula Flexible Mango Plástico 4\"\r\n', 'Paleta/palustre resistente al rompimiento, forjada en una sola pieza para una máxima duración y flexibilidad. Tratada térmicamente para resistir golpes y deformaciones', 7000.00, 15, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000049478_22997117.png?optimize=low&fit=bounds&height=700&width=700&format=jpeg', 'active', '2026-06-30 07:34:47', '2026-06-30 07:34:47', 8),
(55, 'Grata Cepillo 3 X 17 Hilos En Acero Mango Plástico\r\n', 'Elimina, oxido, pintura vieja y otros materiales, dejando superficies metálicas listas para procesos de soldadura.', 9100.00, 17, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000012961_12142787.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:36:26', '2026-06-30 07:36:26', 8),
(56, 'Lija De Agua Premier Plus Gr-240 9 X 11\r\n', 'Tipo	Lijas\r\nCódigo ERP	G1Y0038\r\nPresentación	Presentación 1 Unidad\r\nMarca	CARBORUNDUM', 1500.00, 50, 'https://ferricentro.com/media/catalog/product/i/m/imagen_G1Y0038_11076571.png?optimize=low&fit=bounds&height=700&width=700&format=jpeg', 'active', '2026-06-30 07:37:04', '2026-06-30 07:37:04', 8),
(57, 'Lija De Tela Patelox 6\r\n', 'Es una herramienta esencial para tus proyectos de acabado. Fabricada con 100% grano en óxido de aluminio, esta lija ofrece una alta durabilidad y flexibilidad gracias a su papel impermeable.', 4100.00, 26, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000031894_10446190.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:39:01', '2026-06-30 07:39:01', 8),
(58, 'Martillo De Uña De 28Oz 35Mm Mango Madera', 'Martillo de uña de 35 mm con mango madera. Ideal para labores de construcción, jardinería o agricultura', 36900.00, 14, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000027012_62306276.png?optimize=low&fit=bounds&height=700&width=700&format=jpeg', 'active', '2026-06-30 07:40:15', '2026-06-30 07:40:15', 8),
(59, 'Pala Redonda # 4 Sin Cabo\r\n', 'Usada por trabajadores amateur o profesionales en el de la construcción y la agricultura para revolver mezclas de concreto, de cemento y arena, excavar y remover tierra sin deformarse o romperse.\r\n\r\n', 19900.00, 11, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000047575_61254821.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:42:24', '2026-06-30 07:42:24', 8),
(60, 'Pegante Instantáneo Super Bonder Extra De 5Gr\r\n', '1 unidad de Pegante Instantáneo 451 Super Bonder Extra De 5Gr\r\n', 6700.00, 35, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000006564_74968029.png?optimize=low&fit=bounds&height=700&width=700&format=jpeg', 'active', '2026-06-30 07:43:20', '2026-06-30 07:43:20', 8),
(61, 'Pila Alcalina AA 1.5V\r\n', 'Unidad de pila Alcalina AA 1.5V\r\n', 5300.00, 20, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000027566_67288785.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:44:53', '2026-06-30 07:44:53', 8),
(62, 'Pila Alcalina Cuadrada 9V\r\n', 'Recomendadas para utilizar en aparatos de alto desempeño y de uso frecuente.', 12900.00, 22, 'https://ferricentro.com/media/catalog/product/i/m/imagenp_0000027573.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:46:23', '2026-06-30 07:46:23', 8),
(63, 'Pistola De Calafateo Doble Varilla\r\n', 'Pistola de calafateo doble varilla - PSF5 - Características: Reforzada Profesional. Doble Varilla De Empuje Para Cartuchos Especializados', 39100.00, 6, 'https://ferricentro.com/media/catalog/product/i/m/imagenp_0000013449.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:47:09', '2026-06-30 07:47:09', 8),
(64, 'Pistola Pequeña Para Pegar Silicona Barra 5/16\"\r\n', 'Ideal para usar en espacios estrechos -Largo 4.1/4\" (10.8cm) -Garantía de por vida útil\r\n', 30000.00, 5, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000001347_46530154.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:47:59', '2026-06-30 07:47:59', 8),
(65, 'Amarre Plastico 10 Cm Negro Juego De 100Pzs', 'Amarre Plastico 10 Cm Negro Juego De 100Pzs\r\n', 1400.00, 13, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000048807_81770644.jpg?optimize=low&fit=bounds&height=700&width=700', 'active', '2026-06-30 07:49:42', '2026-06-30 07:49:42', 8),
(66, 'Balde Constructor 8 Lts - Bellota\r\n', 'Diseño resistente, cuerpo inyectado en una sola pieza. Facilidad para cargar arena, cemento, agua o realizar la mezcla en su interior. ', 6000.00, 13, 'https://ferricentro.com/media/catalog/product/i/m/imagen_0000047566_45088194.png?optimize=low&fit=bounds&height=700&width=700&format=jpeg', 'active', '2026-06-30 07:50:43', '2026-06-30 07:50:43', 8),
(67, 'Alicate Hombre Solo Recto 10\"', 'Quijada forjada en acero Cr-Mo, que ofrece una excelente resistencia y tenacidad. Cuenta con un botón de ajuste milimétrico, que permite un mejor ajuste.', 34900.00, 11, 'https://casaferretera.vtexassets.com/arquivos/ids/170829-1200-1200?v=638170905766000000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 07:54:25', '2026-06-30 07:54:25', 8),
(68, 'Copa Larga Sata 8 Mm Cuadrante 3/8\" 6 Puntas', 'Copa con paredes de poco espesor con tratamiento térmico. Aleación en cromo vanadio que permite una alta resistencia. Recubrimiento en cromo niquelado que evita la oxidación. Garantia de por vida por defectos de fabricación.\r\n\r\n', 7000.00, 15, 'https://casaferretera.vtexassets.com/arquivos/ids/218847-1200-1200?v=638863975683070000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 07:54:59', '2026-06-30 07:54:59', 8),
(69, 'Nivel De Alumínio Basic I-Beam 18\"', 'Ofrece funciones mejoradas como burbujas 25% MÁS GRANDES, más visibles, Más legibles, así como más FUERTES ofreciendo mayor durabilidad y exactitud', 29900.00, 9, 'https://casaferretera.vtexassets.com/arquivos/ids/167251-1200-1200?v=638157249919400000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 07:56:06', '2026-06-30 07:56:06', 8),
(70, 'Segueta -Nicholson- Nf-1224 Lamina', 'Segueta -Nicholson- Nf-1224 Lamina (Und)(50)(600)(E)', 2950.00, 30, 'https://casaferretera.vtexassets.com/arquivos/ids/172006-1200-1200?v=638261597829730000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 07:57:48', '2026-06-30 07:57:48', 8),
(71, 'Destornillador De Pala 1/4 x 8\"', 'Vástago fabricado en CR-V con temple adicional en la punta para mayor dureza y resistencia a la torsión. Mango fabricado en PVC altamente resistente a diluyentes y al impacto.', 9900.00, 26, 'https://casaferretera.vtexassets.com/arquivos/ids/170779-1200-1200?v=638163206563670000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 07:58:24', '2026-06-30 07:58:24', 8),
(72, 'Llave Mixta Cromada de 10mm', 'Las llaves combinadas ofrecen una mayor agilidad y fuerza debido a la unión de la llave boca fija y boca estrellada en una sola pieza.', 8700.00, 24, 'https://casaferretera.vtexassets.com/arquivos/ids/170605-1200-1200?v=638163206089970000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 07:59:50', '2026-06-30 07:59:50', 8),
(73, 'Flexómetro 5 metros Global', 'Cinta métrica de 5m con alta resistencia a rasgaduras y abrasión por su revestimiento completo de la hoja de nylon extruido y gancho doble extra grande', 17500.00, 14, 'https://casaferretera.vtexassets.com/arquivos/ids/221410-1200-1200?v=638944055985230000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 08:01:59', '2026-06-30 08:01:59', 8),
(74, 'Lima Triangula -Herragro- 6- Regul.C/Cabo(12)\r\n', 'Superﬁcies con rectificado superior que permite una formación más precisa del diente para mayor duración, reduciendo la posibilidad de fractura', 4100.00, 39, 'https://casaferretera.vtexassets.com/arquivos/ids/158502-1200-1200?v=637995684197770000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 08:03:10', '2026-06-30 08:03:10', 8),
(75, 'Llave Mixta de 8mm Económica Stanley ', 'Aplicaciones: Ideal para apretar y aflojar los tornillos y tuercas hexagonales, esencial para los\r\ntrabajos realizados en las funciones mecánicas.', 5100.00, 25, 'https://casaferretera.vtexassets.com/arquivos/ids/218929-1200-1200?v=638863983719800000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 08:04:24', '2026-06-30 08:04:24', 8),
(76, 'Destornillador chequeador pequeño', 'Este es un producto multimarca y su imagen es de referencia, la presentación del producto puede presentar variaciones', 1900.00, 18, 'https://casaferretera.vtexassets.com/arquivos/ids/167869-1200-1200?v=638158770826900000&width=1200&height=1200&aspect=true', 'active', '2026-06-30 08:05:22', '2026-06-30 08:05:22', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_user` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `userStatus_fk` int(11) NOT NULL,
  `role_fk` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_statuses`
--

CREATE TABLE `user_statuses` (
  `userStatus_id` int(11) NOT NULL,
  `userStatus_name` varchar(255) NOT NULL,
  `userStatus_description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_user` (`user_user`),
  ADD KEY `userStatus_fk` (`userStatus_fk`),
  ADD KEY `role_fk` (`role_fk`);

--
-- Indices de la tabla `user_statuses`
--
ALTER TABLE `user_statuses`
  ADD PRIMARY KEY (`userStatus_id`),
  ADD UNIQUE KEY `userStatus_name` (`userStatus_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_statuses`
--
ALTER TABLE `user_statuses`
  MODIFY `userStatus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userStatus_fk`) REFERENCES `user_statuses` (`userStatus_id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`role_fk`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
