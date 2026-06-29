-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2026 a las 16:25:26
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
-- Base de datos: `books_v3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `author_id` mediumint(8) UNSIGNED NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `ISO3` char(3) NOT NULL,
  `summary` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`author_id`, `full_name`, `ISO3`, `summary`) VALUES
(1, 'J.K. Rowling', 'GBR', 'Author of Harry Potter'),
(2, 'Suzanne Collins', 'USA', 'Author of The Hunger Games'),
(3, 'Ken Follett', 'GBR', 'Author of historical novels'),
(4, 'Ariel Lawhon', 'USA', 'Author of historical fiction'),
(5, 'Pierce Brown', 'USA', 'Author of Red Rising'),
(6, 'Brandon Sanderson', 'USA', 'Fantasy author'),
(7, 'Lian Hearn', 'AUS', 'Author of Tales of the Otori'),
(8, 'Lisa See', 'USA', 'Author of historical novels about Chinese culture'),
(9, 'George R.R. Martin', 'USA', 'Author of A Song of Ice and Fire'),
(10, 'Rebecca Yarros', 'USA', 'Author of fantasy and romance novels'),
(11, 'Alexandre Dumas', 'FRA', 'French author of classic adventure novels'),
(12, 'Arthur Golden', 'USA', 'Author of Memoirs of a Geisha'),
(13, 'Holly Jackson', 'GBR', 'YA mystery author'),
(14, 'L. E. Modesitt Jr.', 'USA', 'Fantasy author'),
(15, 'Andrzej Sapkowski', 'POL', 'Author of The Witcher');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `book_name` varchar(200) NOT NULL,
  `isbn13` char(13) NOT NULL,
  `first_publication_date` date NOT NULL,
  `url_file` char(26) NOT NULL,
  `cover_image` char(26) NOT NULL,
  `summary` text NOT NULL,
  `shortsummary` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`book_id`, `book_name`, `isbn13`, `first_publication_date`, `url_file`, `cover_image`, `summary`, `shortsummary`) VALUES
(1, 'Harry Potter and the Philosopher\'s Stone', '9780747532699', '1997-06-26', 'assets/books/00000001.epub', 'assets/images/00000001.jpg', '\"Turning the envelope over, his hand trembling, Harry saw a purple wax seal bearing a coat of arms; a lion, an eagle, a badger and a snake surrounding a large letter \'H\'.\"\n\nHarry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry\'s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!', 'A boy wizard discovers magic and faces a dark enemy at Hogwarts.'),
(2, 'Harry Potter and the Chamber of Secrets', '9780747538493', '1998-07-02', 'assets/books/00000002.epub', 'assets/images/00000002.jpg', 'Ever since Harry Potter had come home for the summer, the Dursleys had been so mean and hideous that all Harry wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he’s packing his bags, Harry receives a warning from a strange impish creature who says that if Harry returns to Hogwarts, disaster will strike.\n\nAnd strike it does. For in Harry’s second year at Hogwarts, fresh torments and horrors arise, including an outrageously stuck-up new professor and a spirit who haunts the girls’ bathroom. But then the real trouble begins – someone is turning Hogwarts students to stone. Could it be Draco Malfoy, a more poisonous rival than ever? Could it possibly be Hagrid, whose mysterious past is finally told? Or could it be the one everyone at Hogwarts most suspects… Harry Potter himself!', 'Harry uncovers a deadly secret hidden deep within Hogwarts.'),
(3, 'Harry Potter and the Prisoner of Azkaban', '9780747542155', '1999-07-08', 'assets/books/00000003.epub', 'assets/images/00000003.jpg', 'Harry Potter, along with his best friends, Ron and Hermione, is about to start his third year at Hogwarts School of Witchcraft and Wizardry. Harry can\'t wait to get back to school after the summer holidays. (Who wouldn\'t if they lived with the horrible Dursleys?) But when Harry gets to Hogwarts, the atmosphere is tense. There\'s an escaped mass murderer on the loose, and the sinister prison guards of Azkaban have been called in to guard the school...', 'Harry learns shocking truths as a fugitive escapes Azkaban.'),
(4, 'Harry Potter and the Goblet of Fire', '9780747546245', '2000-07-08', 'assets/books/00000004.epub', 'assets/images/00000004.jpg', 'Lord Voldemort, the dark wizard responsible for the deaths of Harry\'s parents, is growing stronger. At the Quidditch World Cup, Voldemort\'s signature Dark Mark appears in the sky over the stadium, causing pandemonium. The lightning-bolt-shaped scar on Harry\'s forehead is sporadically causing him agonizing pain, and he is also hearing disturbing voices. Harry realizes that all this is the result of a strong connection between himself and the Dark Lord, one that is putting him in grave danger. Back at Hogwarts, the students are getting ready for the upcoming Triwizard Tournament. Witches and wizards from two other schools are coming to Hogwarts for the year to compete in a series of grueling contests. The tournament is open only to students age 17 and above, but when someone secretly enters Harry\'s name, he is forced to compete. How can a 14-year-old possibly pass tests that might be fatal to an advanced wizard? And with the threat of Lord Voldemort looming, will he be able to focus on the tournament at all? For Harry, his friends, and everyone in the Wizarding world, the stakes are about to become much higher. This fourth installment, with a heart-pounding and emotional climax, serves as a turning point in the series, for the reader and for Harry himself.', 'Harry faces dangerous trials as Voldemort rises again.'),
(5, 'Harry Potter and the Order of the Phoenix', '9780747551003', '2003-06-21', 'assets/books/00000005.epub', 'assets/images/00000005.jpg', 'It\'s official: the evil Lord Voldemort has returned. His influence is suddenly everywhere in the Wizarding world, and his former allies, the Death Eaters, are returning to his side in droves. In response, the Order of the Phoenix, which worked to stop him during his last rise to power, has reconvened. This time, all of the adults Harry trusts have joined in. And even though Harry is at the center of many of their plans - Voldemort is intent on killing him, after all - they want so badly to protect him that they are keeping him completely out of the loop. Problems are cropping up at Hogwarts, too, where government officials are meddling in just about everything. And just because Voldemort and the Death Eaters are threatening open warfare does not mean that fifth-year students get out of their exams. Meanwhile, Harry\'s powerful connection to Voldemort seems to be growing even stronger, as he realizes that he has direct access to the Dark Lord\'s mind. It\'s time for Harry and his friends to take drastic action, but the course they choose will have terrible unforeseen consequences. Truly dangerous times have arrived in the fifth Harry Potter novel, but it never loses the trademark fun, excitement, and wonder at the possibilities of magic.', 'Harry forms a secret group to fight growing darkness.'),
(6, 'Harry Potter and the Half-Blood Prince', '9780747581086', '2005-07-16', 'assets/books/00000006.epub', 'assets/images/00000006.jpg', 'The war against Voldemort is not going well: even Muggle governments are noticing. Ron scans the obituary pages of The Daily Prophet looking for familiar names. Dumbledore is absent from Hogwarts for long stretches of time, and the Order of the Phoenix has already suffered losses. And yet...\n\nAs in all wars, life goes on. Sixth-year students learn to Apparate, and lose a few eyebrows in the process. The Weasley twins expand their business. Teenagers flirt and fight and fall in love. Classes are never straightforward, though Harry receives some extraordinary help from the mysterious Half-Blood Prince.\n\nSo it\'s the home front that takes center stage in the multilayered sixth installment of the story of Harry Potter. Harry struggles to uncover the identity of the Half-Blood Prince, the past owner of a potions textbook he now possesses that is filled with ingenious, potentially deadly, spells. But Harry\'s life is suddenly changed forever when someone close to him is heinously murdered right before his eyes.\n\nWith Dumbledore\'s guidance, he seeks out the full, complex story of the boy who became Lord Voldemort, and thereby attempts to find what may be his only vulnerability.', 'Secrets of Voldemort\'s past begin to unfold.'),
(7, 'Harry Potter and the Deathly Hallows', '9780747591054', '2007-07-21', 'assets/books/00000007.epub', 'assets/images/00000007.jpg', 'It\'s no longer safe for Harry at Hogwarts, so he and his best friends, Ron and Hermione, are on the run. Professor Dumbledore has given them clues about what they need to do to defeat the dark wizard, Lord Voldemort, once and for all, but it\'s up to them to figure out what these hints and suggestions really mean. Their cross-country odyssey has them searching desperately for the answers, while evading capture or death at every turn. At the same time, their friendship, fortitude, and sense of right and wrong are tested in ways they never could have imagined. The ultimate battle between good and evil that closes out this final chapter of the epic series takes place where Harry\'s Wizarding life began: at Hogwarts. The satisfying conclusion offers shocking last-minute twists, incredible acts of courage, powerful new forms of magic, and the resolution of many mysteries. Above all, this intense, cathartic book serves as a clear statement of the message at the heart of the Harry Potter series: that choice matters much more than destiny, and that love will always triumph over death.\n\nSeries Information: Eleven-year-old Harry Potter is an orphan living with his cruel aunt and uncle when he makes a discovery that will change his life forever: he is a wizard. He is whisked away to the mystical Hogwarts School of Witchcraft and Wizardry to learn magical skills, from potions to spells to flying on broomsticks. But an evil power is rising, the same one that threatened to destroy the entire world when Harry was only a baby. As Harry learns the truth about his family, his childhood, and his mysterious lightning-bolt-shaped scar, he finds unforgettable friendship, a loving surrogate family, and the courage to face the darkest force ever to menace the wizarding world. These charming and engrossing books bring an intensely detailed and captivating world to life and are perfect for enjoying individually or reading aloud.', 'Harry faces Voldemort in the final battle.'),
(8, 'The Hunger Games', '9780439023528', '2008-09-14', 'assets/books/00000008.epub', 'assets/images/00000008.jpg', 'Winning means fame and fortune. Losing means certain death. The Hunger Games have begun. . . .\n\nIn the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. The Capitol is harsh and cruel and keeps the districts in line by forcing them all to send one boy and one girl between the ages of twelve and eighteen to participate in the annual Hunger Games, a fight to the death on live TV.\n\nSixteen-year-old Katniss Everdeen regards it as a death sentence when she steps forward to take her sister\'s place in the Games. But Katniss has been close to dead before-and survival, for her, is second nature. Without really meaning to, she becomes a contender. But if she is to win, she will have to start making choices that weigh survival against humanity and life against love.', 'Katniss volunteers for a deadly televised survival game.'),
(9, 'Catching Fire', '9780439023498', '2009-09-01', 'assets/books/00000009.epub', 'assets/images/00000009.jpg', 'Sparks are igniting.\nFlames are spreading.\nAnd the Capitol wants revenge.\n\nAgainst all odds, Katniss Everdeen has won the Hunger Games. She and fellow District 12 tribute Peeta Mellark are miraculously still alive. Katniss should be relieved, happy even. After all, she has returned to her family and her longtime friend, Gale. Yet nothing is the way Katniss wishes it to be. Gale holds her at an icy distance. Peeta has turned his back on her completely. And there are whispers of a rebellion against the Capitol—a rebellion that Katniss and Peeta may have helped create.\n\nMuch to her shock, Katniss has fueled an unrest that she\'s afraid she cannot stop. And what scares her even more is that she\'s not entirely convinced she should try. As time draws near for Katniss and Peeta to visit the districts on the Capitol\'s cruel Victory Tour, the stakes are higher than ever. If they can\'t prove, without a shadow of a doubt, that they are lost in their love for each other, the consequences will be horrifying.\n\nIn Catching Fire, the second novel of the Hunger Games trilogy, Suzanne Collins continues the story of Katniss Everdeen, testing her more than ever before . . . and surprising readers at every turn.', 'Rebellion begins to spread across Panem.'),
(10, 'Mockingjay', '9780439023511', '2010-08-24', 'assets/books/00000010.epub', 'assets/images/00000010.jpg', 'My name is Katniss Everdeen.\nWhy am I not dead?\nI should be dead.\n\nKatniss Everdeen, girl on fire, has survived, even though her home has been destroyed. Gale has escaped. Katniss\'s family is safe. Peeta has been captured by the Capitol. District 13 really does exist. There are rebels. There are new leaders. A revolution is unfolding.\n\nIt is by design that Katniss was rescued from the arena in the cruel and haunting Quarter Quell, and it is by design that she has long been part of the revolution without knowing it. District 13 has come out of the shadows and is plotting to overthrow the Capitol. Everyone, it seems, has had a hand in the carefully laid plans—except Katniss.\n\nThe success of the rebellion hinges on Katniss\'s willingness to be a pawn, to accept responsibility for countless lives, and to change the course of the future of Panem. To do this, she must put aside her feelings of anger and distrust. She must become the rebels\' Mockingjay—no matter what the personal cost.', 'Katniss becomes the symbol of revolution.'),
(11, 'The Pillars of the Earth', '9780451166890', '1989-01-01', 'assets/books/00000011.epub', 'assets/images/00000011.jpg', 'A sweeping story of cathedral building in medieval England.', 'A sweeping story of cathedral building in medieval England.'),
(12, 'World Without End', '9780451228376', '2007-01-01', 'assets/books/00000012.epub', 'assets/images/00000012.jpg', 'Lives intertwine in a town facing plague and conflict.', 'Lives intertwine in a town facing plague and conflict.'),
(13, 'A Column of Fire', '9780451478009', '2017-01-01', 'assets/books/00000013.epub', 'assets/images/00000013.jpg', 'Espionage and religious wars dominate Elizabethan Europe.', 'Espionage and religious wars dominate Elizabethan Europe.'),
(14, 'The Evening and the Morning', '9781529034502', '2020-01-01', 'assets/books/00000014.epub', 'assets/images/00000014.jpg', 'A prequel exploring the origins of Kingsbridge.', 'A prequel exploring the origins of Kingsbridge.'),
(15, 'The Armour of Light', '9781529077165', '2023-01-01', 'assets/books/00000015.epub', 'assets/images/00000015.jpg', 'Industrial revolution changes lives and power structures.', 'Industrial revolution changes lives and power structures.'),
(16, 'The Frozen River', '9780385547345', '2023-01-01', 'assets/books/00000016.epub', 'assets/images/00000016.jpg', 'A midwife investigates a murder in colonial Maine.', 'A midwife investigates a murder in colonial Maine.'),
(17, 'Red Rising', '9780345539786', '2014-01-01', 'assets/books/00000017.epub', 'assets/images/00000017.jpg', 'A rebel infiltrates a brutal class-based society.', 'A rebel infiltrates a brutal class-based society.'),
(18, 'Golden Son', '9780345539816', '2015-01-01', 'assets/books/00000018.epub', 'assets/images/00000018.jpg', 'War escalates as Darrow rises in power.', 'War escalates as Darrow rises in power.'),
(19, 'Morning Star', '9780345539847', '2016-01-01', 'assets/books/00000019.epub', 'assets/images/00000019.jpg', 'The rebellion reaches its climax.', 'The rebellion reaches its climax.'),
(20, 'The Final Empire', '9780765311788', '2006-01-01', 'assets/books/00000020.epub', 'assets/images/00000020.jpg', 'A crew plans to overthrow an immortal tyrant.', 'A crew plans to overthrow an immortal tyrant.'),
(21, 'The Well of Ascension', '9780765316882', '2007-01-01', 'assets/books/00000021.epub', 'assets/images/00000021.jpg', 'Power struggles threaten a fragile new kingdom.', 'Power struggles threaten a fragile new kingdom.'),
(22, 'The Hero of Ages', '9780765316899', '2008-01-01', 'assets/books/00000022.epub', 'assets/images/00000022.jpg', 'The fate of the world hangs in balance.', 'The fate of the world hangs in balance.'),
(23, 'Across the Nightingale Floor', '9781573223325', '2002-01-01', 'assets/books/00000023.epub', 'assets/images/00000023.jpg', 'A boy is trained as an assassin in feudal Japan.', 'A boy is trained as an assassin in feudal Japan.'),
(24, 'Grass for His Pillow', '9781573223561', '2003-01-01', 'assets/books/00000024.epub', 'assets/images/00000024.jpg', 'Love and duty pull the hero in different directions.', 'Love and duty pull the hero in different directions.'),
(25, 'Brilliance of the Moon', '9781573223578', '2004-01-01', 'assets/books/00000025.epub', 'assets/images/00000025.jpg', 'War and destiny shape the final confrontation.', 'War and destiny shape the final confrontation.'),
(26, 'Snow Flower and the Secret Fan', '9781400072793', '2005-01-01', 'assets/books/00000026.epub', 'assets/images/00000026.jpg', 'A lifelong friendship unfolds in 19th-century China.', 'A lifelong friendship unfolds in 19th-century China.'),
(27, 'Shanghai Girls', '9780812980535', '2009-01-01', 'assets/books/00000027.epub', 'assets/images/00000027.jpg', 'Two sisters flee war-torn China for America.', 'Two sisters flee war-torn China for America.'),
(28, 'Dreams of Joy', '9781400067126', '2011-01-01', 'assets/books/00000028.epub', 'assets/images/00000028.jpg', 'A daughter searches for identity in Maoist China.', 'A daughter searches for identity in Maoist China.'),
(29, 'China Dolls', '9781400067119', '2014-01-01', 'assets/books/00000029.epub', 'assets/images/00000029.jpg', 'Friendship and betrayal among performers in WWII.', 'Friendship and betrayal among performers in WWII.'),
(30, 'The Tea Girl of Hummingbird Lane', '9781501154827', '2017-01-01', 'assets/books/00000030.epub', 'assets/images/00000030.jpg', 'A mother and daughter separated by culture and adoption.', 'A mother and daughter separated by culture and adoption.'),
(31, 'A Game of Thrones', '9780553103540', '1996-01-01', 'assets/books/00000031.epub', 'assets/images/00000031.jpg', 'Noble families vie for control of the Iron Throne.', 'Noble families vie for control of the Iron Throne.'),
(32, 'A Clash of Kings', '9780553108033', '1998-01-01', 'assets/books/00000032.epub', 'assets/images/00000032.jpg', 'Civil war erupts across the Seven Kingdoms.', 'Civil war erupts across the Seven Kingdoms.'),
(33, 'A Storm of Swords', '9780553106633', '2000-01-01', 'assets/books/00000033.epub', 'assets/images/00000033.jpg', 'Betrayals and battles reshape the realm.', 'Betrayals and battles reshape the realm.'),
(34, 'A Feast for Crows', '9780553801507', '2005-01-01', 'assets/books/00000034.epub', 'assets/images/00000034.jpg', 'Aftermath of war brings political intrigue.', 'Aftermath of war brings political intrigue.'),
(35, 'A Dance with Dragons', '9780553801477', '2011-01-01', 'assets/books/00000035.epub', 'assets/images/00000035.jpg', 'Dragons rise as new threats emerge.', 'Dragons rise as new threats emerge.'),
(36, 'Fourth Wing', '9781649374042', '2023-01-01', 'assets/books/00000036.epub', 'assets/images/00000036.jpg', 'A young woman enters a deadly dragon rider academy.', 'A young woman enters a deadly dragon rider academy.'),
(37, 'Iron Flame', '9781649374172', '2023-01-01', 'assets/books/00000037.epub', 'assets/images/00000037.jpg', 'War intensifies as secrets are revealed.', 'War intensifies as secrets are revealed.'),
(38, 'Onyx Storm', '9781649376862', '2025-01-01', 'assets/books/00000038.epub', 'assets/images/00000038.jpg', 'The conflict reaches a breaking point.', 'The conflict reaches a breaking point.'),
(39, 'The Count of Monte Cristo', '9780140449266', '1844-01-01', 'assets/books/00000039.epub', 'assets/images/00000039.jpg', 'A man seeks revenge after wrongful imprisonment.', 'A man seeks revenge after wrongful imprisonment.'),
(40, 'Memoirs of a Geisha', '9780679781585', '1997-01-01', 'assets/books/00000040.epub', 'assets/images/00000040.jpg', 'A geisha recounts her life in prewar Japan.', 'A geisha recounts her life in prewar Japan.'),
(41, 'A Good Girl\'s Guide to Murder', '9781405293181', '2019-01-01', 'assets/books/00000041.epub', 'assets/images/00000041.jpg', 'A student investigates a closed murder case.', 'A student investigates a closed murder case.'),
(42, 'Good Girl, Bad Blood', '9781405297752', '2020-01-01', 'assets/books/00000042.epub', 'assets/images/00000042.jpg', 'A disappearance pulls Pip back into danger.', 'A disappearance pulls Pip back into danger.'),
(43, 'As Good As Dead', '9781405298605', '2021-01-01', 'assets/books/00000043.epub', 'assets/images/00000043.jpg', 'A stalker turns Pip’s life into a nightmare.', 'A stalker turns Pip’s life into a nightmare.'),
(44, 'The Magic of Recluce', '9780812506469', '1991-01-01', 'assets/books/00000044.epub', 'assets/images/00000044.jpg', 'A young mage learns balance between chaos and order.', 'A young mage learns balance between chaos and order.'),
(45, 'The Towers of the Sunset', '9780812507473', '1992-01-01', 'assets/books/00000045.epub', 'assets/images/00000045.jpg', 'A prince builds a new empire in exile.', 'A prince builds a new empire in exile.'),
(46, 'The Magic Engineer', '9780812514624', '1994-01-01', 'assets/books/00000046.epub', 'assets/images/00000046.jpg', 'An engineer uses magic to survive political conflict.', 'An engineer uses magic to survive political conflict.'),
(47, 'The Last Wish', '9780316029186', '1993-01-01', 'assets/books/00000047.epub', 'assets/images/00000047.jpg', 'Short stories introducing Geralt the monster hunter.', 'Short stories introducing Geralt the monster hunter.'),
(48, 'Sword of Destiny', '9780316029193', '1992-01-01', 'assets/books/00000048.epub', 'assets/images/00000048.jpg', 'More tales exploring destiny and relationships.', 'More tales exploring destiny and relationships.'),
(49, 'Blood of Elves', '9780316029209', '1994-01-01', 'assets/books/00000049.epub', 'assets/images/00000049.jpg', 'Ciri begins her training as war looms.', 'Ciri begins her training as war looms.'),
(50, 'Time of Contempt', '9780316029216', '1995-01-01', 'assets/books/00000050.epub', 'assets/images/00000050.jpg', 'Political tensions explode into chaos.', 'Political tensions explode into chaos.'),
(51, 'Baptism of Fire', '9780316029223', '1996-01-01', 'assets/books/00000051.epub', 'assets/images/00000051.jpg', 'Geralt forms a group to rescue Ciri.', 'Geralt forms a group to rescue Ciri.'),
(52, 'The Tower of the Swallow', '9780316029230', '1997-01-01', 'assets/books/00000052.epub', 'assets/images/00000052.jpg', 'Ciri struggles to survive alone.', 'Ciri struggles to survive alone.'),
(53, 'Lady of the Lake', '9780316029247', '1999-01-01', 'assets/books/00000053.epub', 'assets/images/00000053.jpg', 'The saga concludes with war and destiny fulfilled.', 'The saga concludes with war and destiny fulfilled.'),
(54, 'Season of Storms', '9780316273718', '2013-01-01', 'assets/books/00000054.epub', 'assets/images/00000054.jpg', 'A standalone adventure of Geralt.', 'A standalone adventure of Geralt.'),
(55, 'Elantris', '9780765350374', '2005-05-01', 'assets/books/00000055.epub', 'assets/images/00000055.jpg', 'Elantris was the capital of Arelon: gigantic, beautiful, literally radiant, filled with benevolent beings who used their powerful magical abilities for the benefit of all. Yet each of these demigods was once an ordinary person until touched by the mysterious transforming power of the Shaod. Ten years ago, without warning, the magic failed. Elantrians became wizened, leper-like, powerless creatures, and Elantris itself dark, filthy, and crumbling.\n\nArelon\'s new capital, Kae, crouches in the shadow of Elantris. Princess Sarene of Teod arrives for a marriage of state with Crown Prince Raoden, hoping—based on their correspondence—to also find love. She finds instead that Raoden has died and she is considered his widow. Both Teod and Arelon are under threat as the last remaining holdouts against the imperial ambitions of the ruthless religious fanatics of Fjordell. So Sarene decides to use her new status to counter the machinations of Hrathen, a Fjordell high priest who has come to Kae to convert Arelon and claim it for his emperor and his god.\n\nBut neither Sarene nor Hrathen suspect the truth about Prince Raoden. Stricken by the same curse that ruined Elantris, Raoden was secretly exiled by his father to the dark city. His struggle to help the wretches trapped there begins a series of events that will bring hope to Arelon, and perhaps reveal the secret of Elantris itself.\n\nA rare epic fantasy that doesn\'t recycle the classics and that is a complete and satisfying story in one volume, Elantris is fleet and fun, full of surprises and characters to care about. It\'s also the wonderful debut of a welcome new star in the constellation of fantasy.', 'A fallen magical city hides secrets that may save a kingdom.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_authors`
--

CREATE TABLE `books_authors` (
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `author_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_authors`
--

INSERT INTO `books_authors` (`book_id`, `author_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 2),
(9, 2),
(10, 2),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 4),
(17, 5),
(18, 5),
(19, 5),
(20, 6),
(21, 6),
(22, 6),
(23, 7),
(24, 7),
(25, 7),
(26, 8),
(27, 8),
(28, 8),
(29, 8),
(30, 8),
(31, 9),
(32, 9),
(33, 9),
(34, 9),
(35, 9),
(36, 10),
(37, 10),
(38, 10),
(39, 11),
(40, 12),
(41, 13),
(42, 13),
(43, 13),
(44, 14),
(45, 14),
(46, 14),
(47, 15),
(48, 15),
(49, 15),
(50, 15),
(51, 15),
(52, 15),
(53, 15),
(54, 15),
(55, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_genres`
--

CREATE TABLE `books_genres` (
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `genre_id` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_genres`
--

INSERT INTO `books_genres` (`book_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 15),
(6, 1),
(6, 2),
(6, 3),
(6, 12),
(7, 1),
(7, 2),
(7, 3),
(7, 15),
(8, 3),
(8, 4),
(8, 6),
(8, 7),
(9, 3),
(9, 6),
(9, 7),
(10, 6),
(10, 7),
(10, 15),
(11, 2),
(11, 8),
(11, 11),
(12, 2),
(12, 8),
(12, 11),
(13, 2),
(13, 8),
(13, 14),
(14, 2),
(14, 8),
(15, 2),
(15, 8),
(16, 8),
(16, 11),
(16, 12),
(17, 4),
(17, 6),
(17, 7),
(18, 6),
(18, 7),
(18, 15),
(19, 6),
(19, 7),
(19, 15),
(20, 1),
(20, 4),
(20, 9),
(21, 1),
(21, 9),
(22, 1),
(22, 9),
(22, 15),
(23, 1),
(23, 4),
(23, 8),
(24, 1),
(24, 8),
(24, 10),
(25, 1),
(25, 8),
(25, 15),
(26, 8),
(26, 10),
(26, 11),
(27, 8),
(27, 10),
(28, 8),
(28, 11),
(29, 8),
(29, 11),
(30, 8),
(30, 11),
(31, 1),
(31, 9),
(31, 15),
(32, 1),
(32, 9),
(32, 15),
(33, 1),
(33, 9),
(33, 15),
(34, 1),
(34, 9),
(34, 14),
(35, 1),
(35, 9),
(35, 15),
(36, 1),
(36, 4),
(36, 10),
(37, 1),
(37, 10),
(37, 15),
(38, 1),
(38, 10),
(38, 15),
(39, 8),
(39, 10),
(40, 8),
(40, 10),
(40, 11),
(41, 3),
(41, 12),
(41, 13),
(42, 12),
(42, 13),
(43, 12),
(43, 13),
(43, 14),
(44, 1),
(44, 9),
(45, 1),
(45, 9),
(46, 1),
(46, 9),
(47, 1),
(47, 4),
(47, 9),
(48, 1),
(48, 9),
(49, 1),
(49, 9),
(50, 1),
(50, 9),
(50, 15),
(51, 1),
(51, 4),
(51, 9),
(52, 1),
(52, 9),
(53, 1),
(53, 9),
(53, 15),
(54, 1),
(54, 9),
(55, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_series`
--

CREATE TABLE `books_series` (
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `series_id` mediumint(8) UNSIGNED NOT NULL,
  `series_order` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_series`
--

INSERT INTO `books_series` (`book_id`, `series_id`, `series_order`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 1),
(9, 2, 2),
(10, 2, 3),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 3, 4),
(15, 3, 5),
(17, 4, 1),
(18, 4, 2),
(19, 4, 3),
(20, 5, 1),
(21, 5, 2),
(22, 5, 3),
(23, 6, 1),
(24, 6, 2),
(25, 6, 3),
(31, 7, 1),
(32, 7, 2),
(33, 7, 3),
(34, 7, 4),
(35, 7, 5),
(36, 8, 1),
(37, 8, 2),
(38, 8, 3),
(41, 9, 1),
(42, 9, 2),
(43, 9, 3),
(44, 10, 1),
(45, 10, 2),
(46, 10, 3),
(47, 11, 1),
(48, 11, 2),
(49, 11, 3),
(50, 11, 4),
(51, 11, 5),
(52, 11, 6),
(53, 11, 7),
(54, 11, 8),
(55, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books_similar`
--

CREATE TABLE `books_similar` (
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `similar_book_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books_similar`
--

INSERT INTO `books_similar` (`book_id`, `similar_book_id`) VALUES
(1, 2),
(1, 3),
(1, 20),
(1, 31),
(1, 36),
(1, 47),
(2, 3),
(2, 4),
(3, 4),
(4, 5),
(5, 6),
(5, 41),
(6, 7),
(8, 9),
(8, 17),
(8, 36),
(9, 10),
(9, 17),
(10, 19),
(11, 12),
(11, 26),
(11, 39),
(12, 13),
(13, 14),
(14, 15),
(16, 41),
(17, 18),
(18, 19),
(20, 21),
(20, 31),
(20, 44),
(20, 47),
(21, 22),
(23, 24),
(24, 25),
(26, 27),
(26, 40),
(27, 28),
(28, 29),
(29, 30),
(31, 32),
(31, 44),
(31, 47),
(32, 33),
(33, 34),
(34, 35),
(36, 37),
(37, 38),
(39, 40),
(41, 42),
(42, 43),
(44, 45),
(44, 47),
(45, 46),
(47, 48),
(48, 49),
(49, 50),
(50, 51),
(51, 52),
(52, 53),
(53, 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_likes`
--

CREATE TABLE `comments_likes` (
  `review_user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `comment_user_id` mediumint(8) UNSIGNED NOT NULL,
  `like_user_id` mediumint(8) UNSIGNED NOT NULL,
  `like_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments_likes`
--

INSERT INTO `comments_likes` (`review_user_id`, `book_id`, `comment_user_id`, `like_user_id`, `like_date`) VALUES
(1, 1, 2, 3, '2026-04-16 08:09:56'),
(2, 17, 3, 1, '2026-04-16 08:09:56'),
(3, 31, 1, 2, '2026-04-16 08:09:56'),
(4, 11, 5, 3, '2026-04-16 08:09:56'),
(5, 41, 1, 2, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `ISO3` char(3) NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`ISO3`, `country_name`) VALUES
('AFG', 'Afghanistan'),
('ALB', 'Albania'),
('DZA', 'Algeria'),
('AND', 'Andorra'),
('AGO', 'Angola'),
('ATG', 'Antigua and Barbuda'),
('ARG', 'Argentina'),
('ARM', 'Armenia'),
('AUS', 'Australia'),
('AUT', 'Austria'),
('AZE', 'Azerbaijan'),
('BHS', 'Bahamas'),
('BHR', 'Bahrain'),
('BGD', 'Bangladesh'),
('BRB', 'Barbados'),
('BLR', 'Belarus'),
('BEL', 'Belgium'),
('BLZ', 'Belize'),
('BEN', 'Benin'),
('BTN', 'Bhutan'),
('BOL', 'Bolivia'),
('BIH', 'Bosnia and Herzegovina'),
('BWA', 'Botswana'),
('BRA', 'Brazil'),
('BRN', 'Brunei'),
('BGR', 'Bulgaria'),
('BFA', 'Burkina Faso'),
('BDI', 'Burundi'),
('CPV', 'Cabo Verde'),
('KHM', 'Cambodia'),
('CMR', 'Cameroon'),
('CAN', 'Canada'),
('CAF', 'Central African Republic'),
('TCD', 'Chad'),
('CHL', 'Chile'),
('CHN', 'China'),
('COL', 'Colombia'),
('COM', 'Comoros'),
('COG', 'Congo'),
('COD', 'Congo (Democratic Republic)'),
('CRI', 'Costa Rica'),
('CIV', 'Côte d\'Ivoire'),
('HRV', 'Croatia'),
('CUB', 'Cuba'),
('CYP', 'Cyprus'),
('CZE', 'Czech Republic'),
('DNK', 'Denmark'),
('DJI', 'Djibouti'),
('DMA', 'Dominica'),
('DOM', 'Dominican Republic'),
('ECU', 'Ecuador'),
('EGY', 'Egypt'),
('SLV', 'El Salvador'),
('GNQ', 'Equatorial Guinea'),
('ERI', 'Eritrea'),
('EST', 'Estonia'),
('SWZ', 'Eswatini'),
('ETH', 'Ethiopia'),
('FJI', 'Fiji'),
('FIN', 'Finland'),
('FRA', 'France'),
('GAB', 'Gabon'),
('GMB', 'Gambia'),
('GEO', 'Georgia'),
('DEU', 'Germany'),
('GHA', 'Ghana'),
('GRC', 'Greece'),
('GRD', 'Grenada'),
('GTM', 'Guatemala'),
('GIN', 'Guinea'),
('GNB', 'Guinea-Bissau'),
('GUY', 'Guyana'),
('HTI', 'Haiti'),
('HND', 'Honduras'),
('HUN', 'Hungary'),
('ISL', 'Iceland'),
('IND', 'India'),
('IDN', 'Indonesia'),
('IRN', 'Iran'),
('IRQ', 'Iraq'),
('IRL', 'Ireland'),
('ISR', 'Israel'),
('ITA', 'Italy'),
('JAM', 'Jamaica'),
('JPN', 'Japan'),
('JOR', 'Jordan'),
('KAZ', 'Kazakhstan'),
('KEN', 'Kenya'),
('KIR', 'Kiribati'),
('KWT', 'Kuwait'),
('KGZ', 'Kyrgyzstan'),
('LAO', 'Laos'),
('LVA', 'Latvia'),
('LBN', 'Lebanon'),
('LSO', 'Lesotho'),
('LBR', 'Liberia'),
('LBY', 'Libya'),
('LIE', 'Liechtenstein'),
('LTU', 'Lithuania'),
('LUX', 'Luxembourg'),
('MDG', 'Madagascar'),
('MWI', 'Malawi'),
('MYS', 'Malaysia'),
('MDV', 'Maldives'),
('MLI', 'Mali'),
('MLT', 'Malta'),
('MHL', 'Marshall Islands'),
('MRT', 'Mauritania'),
('MUS', 'Mauritius'),
('MEX', 'Mexico'),
('FSM', 'Micronesia'),
('MDA', 'Moldova'),
('MCO', 'Monaco'),
('MNG', 'Mongolia'),
('MNE', 'Montenegro'),
('MAR', 'Morocco'),
('MOZ', 'Mozambique'),
('MMR', 'Myanmar'),
('NAM', 'Namibia'),
('NRU', 'Nauru'),
('NPL', 'Nepal'),
('NLD', 'Netherlands'),
('NZL', 'New Zealand'),
('NIC', 'Nicaragua'),
('NER', 'Niger'),
('NGA', 'Nigeria'),
('PRK', 'North Korea'),
('MKD', 'North Macedonia'),
('NOR', 'Norway'),
('OMN', 'Oman'),
('PAK', 'Pakistan'),
('PLW', 'Palau'),
('PAN', 'Panama'),
('PNG', 'Papua New Guinea'),
('PRY', 'Paraguay'),
('PER', 'Peru'),
('PHL', 'Philippines'),
('POL', 'Poland'),
('PRT', 'Portugal'),
('QAT', 'Qatar'),
('ROU', 'Romania'),
('RUS', 'Russia'),
('RWA', 'Rwanda'),
('KNA', 'Saint Kitts and Nevis'),
('LCA', 'Saint Lucia'),
('VCT', 'Saint Vincent and the Grenadines'),
('WSM', 'Samoa'),
('SMR', 'San Marino'),
('STP', 'Sao Tome and Principe'),
('SAU', 'Saudi Arabia'),
('SEN', 'Senegal'),
('SRB', 'Serbia'),
('SYC', 'Seychelles'),
('SLE', 'Sierra Leone'),
('SGP', 'Singapore'),
('SVK', 'Slovakia'),
('SVN', 'Slovenia'),
('SLB', 'Solomon Islands'),
('SOM', 'Somalia'),
('ZAF', 'South Africa'),
('KOR', 'South Korea'),
('SSD', 'South Sudan'),
('ESP', 'Spain'),
('LKA', 'Sri Lanka'),
('SDN', 'Sudan'),
('SUR', 'Suriname'),
('SWE', 'Sweden'),
('CHE', 'Switzerland'),
('SYR', 'Syria'),
('TJK', 'Tajikistan'),
('TZA', 'Tanzania'),
('THA', 'Thailand'),
('TLS', 'Timor-Leste'),
('TGO', 'Togo'),
('TON', 'Tonga'),
('TTO', 'Trinidad and Tobago'),
('TUN', 'Tunisia'),
('TUR', 'Turkey'),
('TKM', 'Turkmenistan'),
('TUV', 'Tuvalu'),
('UGA', 'Uganda'),
('UKR', 'Ukraine'),
('ARE', 'United Arab Emirates'),
('GBR', 'United Kingdom'),
('USA', 'United States'),
('URY', 'Uruguay'),
('UZB', 'Uzbekistan'),
('VUT', 'Vanuatu'),
('VAT', 'Vatican City'),
('VEN', 'Venezuela'),
('VNM', 'Vietnam'),
('YEM', 'Yemen'),
('ZMB', 'Zambia'),
('ZWE', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genres`
--

CREATE TABLE `genres` (
  `genre_id` smallint(5) UNSIGNED NOT NULL,
  `genre_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(4, 'Adventure'),
(16, 'Classic'),
(14, 'Crime'),
(11, 'Drama'),
(6, 'Dystopian'),
(9, 'Epic Fantasy'),
(1, 'Fantasy'),
(2, 'Fiction'),
(8, 'Historical Fiction'),
(5, 'Magic'),
(12, 'Mystery'),
(10, 'Romance'),
(7, 'Science Fiction'),
(13, 'Thriller'),
(15, 'War'),
(3, 'Young Adult');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews_likes`
--

CREATE TABLE `reviews_likes` (
  `review_user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `like_user_id` mediumint(8) UNSIGNED NOT NULL,
  `like_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reviews_likes`
--

INSERT INTO `reviews_likes` (`review_user_id`, `book_id`, `like_user_id`, `like_date`) VALUES
(1, 1, 2, '2026-04-16 08:09:56'),
(1, 1, 3, '2026-04-16 08:09:56'),
(2, 17, 1, '2026-04-16 08:09:56'),
(3, 31, 2, '2026-04-16 08:09:56'),
(4, 11, 1, '2026-04-16 08:09:56'),
(5, 41, 3, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series`
--

CREATE TABLE `series` (
  `series_id` mediumint(8) UNSIGNED NOT NULL,
  `series_name` varchar(100) NOT NULL,
  `series_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `series`
--

INSERT INTO `series` (`series_id`, `series_name`, `series_description`) VALUES
(1, 'Harry Potter', 'Wizarding world saga'),
(2, 'The Hunger Games', 'Dystopian trilogy'),
(3, 'Kingsbridge', 'Pillars of the Earth saga'),
(4, 'Red Rising', 'Sci-fi saga'),
(5, 'Mistborn', 'Fantasy saga'),
(6, 'Tales of the Otori', 'Feudal Japan inspired fantasy trilogy'),
(7, 'A Song of Ice and Fire', 'Epic fantasy saga (Game of Thrones)'),
(8, 'The Empyrean', 'Fantasy saga by Rebecca Yarros'),
(9, 'A Good Girl\'s Guide to Murder', 'YA mystery trilogy'),
(10, 'Saga of Recluce', 'Fantasy saga by Modesitt'),
(11, 'The Witcher', 'Fantasy saga about Geralt of Rivia'),
(12, 'Elantris Series', 'Elantris and The Emperor\'s Soul take place in the same world, though in very different regions and with only a few ties to each other. You don’t have to have read Elantris to appreciate The Emperor\'s Soul, although if you have, you will be able to see ties between the magic systems.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `date_birth` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `active` tinyint(1) DEFAULT 1,
  `ISO3` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `user_password`, `date_birth`, `created_at`, `active`, `ISO3`) VALUES
(1, 'alice_reader', 'alice@example.com', '$2y$10$esHj2KwpEVU0rKhzBI3whumjdJFJ/2roOs.ymmLqYT0Hi8bBLE6zi', '1995-04-12', '2026-06-29 13:43:38', 1, 'ESP'),
(2, 'bookworm_john', 'john@example.com', '$2y$10$esHj2KwpEVU0rKhzBI3whumjdJFJ/2roOs.ymmLqYT0Hi8bBLE6zi', '1990-09-23', '2026-06-29 13:43:43', 1, 'USA'),
(3, 'fantasy_lover', 'emma@example.com', '$2y$10$esHj2KwpEVU0rKhzBI3whumjdJFJ/2roOs.ymmLqYT0Hi8bBLE6zi', '1998-01-05', '2026-06-29 13:43:47', 1, 'GBR'),
(4, 'history_buff', 'li@example.com', '$2y$10$esHj2KwpEVU0rKhzBI3whumjdJFJ/2roOs.ymmLqYT0Hi8bBLE6zi', '1985-07-19', '2026-06-29 13:43:50', 1, 'CHN'),
(5, 'mystery_guy', 'carlos@example.com', '$2y$10$esHj2KwpEVU0rKhzBI3whumjdJFJ/2roOs.ymmLqYT0Hi8bBLE6zi', '1992-11-30', '2026-06-29 13:43:53', 1, 'MEX'),
(6, 'debora_iori', 'dedebobo@example.com', '$2y$10$5QO2Fr0IBuDjDjNZ1f5a2OgDtrIWahCjMPrWojUV6RyB62wO5lgIy', '1994-04-16', '2026-06-29 13:38:22', 1, 'ITA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_authors_correspondence`
--

CREATE TABLE `users_authors_correspondence` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `author_id` mediumint(8) UNSIGNED NOT NULL,
  `verification_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_authors_correspondence`
--

INSERT INTO `users_authors_correspondence` (`user_id`, `author_id`, `verification_date`) VALUES
(4, 12, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_books_favoritelist`
--

CREATE TABLE `users_books_favoritelist` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_books_favoritelist`
--

INSERT INTO `users_books_favoritelist` (`user_id`, `book_id`, `created_at`) VALUES
(1, 1, '2026-04-16 08:09:56'),
(2, 17, '2026-04-16 08:09:56'),
(3, 31, '2026-04-16 08:09:56'),
(4, 11, '2026-04-16 08:09:56'),
(5, 41, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_books_favorite_genres`
--

CREATE TABLE `users_books_favorite_genres` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `genre_id` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_books_favorite_genres`
--

INSERT INTO `users_books_favorite_genres` (`user_id`, `genre_id`, `created_at`) VALUES
(1, 1, '2026-04-16 08:09:56'),
(1, 3, '2026-04-16 08:09:56'),
(2, 6, '2026-04-16 08:09:56'),
(2, 7, '2026-04-16 08:09:56'),
(3, 1, '2026-04-16 08:09:56'),
(3, 9, '2026-04-16 08:09:56'),
(4, 8, '2026-04-16 08:09:56'),
(5, 12, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_books_rate`
--

CREATE TABLE `users_books_rate` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL CHECK (`rating` between 1 and 5),
  `rate_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_books_rate`
--

INSERT INTO `users_books_rate` (`user_id`, `book_id`, `rating`, `rate_date`) VALUES
(1, 1, 5, '2026-04-16 08:09:56'),
(1, 8, 4, '2026-04-16 08:09:56'),
(1, 10, 5, '2024-12-18 09:47:14'),
(1, 39, 3, '2026-04-16 09:15:33'),
(1, 47, 3, '2024-03-30 09:47:14'),
(2, 1, 5, '2022-08-10 08:47:14'),
(2, 2, 5, '2022-09-10 08:47:14'),
(2, 17, 5, '2026-04-16 08:09:56'),
(2, 20, 4, '2026-04-16 08:09:56'),
(3, 2, 5, '2022-10-10 08:47:14'),
(3, 31, 5, '2026-04-16 08:09:56'),
(3, 47, 4, '2026-04-16 08:09:56'),
(4, 8, 5, '2024-11-14 09:47:14'),
(4, 11, 5, '2026-04-16 08:09:56'),
(4, 39, 5, '2026-04-16 08:09:56'),
(5, 2, 5, '2026-04-16 08:09:56'),
(5, 10, 5, '2026-04-16 08:09:56'),
(5, 41, 4, '2026-04-16 08:09:56'),
(6, 1, 5, '2026-04-16 08:09:56'),
(6, 2, 5, '2022-04-10 08:47:14'),
(6, 8, 5, '2024-04-14 08:47:14'),
(6, 10, 5, '2024-06-18 08:47:14'),
(6, 39, 4, '2019-04-08 08:47:14'),
(6, 47, 3, '2024-04-30 08:47:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_books_readlist`
--

CREATE TABLE `users_books_readlist` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `finished` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_books_readlist`
--

INSERT INTO `users_books_readlist` (`user_id`, `book_id`, `finished`, `created_at`) VALUES
(1, 1, 1, '2026-04-16 08:09:56'),
(1, 8, 0, '2026-04-16 09:14:58'),
(2, 17, 1, '2026-04-16 08:09:56'),
(2, 20, 1, '2026-04-16 08:09:56'),
(3, 31, 1, '2026-04-16 08:09:56'),
(3, 47, 1, '2026-04-16 08:09:56'),
(3, 55, 1, '2026-04-16 08:09:56'),
(4, 11, 1, '2026-04-16 08:09:56'),
(4, 39, 1, '2026-04-16 08:09:56'),
(5, 10, 1, '2026-04-16 08:09:56'),
(5, 41, 1, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_books_review`
--

CREATE TABLE `users_books_review` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `review_text` text NOT NULL,
  `review_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_books_review`
--

INSERT INTO `users_books_review` (`user_id`, `book_id`, `review_text`, `review_date`) VALUES
(1, 1, 'Magical and nostalgic, a perfect start to the series.', '2026-04-16 08:09:56'),
(2, 17, 'Amazing world-building and intense story.', '2026-04-16 08:09:56'),
(3, 31, 'Complex politics and unforgettable characters.', '2026-04-16 08:09:56'),
(4, 11, 'A masterpiece of historical fiction.', '2026-04-16 08:09:56'),
(5, 41, 'Great mystery with lots of twists.', '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_books_wishlist`
--

CREATE TABLE `users_books_wishlist` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_books_wishlist`
--

INSERT INTO `users_books_wishlist` (`user_id`, `book_id`, `created_at`) VALUES
(1, 31, '2026-04-16 08:09:56'),
(2, 1, '2026-04-16 08:09:56'),
(3, 20, '2026-04-16 08:09:56'),
(4, 30, '2026-04-16 08:09:56'),
(5, 47, '2026-04-16 08:09:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_followers`
--

CREATE TABLE `users_followers` (
  `follower_id` mediumint(8) UNSIGNED NOT NULL,
  `followed_id` mediumint(8) UNSIGNED NOT NULL,
  `action_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action_type` enum('follow','unfollow') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_followers`
--

INSERT INTO `users_followers` (`follower_id`, `followed_id`, `action_date`, `action_type`) VALUES
(1, 2, '2026-04-16 08:09:56', 'follow'),
(1, 3, '2026-04-16 08:09:56', 'follow'),
(2, 3, '2026-04-16 08:09:56', 'follow'),
(3, 1, '2026-04-16 08:09:56', 'follow'),
(4, 1, '2026-04-16 08:09:56', 'follow'),
(5, 1, '2026-04-16 08:09:56', 'follow'),
(5, 2, '2026-04-16 08:09:56', 'follow'),
(6, 1, '2026-04-15 12:16:36', 'follow'),
(6, 1, '2026-04-16 12:16:36', 'unfollow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_reviews_comments`
--

CREATE TABLE `users_reviews_comments` (
  `review_user_id` mediumint(8) UNSIGNED NOT NULL,
  `book_id` mediumint(8) UNSIGNED NOT NULL,
  `comment_user_id` mediumint(8) UNSIGNED NOT NULL,
  `comment_text` text NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_reviews_comments`
--

INSERT INTO `users_reviews_comments` (`review_user_id`, `book_id`, `comment_user_id`, `comment_text`, `comment_date`) VALUES
(1, 1, 2, 'Totally agree, loved it!', '2026-04-16 08:09:56'),
(2, 17, 3, 'Red Rising is incredible!', '2026-04-16 08:09:56'),
(3, 31, 1, 'Best fantasy series ever.', '2026-04-16 08:09:56'),
(4, 11, 5, 'I should read this soon.', '2026-04-16 08:09:56'),
(5, 41, 1, 'Adding this to my list.', '2026-04-16 08:09:56');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `FK_AUTHORS_ISO3` (`ISO3`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_name` (`book_name`),
  ADD UNIQUE KEY `isbn13` (`isbn13`),
  ADD UNIQUE KEY `isbn13_2` (`isbn13`);

--
-- Indices de la tabla `books_authors`
--
ALTER TABLE `books_authors`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `FK_BOOKS_AUTHORS_author_id` (`author_id`);

--
-- Indices de la tabla `books_genres`
--
ALTER TABLE `books_genres`
  ADD PRIMARY KEY (`book_id`,`genre_id`),
  ADD KEY `FK_BOOKS_GENRES_genre_id` (`genre_id`);

--
-- Indices de la tabla `books_series`
--
ALTER TABLE `books_series`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `series_id` (`series_id`,`series_order`);

--
-- Indices de la tabla `books_similar`
--
ALTER TABLE `books_similar`
  ADD PRIMARY KEY (`book_id`,`similar_book_id`),
  ADD KEY `FK_BOOKS_SIMILAR_similar_book_id` (`similar_book_id`);

--
-- Indices de la tabla `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD PRIMARY KEY (`review_user_id`,`book_id`,`comment_user_id`,`like_user_id`),
  ADD KEY `FK_COMMENTS_LIKES_like_user_id` (`like_user_id`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`ISO3`),
  ADD UNIQUE KEY `country_name` (`country_name`);

--
-- Indices de la tabla `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indices de la tabla `reviews_likes`
--
ALTER TABLE `reviews_likes`
  ADD PRIMARY KEY (`review_user_id`,`book_id`,`like_user_id`),
  ADD KEY `FK_REVIEWS_LIKES_like_user_id` (`like_user_id`);

--
-- Indices de la tabla `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`series_id`),
  ADD UNIQUE KEY `series_name` (`series_name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FK_USERS_ISO3` (`ISO3`);

--
-- Indices de la tabla `users_authors_correspondence`
--
ALTER TABLE `users_authors_correspondence`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `author_id` (`author_id`);

--
-- Indices de la tabla `users_books_favoritelist`
--
ALTER TABLE `users_books_favoritelist`
  ADD PRIMARY KEY (`user_id`,`book_id`),
  ADD KEY `FK_USERS_BOOKS_FAVORITELIST_book_id` (`book_id`);

--
-- Indices de la tabla `users_books_favorite_genres`
--
ALTER TABLE `users_books_favorite_genres`
  ADD PRIMARY KEY (`user_id`,`genre_id`),
  ADD KEY `FK_USERS_BOOKS_FAVORITE_GENRES_genre_id` (`genre_id`);

--
-- Indices de la tabla `users_books_rate`
--
ALTER TABLE `users_books_rate`
  ADD PRIMARY KEY (`user_id`,`book_id`),
  ADD KEY `FK_USERS_BOOKS_RATE_book_id` (`book_id`);

--
-- Indices de la tabla `users_books_readlist`
--
ALTER TABLE `users_books_readlist`
  ADD PRIMARY KEY (`user_id`,`book_id`),
  ADD KEY `FK_USERS_BOOKS_READLIST_book_id` (`book_id`);

--
-- Indices de la tabla `users_books_review`
--
ALTER TABLE `users_books_review`
  ADD PRIMARY KEY (`user_id`,`book_id`);

--
-- Indices de la tabla `users_books_wishlist`
--
ALTER TABLE `users_books_wishlist`
  ADD PRIMARY KEY (`user_id`,`book_id`),
  ADD KEY `FK_USERS_BOOKS_WISHLIST_book_id` (`book_id`);

--
-- Indices de la tabla `users_followers`
--
ALTER TABLE `users_followers`
  ADD PRIMARY KEY (`follower_id`,`followed_id`,`action_date`),
  ADD KEY `FK_USERS_FOLLOWERS_followed_id` (`followed_id`);

--
-- Indices de la tabla `users_reviews_comments`
--
ALTER TABLE `users_reviews_comments`
  ADD PRIMARY KEY (`review_user_id`,`book_id`,`comment_user_id`),
  ADD KEY `FK_USERS_REVIEWS_COMMENTS_comment_user_id` (`comment_user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `book_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `series`
--
ALTER TABLE `series`
  MODIFY `series_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `FK_AUTHORS_ISO3` FOREIGN KEY (`ISO3`) REFERENCES `countries` (`ISO3`);

--
-- Filtros para la tabla `books_authors`
--
ALTER TABLE `books_authors`
  ADD CONSTRAINT `FK_BOOKS_AUTHORS_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BOOKS_AUTHORS_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `books_genres`
--
ALTER TABLE `books_genres`
  ADD CONSTRAINT `FK_BOOKS_GENRES_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BOOKS_GENRES_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `books_series`
--
ALTER TABLE `books_series`
  ADD CONSTRAINT `FK_BOOKS_SERIES_BOOK_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BOOKS_SERIES_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `books_similar`
--
ALTER TABLE `books_similar`
  ADD CONSTRAINT `FK_BOOKS_SIMILAR_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BOOKS_SIMILAR_similar_book_id` FOREIGN KEY (`similar_book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD CONSTRAINT `FK_COMMENTS_LIKES_like_user_id` FOREIGN KEY (`like_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_COMMENTS_LIKES_review_user_id` FOREIGN KEY (`review_user_id`,`book_id`,`comment_user_id`) REFERENCES `users_reviews_comments` (`review_user_id`, `book_id`, `comment_user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reviews_likes`
--
ALTER TABLE `reviews_likes`
  ADD CONSTRAINT `FK_REVIEWS_LIKES_like_user_id` FOREIGN KEY (`like_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_REVIEWS_LIKES_review_user_id` FOREIGN KEY (`review_user_id`,`book_id`) REFERENCES `users_books_review` (`user_id`, `book_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_USERS_ISO3` FOREIGN KEY (`ISO3`) REFERENCES `countries` (`ISO3`);

--
-- Filtros para la tabla `users_authors_correspondence`
--
ALTER TABLE `users_authors_correspondence`
  ADD CONSTRAINT `FK_USERS_AUTHORS_CORRESPONDENCE_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_AUTHORS_CORRESPONDENCE_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_books_favoritelist`
--
ALTER TABLE `users_books_favoritelist`
  ADD CONSTRAINT `FK_USERS_BOOKS_FAVORITELIST_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_BOOKS_FAVORITELIST_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_books_favorite_genres`
--
ALTER TABLE `users_books_favorite_genres`
  ADD CONSTRAINT `FK_USERS_BOOKS_FAVORITE_GENRES_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_BOOKS_FAVORITE_GENRES_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_books_rate`
--
ALTER TABLE `users_books_rate`
  ADD CONSTRAINT `FK_USERS_BOOKS_RATE_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_BOOKS_RATE_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_books_readlist`
--
ALTER TABLE `users_books_readlist`
  ADD CONSTRAINT `FK_USERS_BOOKS_READLIST_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_BOOKS_READLIST_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_books_review`
--
ALTER TABLE `users_books_review`
  ADD CONSTRAINT `FK_USERS_BOOKS_REVIEW_user_id` FOREIGN KEY (`user_id`,`book_id`) REFERENCES `users_books_rate` (`user_id`, `book_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_books_wishlist`
--
ALTER TABLE `users_books_wishlist`
  ADD CONSTRAINT `FK_USERS_BOOKS_WISHLIST_book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_BOOKS_WISHLIST_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_followers`
--
ALTER TABLE `users_followers`
  ADD CONSTRAINT `FK_USERS_FOLLOWERS_followed_id` FOREIGN KEY (`followed_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_FOLLOWERS_follower_id` FOREIGN KEY (`follower_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_reviews_comments`
--
ALTER TABLE `users_reviews_comments`
  ADD CONSTRAINT `FK_USERS_REVIEWS_COMMENTS_comment_user_id` FOREIGN KEY (`comment_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_USERS_REVIEWS_COMMENTS_review_user_id` FOREIGN KEY (`review_user_id`,`book_id`) REFERENCES `users_books_review` (`user_id`, `book_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
