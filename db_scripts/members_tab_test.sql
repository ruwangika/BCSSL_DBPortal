-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 22, 2017 at 02:21 PM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bcssllk_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `members_tab`
--

CREATE TABLE `members_tab` (
  `ID` int(5) AUTO_INCREMENT UNIQUE KEY,
  `member_name` varchar(47) DEFAULT NULL,
  `DoB` date DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `NIC` varchar(10) DEFAULT NULL,
  `contactNo` varchar(16) DEFAULT NULL,
  `contactNo_extra` varchar(16) DEFAULT NULL,
  `email` varchar(41) DEFAULT NULL,
  `membership_no` varchar(41) DEFAULT NULL,
  `category` enum('general_1y','general_5y','school','foreign') DEFAULT NULL,
  `dateOfReg` date DEFAULT NULL,
  `receiptNo` int(11) DEFAULT NULL,
  `date_renewed` date DEFAULT NULL,
  `receiptNo_renewed` int(11) DEFAULT NULL,
  `member_status` enum('1','0','-1') NOT NULL DEFAULT '1',
  UNIQUE KEY (`NIC`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members_tab`
--

INSERT INTO `members_tab` (`member_name`, `DoB`, `gender`, `address`, `nic`, `contactNo`, `contactNo_extra`, `email`, `membership_no`, `category`, `dateOfReg`, `receiptNo`, `date_renewed`, `receiptNo_renewed`, `member_status`) VALUES
('Sanjeewa Seneviratne ', '1979-03-10', 'M', '84,28 Acres, Pahala Dambawinna, Welimada', '790704533v', '719053666', NULL, 'sp.seneviratne@gmail.com', 'G14010001', 'general_1y', '2014-01-25', 1, '2015-07-01', 53, '1'),
('R.H. Tharindu Ranasinghe', '1991-10-17', 'M', '46, Amu Waththa, Kandumulla, Ambagaspitiya', '912910890v', '779914227', NULL, 'tharindu2010ac@gmail.com', 'G14010002', 'general_1y', '2014-01-25', 2, NULL, 0, '1'),
('T.H.D. Shalika Solani', '1987-10-27', 'F', '363/A, Bopitiya, Pamunugama', '878011333v', '778231161', NULL, 'shalika.solani@yahoo.com', 'G14010003', 'general_1y', '2014-01-25', 3, NULL, 0, '1'),
('A.W. Amila Chanaka', '1984-04-06', 'M', '305, Keraminiya, Ambalangoda', '840970655v', '714466290', NULL, 'boiga_amila@yahoo.com', 'G14010004', 'general_1y', '2014-01-25', 3, NULL, 0, '1'),
('Indika Thushari', '1983-11-27', 'F', 'L56, Halpola, Pundaluoya', '838322131v', '717989221', NULL, 'pgit123@yahoo.com', 'G14010005', 'general_1y', '2014-01-25', 4, NULL, 0, '1'),
('K.D. Priyadarshanie', '1968-04-20', 'F', '71/5, School Avenue, Gangodawila, Nugegoda', '686110311v', '779664189', NULL, 'dammipriya@gmail.com', 'G14010006', 'general_1y', '2014-01-25', 5, NULL, 0, '1'),
('M.M. Casseer', '1956-03-13', 'M', '1038 B/3, Range Road, Hunupitiya, Wattala', '560732570v', '773054838', NULL, 'sam.casseer@yahoo.com', 'G14010007', 'general_1y', '2014-01-25', 6, NULL, 0, '1'),
('K.A. Nuwan Chathuranga Jayawardane', '1989-02-01', 'M', '242/2, Palle Morugama, Alawwa', '890320139v', '776715919', NULL, 'chathuranga.nuwan.ka@gmail.com', 'G14010008', 'general_1y', '2014-01-25', 7, '2015-06-01', 49, '1'),
('Gamage Pubudu Indika Perera', '1988-11-07', 'M', '13/3, Hokandara Rd, Pannipitiya', '883122283v', '777181000', NULL, 'pubuduindika@gmail.com', 'G14010009', 'general_1y', '2014-03-22', 8, NULL, 0, '1'),
('Iranga Shavinda Liyanage', '1989-12-30', 'M', '262/9,Thabiligasmulla Road, Makola', '893650318v', '713607888', NULL, 'iranga.liyanage@yahoo.com', 'G14030010', 'general_1y', '2014-03-22', 9, NULL, 0, '1'),
('Mahawithanage Trishan Chamara Perera', '1989-07-25', 'M', '454-1-B, St. Sebastian Mw, Emderamulla, Wattala', '892071187v', '771115565', NULL, 'trishan@sci.sjp.ac.lk', 'G14030011', 'general_1y', '2014-03-22', 10, '2015-07-01', 51, '1'),
('Imashi Opatha', '1981-03-28', 'F', '11/16, 1st Lane, Sri Bodhiraja Mw, Divulapitiya, Boralesgamuwa', '815880587v', '714569851', NULL, 'imashi.opatha@yahoo.com', 'G14030012', 'general_1y', '2014-03-22', 11, NULL, 0, '1'),
('Chathuranga Iroshan Deshapriya', '1989-08-20', 'M', '154/3, Gunarathne Mawatha, Makandana, Madapatha', '892330255v', '715519678', NULL, 'cideshapriya.jbase@gmail.com', 'G14050013', 'general_1y', '2014-05-31', 12, NULL, 0, '1'),
('Amila Prasanna Sumanapala', '1989-07-07', 'M', '02, Sama Mawatha, Boralesgamuwa', '891891440v', '715639774', NULL, 'apsumanapala@gmail.com', 'G14050014', 'general_1y', '2014-05-31', 13, '2015-05-01', 38, '1'),
('Kusum Fernando', '1964-09-01', 'M', '16, Bowitiya Pedesa, Sirimal Uyana, Ratmalana', '642452100v', '777772716', NULL, 'kusum.fernando@yahoo.com', 'G14050015', 'general_1y', '2014-05-31', 14, '2015-09-20', 0, '1'),
('Dilan Malaka Palliyaguruge', '1981-11-10', 'M', '87, Siyane Village, Maharagama, Mudungoda', '813152185v', '719876666', '719497635', 'dilan.palliyaguruge@gmail.com', 'G14050016', 'general_1y', '2014-05-31', 15, '2015-06-01', 42, '1'),
('Imaduwa Priyadarshana', '1968-09-14', 'M', '125/B/10, Kiribathgalawatta Road, Malabe', '682580402v', '777255793', NULL, 'imaduwa.m.r.p@gmail.com', 'G14050017', 'general_1y', '2014-05-31', 16, '2015-06-01', 40, '1'),
('H.D. Malith Gayan Hettiarchchi', '1982-03-09', 'M', '50/6, Raggahawatta, Kaduwela', '820691121v', '712411900', NULL, 'hdmalith@gmail.com', 'G14050018', 'general_1y', '2014-05-31', 17, NULL, 0, '1'),
('Himesh Dilruwan Jayasinghe', '1983-12-22', 'M', '762/A, Yatihena, Malwana', '833570838v', '718181225', NULL, 'himesh.jayasinghe1@gmail.com', 'G14050019', 'general_1y', '2014-05-31', 18, '2015-06-01', 45, '1'),
('Madhubhashini Jayawardena', '1962-03-18', 'F', '65, Oruthota Road, Gampaha', '625781000v', '777823630', '332224213', 'madhubhashini_jayawardena@yahoo.com', 'G14050020', 'general_1y', '2014-05-31', 19, '2015-10-01', 68, '1'),
('B.V.D. Kasun Pradeepa', '1982-09-18', 'M', '25A, Araliya Uyana, Alawila Road, Kalutara', '822624111v', '773504415', NULL, 'ants.nigra@gmail.com', 'G14050021', 'general_1y', '2014-05-31', 20, NULL, 0, '1'),
('Prathibha De Silva', '1982-12-10', 'F', '269, Meegahakovila Rd, Pinwatte, Panadura', '828453467v', '718231020', NULL, 'prathibha.desilva@gmail.com', 'G14060022', 'general_1y', '2014-06-29', 23, NULL, 0, '1'),
('G.H. Dilini Upeksha Gammudali', '1986-02-07', 'F', '196/4, Kegalla Road, Polgahawela', '865581203V', '717769952', NULL, 'rochidug@gmail.com', 'G14060023', 'general_1y', '2014-06-29', 29, '2015-07-01', 29, '1'),
('Ranamuka Kasun Bandara', '1986-07-30', 'M', '216/B, Bogahawatte Road, Thalahena, Malabe', '862120396v', '779019735', NULL, 'kasunranamuka@gmail.com', 'G14060024', 'general_1y', '2014-06-29', 30, NULL, 0, '1'),
('Lahiru Sankalpana Fernando', '1988-02-29', 'M', '156/6 A,Galahana Watta, Pahala Bomiriya, Kaduwela', '880600249v', '713925194', NULL, 'lahiruf@yahoo.com', 'G14060025', 'general_1y', '2014-06-29', 31, NULL, 0, '1'),
('Herath Mudiyanselage Lasantha Abeyrathna', '1985-06-14', 'M', '191, Kotawegedara, Kumburuwalathuna, Werellagama', '851660577v', '716168887', '729922249', 'lasanthahm@gmail.com', 'G14060026', 'general_1y', '2014-06-29', 32, NULL, 0, '1'),
('Kamani Sujeeva Gunasena', '1967-12-05', 'F', '31E, Dharmanikethana Rd, Koswatta Road, Nawala', '678410144V', '711093743', NULL, 'kamanisujee@gmail.com', 'G14070027', 'general_1y', '2014-07-26', 21, '2015-07-01', 52, '1'),
('Nimalka Sanjeewani', '1983-04-03', 'F', '\"Sandun\", Athubode, Walasmulla', '835941515v', '714527060', NULL, 'nimalka.sanjeewani@gmail.com', 'G14070028', 'general_1y', '2014-07-26', 22, '2015-06-01', 41, '1'),
('A. Suneth Kanishka', '1991-06-09', 'M', '134/A, Delthera, Piliyandala', '911611082v', '772985789', NULL, 'sunethkanishka@gmail.com', 'G14070029', 'general_1y', '2014-07-18', 24, '2015-10-01', 72, '1'),
('A. Dineth Danushka', '1991-06-09', 'M', '134/A, Delthera, Piliyandala', '911611163v', '783183682', NULL, 'thompson.thompson59@gmail.com', 'G14070030', 'general_1y', '2014-07-18', 25, '2015-10-01', 71, '1'),
('Chinthaka Wijesinghe', '1977-03-06', 'M', '6B, 34/4, MHS, Mattegoda, Kottawa', '770660238v', '773206887', NULL, 'chinthaka@beluga.lk', 'G14070031', 'general_1y', '2014-07-26', 26, '2015-08-01', 66, '1'),
('H.P.G. Chamitha D. De Alwis', '1981-09-15', 'M', 'Hettigedara, Muththettuwagama, Pambahinna', '812594028v', '714404131', NULL, 'chamithade@gmail.com', 'G14070032', 'general_1y', '2014-07-26', 27, NULL, 0, '1'),
('R.W.G.A. Kithmini Ouchithya Wickramarachchi', '1990-07-20', 'M', '45/17, Higganawatta Mawatha, Pepiliyana, Boralesgamuwa', '902020705v', '719140461', NULL, 'kithmini.ouchithya.wickramarac.@gmail.com', 'G14070033', 'general_1y', '2014-07-26', 28, NULL, 0, '1'),
('T.B. Dharshana Benjimine Julzan', '1982-12-16', 'M', '55/22, School Lane, Eathukala, Negombo', '823511558v', '716681138', '776528486', 'arashanseya5393@gmail.com', 'G14070034', 'general_1y', '2014-07-09', 33, '2015-08-01', 54, '1'),
('G.V. Chamalee Marasinghe', '1965-06-25', 'F', '11, 2nd Lane, Sirimal Uyana, Panadura', '656771339V', '382243554', NULL, NULL, 'G15010035', 'general_1y', '2015-01-31', 0, NULL, 34, '1'),
('R.M.R. Rukmal Ratnayake', '1990-07-02', 'M', 'Kusum Nadiya, Negombo Road, Malkaduwawa, Kurunegala', '901840156V', '773995706', '711315024', 'rukmal90@gmail.com', 'G15010036', 'general_1y', '2015-01-30', 0, '2016-02-21', 301, '1'),
('K.M. Malinga Prabhasara', '1984-06-16', 'M', '62, Hewagama, Kaduwela', '841683951v', '774109394', NULL, 'malingagoldsliit@gmail.com', 'G15010037', 'general_1y', '2015-01-31', 0, NULL, 36, '1'),
('Narmadha Lakmali Dangampola', '1986-12-11', 'F', '707/7, Meepitiya, Kegalle', '868461632V', '718097339', NULL, 'narmadha.dangampola@gmail.com', 'G15010038', 'general_1y', '2015-01-31', 0, NULL, 37, '1'),
('W.M. Kalana Wijesundara', '1996-07-15', 'M', '57, Godigamuwa, Menikdiwela', '961971446v', '717334806', NULL, 'wijesundarakalana@yahoo.com', 'S15030039', 'school', '2015-03-20', 0, NULL, 43, '1'),
('Indika Upul Jayatissa', '1993-10-31', 'M', '\"Tisso\", Pollewwa, Batapola', '933051285v', '773018949', '912261222', 'iujindika@gmail.com', 'G15060040', 'general_1y', '2015-05-31', 0, NULL, 39, '1'),
('Sarath Sanjeewa Rajapaksha', '1981-03-14', 'M', 'Soragune, Haldunmulla', '810745207v', '713380807', NULL, 'sarathsanjeewa@gmail.com', 'G15060041', 'general_1y', '2015-06-20', 0, NULL, 44, '1'),
('Harindi Hettiarachchi', '1990-09-14', 'F', '28, Lionel Edirisinghe Mawatha, Kirulapone, Colombo 5', '907582264v', '777802262', NULL, 'harindih@yahoo.com', 'G15060042', 'general_1y', '2015-06-28', 0, NULL, 46, '1'),
('Manaram Padmahara Jayasuriya', '1994-04-04', 'M', '50, Ragama Raod, Kandana', '940952921v', '779769595', NULL, 'manaramjayasuriya15@gmail.com', 'G15060043', 'general_1y', '2015-06-28', 0, NULL, 47, '1'),
('Ninel T. Fernando', '1948-08-16', 'F', '42/1, Kurundugahawatte, Bellanthara Road., Dehiwala', '48729388v', '714128843', NULL, 'nineltf@yahoo.com', 'G15060044', 'general_1y', '2015-06-28', 0, NULL, 48, '1'),
('V.G. Akalanka Pathum Sameera', '1986-03-22', 'M', '124/410, Baubbahloka Mawatha, Colombo 07', '860821796v', '715379971', NULL, 'akalankapg@gmail.com', 'G15060045', 'general_1y', '2015-06-28', 0, '2016-04-30', 303, '1'),
('Anthony Shanti Kumar Perumal', '1952-05-15', 'M', 'Dxa 2/G, Manning Town, Elvitigala Mawatha, Colombo 8', '521363231v', '777583042', '112689746', 'shan_kp52@hotmail.com', 'G15070046', 'general_1y', '2015-07-25', 0, NULL, 56, '1'),
('Nandalal Ranasinghe', '1952-02-18', 'M', '4, First Lane, Park Road, Ratmalana', '520490175v', '112715342', NULL, '2nandalal@yahoo.com', 'G15070047', 'general_1y', '2015-07-25', 0, NULL, 55, '1'),
('Ven. Kadihingala Karunasara', '1990-11-21', 'M', 'Sri Viwekaramaya, Maligawa Road, Laksiripura, Rathmalana', '903260866v', '711742850', NULL, 'kkarunasarathero@gmail.com', 'G15080048', 'general_1y', '2015-08-22', 0, NULL, 64, '1'),
('Randima Kumari Mahagamage', '1986-10-01', 'F', '52/20, Asoka Garden, Nampamunuwa, Piliyandala', '867752862v', '112700337', NULL, 'randimahagamage@gmail.com', 'G15080049', 'general_1y', '2015-08-22', 0, NULL, 62, '1'),
('Lloyd Perera', '1983-03-01', 'M', '03, Waidya Place, Dehiwala', '830610715v', '775821575', NULL, 'lloyd@gislk.com , lloydperera0@gmail.com', 'G15080050', 'general_1y', '2015-08-22', 0, NULL, 63, '1'),
('Disna Mahagamage', '1989-12-09', 'F', '52/20, Asoka Garden, Nampamunuwa, Piliyandala', '898440737v', '773226070', NULL, 'disnamahagamage@gmail.com', 'G15080051', 'general_1y', '2015-08-22', 0, NULL, 61, '1'),
('Athuraliyage Sarath', '1955-02-14', 'M', '228/4, Hokandara North, Malabe', '550450992v', '777330539', NULL, 'sarath5502@gmail.com', 'G15080052', 'general_1y', '2015-08-22', 0, NULL, 59, '1'),
('Manoj Hemantha Waleboda', '1986-10-10', 'M', '410, Kosgahawatta, Pamunugama, Alubomulla', '862843720v', '718414875', NULL, 'manoj8614@gmail.com', 'G15080053', 'general_1y', '2015-08-22', 0, NULL, 58, '1'),
('A.A. Chandrika', '1982-10-20', 'F', '335/80, City Of Leisure, Aluth Ambalama, Kosgama', '827941638v', '754412681', NULL, 'desilvachandrika@rocketmail.com', 'G15090054', 'general_1y', '2015-09-27', 0, NULL, 66, '1'),
('Obawaththa Kankanamge Tharindu Nimesh Dananjana', '1998-03-12', 'M', '36/11, Senanayaka Mawatha, Nawala, Rajagiriya', '980721191v', '717730760', NULL, 'oktnimesh@gmail.com', 'S15090055', 'general_1y', '2015-09-28', 0, NULL, 73, '1'),
('Paranagamage Don Iranga Thejana Paranagama', '1995-03-21', 'M', '54/8, Denuwara Walaw Waththa , Piriwena Para, Molligoda, Wadduwa', '950811404v', '776067286', NULL, 'iranga.thejana.pd@gmail.com', 'G15100056', 'general_1y', '2015-10-30', 0, NULL, 69, '1'),
('Sumudu Wijesinghe', '2002-02-13', 'F', '65/12 A, Oruthota Road, Gampaha', NULL, '777741604', NULL, NULL, 'S15100057', 'school', '2015-10-31', 0, NULL, 67, '1'),
('Rannulu Sangeetha Anushamalee De Soysa', '1990-02-25', 'F', '220/A/3/3, Pinlinda Road, Pattiyawatta, Kothalawala, Kaduwela', '905563300v', '717953290', NULL, 'sangeetha.yza@gmail.com', 'G15100058', 'general_1y', '2015-10-31', 0, NULL, 70, '1'),
('W.A.K.L.M. Wickramasinghe', '1988-10-26', 'M', '160/55A, Pinnagolla Rd., Monaragala', '883000684v', '773908307', NULL, 'loshana88@gmail.com', 'G15120059', 'general_1y', '2015-12-19', 0, NULL, 75, '1'),
('C.L. Ariyaratne', '1975-05-08', 'M', '573, Zone Ii, Millnium City, Athurugiriya', '751290098v', '778844844', NULL, 'lala.opatha@hotmail.com', 'G15120060', 'general_1y', '2015-12-19', 0, NULL, 76, '1'),
('A.C. Janaka Muthuminithilaka', '1977-07-01', 'M', '53, Old Road, Pannipitiya, 10230', '771831729v', '777397946', NULL, 'cjmuthu@gmail.com', 'G15120061', 'general_1y', '2015-12-19', 0, NULL, 77, '1'),
('Lakshan Oshadee Wijebandara', '1991-01-13', 'M', '356/8, Wijesinghe Mawata, Katuwana Road, Homagama', '910133683v', '787912183', NULL, 'lakshanwij@gmail.com', 'G15120062', 'general_1y', '2015-12-19', 0, NULL, 78, '1'),
('Uditha Hettige', '1974-10-18', 'M', '39, Sangabo Mw, Galawila Watta, Homagama', '742921921v', '714798869', NULL, 'udithabirder@gmail.com', 'G15120063', 'general_1y', '2015-12-19', 0, NULL, 79, '1'),
('Sachinda Dulwin Thisaru Guruge', '1990-05-15', 'M', 'Rock Hill, Paththunupitiya, Nawalapitiya', '901364460v', '717209720', NULL, 'Thisaru.Guruge@gmail.com', 'G15120064', 'general_1y', '2015-12-19', 0, NULL, 80, '1'),
('K.A. Ruwangika Lalanganee Abesiri Gunawardana', '1991-11-18', 'F', '657, Mandandawala, Matale', '918230440v', '714639767', NULL, 'ruwangikagunawardana@gmail.com', 'G15120065', 'general_1y', '2015-12-19', 0, NULL, 81, '1'),
('D.M.M. Sachini Rasadari', '1991-06-08', 'F', '52/1, Kanda Watta Road, Nugegoda', '916600283v', '719968702', NULL, 'schinir@ymail.com', 'G15120066', 'general_1y', '2015-12-19', 0, NULL, 82, '1'),
('S.P.W.I. Sudasinghe', '1989-10-05', 'F', 'Wipul, Kondagala, Nelundeniya', '897792346v', '715380473', NULL, 'wipu.txf@gmail.com', 'G15120067', 'general_1y', '2015-12-19', 0, NULL, 83, '1'),
('R.D.T.D. Dayarathne', '1987-02-05', 'F', '133/8, Dehiwala Road, Maharagama', '875361562v', '772264753', NULL, 'dinushika.w@gmail.com', 'G15120068', 'general_1y', '2015-12-19', 0, NULL, 84, '1'),
('Piumi Senevirathne', '1990-12-18', 'F', '113, Delgamuwa, Kuruvita', '908531248v', '712127570', NULL, 'piumisenevirathne@ymail.com', 'G15120069', 'general_1y', '2015-12-19', 0, NULL, 85, '1'),
('Sujatha Mayadunnage', '1978-09-03', 'F', '290/2, Ahugammana, Demalagama', '787473237v', '112046281', NULL, 'smayadunnage@gmail.com', 'G16010070', 'general_1y', '2016-01-30', 87, NULL, 0, '1'),
('Millaniyage Udari Hansika Peiris', '1991-11-27', 'F', '82/1, Madapatha, Piliyandala', '918324283v', '711241603', NULL, 'udarihpeiris@gmail.com', 'G16010071', 'general_1y', '2016-01-30', 88, NULL, 0, '1'),
('G.B.E.M. Hasitha Sandaruvan Ekanayake', '1992-10-20', 'M', '5, Dorakumbura, Dullewa, Matale', '922941793v', '711005969', NULL, 'hasitha.sandaruvan@gmail.com', 'G16010072', 'general_1y', '2016-01-30', 89, NULL, 0, '1'),
('K.M. Sudesh Ruvinda', '1987-03-10', 'M', '17, Malwatta, Kalagedihena', '870701357v', '776444161', NULL, 'srkonara@gmail.com', 'G16010073', 'general_1y', '2016-01-30', 90, NULL, 0, '1'),
('S.N. Weerakoon', '1987-03-11', 'M', 'Pahala Walawwa, Helakatugaha, Pattiyagedara, Bandarawela', '870710607v', '719320036', NULL, 'snweerka@gmail.com', 'G16010074', 'general_1y', '2016-01-30', 91, NULL, 0, '1'),
('Kalya Subasinghe', '1988-05-24', 'F', '258, Wedamulla Lane, Kelaniya', '886450060v', '779319100', NULL, 'kalya_subasinghe@yahoo.com', 'G16010075', 'general_1y', '2016-01-30', 92, NULL, 0, '1'),
('N.M. Nirmala Gayathri Nayakarathna', '1988-01-18', 'F', 'Moonamale, Panadaragama, Kurunegala', '885182879v', '717324065', NULL, 'nmgaya3@gmail.com', 'G16010076', 'general_1y', '2016-01-30', 93, NULL, 0, '1'),
('M.J. Ifthiqar Ahmed', '1960-03-15', 'M', '45/19, Swarna Road, Colombo 6', '600750380x', '71618684', '112553305', 'ifthiqarahmedmj@gmail.com', 'G16010077', 'general_1y', '2016-02-27', 98, '2017-01-01', 454, '1'),
('B.M. Tilan Hasaranga Abeyrathne', '1993-05-29', 'M', '177/1, Wilbawa, Pahalagama, Kurunegala', '930890600v', '711011206', NULL, 'hasarangatln@gmail.com', 'G16010078', 'general_1y', '2016-02-27', 99, NULL, 0, '1'),
('M.G.S. Pushpamal', '1985-01-21', 'M', '08, Panagoda, Neluwa, Galle', '850210535v', '778022006', '714934771', 'mgspglpkt@yahoo.com', 'G16040079', 'general_1y', '2016-04-30', 304, NULL, 0, '1'),
('Lal Motha', '1950-06-02', 'M', '79/2,  Hathbodiya Road, Kalubowila, Dehiwala', '501583553v', '766698889', NULL, 'lal_motha@yahoo.com', 'G16040080', 'general_1y', '2016-04-30', 302, NULL, 0, '1'),
('Dharmin Samarajeewa', '1952-07-10', 'M', '1s/2, Gomes Path, Off De Fonseka Road, Colombo 5', '521924535v', '777340605', NULL, 'dharminsamarajeewa@gmail.com', 'G16040081', 'general_1y', '2016-04-30', 306, NULL, 0, '1'),
('Chandima Jayaweera', '1960-11-11', 'M', '98/16, Talawatta, Gonawala, Kelaniya', '603160800v', '777805253', NULL, 'chandima.jaya@gmail.com', 'G16040082', 'general_1y', '2016-04-30', 305, NULL, 0, '1'),
('R.M. Dhanushka Sanjeewa Premasiri', '1984-04-27', 'M', 'Pothiyagama, Pahalagama, Thambuttegama', '841182731v', '712810881', NULL, 'dhanushmesh@gmail.com', 'G16050083', 'general_1y', '2016-05-28', 310, NULL, 0, '1'),
('Duminda S.B. Dissanayake', '1986-12-09', 'M', '132, Nuwarawatta, Hingurakgoda', '863442826v', '770317831', NULL, 'duminda.rusl@gmail.com', 'G16050084', 'general_1y', '2016-05-27', 307, NULL, 0, '1'),
('Chathuranga Tharaka Wijerathna', '1990-06-01', 'M', '416/1, Kandangoda, Kuruwita', '901531730v', '716625221', NULL, 'eheliyagodans@gmail.com', 'G16050085', 'general_1y', '2016-05-28', 308, NULL, 0, '1'),
('Ajith Gamage', '1963-05-01', 'M', '11/33C, Nidahas Mawatha, Koswatta Road, Kalapaluwawa, Rajagiriya', '631222560v', '777356931', NULL, 'acgamage@gmail.com', 'G16040086', 'general_5y', '2016-05-28', 309, '2017-07-29', 451, '1'),
('A.M. Ishanka Upamali Adikari', '1992-11-23', 'F', 'Anulagiriya, Bokanoruwa, Galauda, Hali-Ela', '928284433v', '770567461', NULL, 'ishanka1123@gmail.com', 'G16060087', 'general_1y', '2016-06-26', 314, NULL, 0, '1'),
('Wedeha Dissanayake', '1992-10-17', 'M', '110, Katawela, Leula, Kandy', '922913811v', '713712935', NULL, 'dissanayakewedeha@gmail.com', 'G16060088', 'general_1y', '2016-06-26', 311, NULL, 0, '1'),
('Dushan Muthunayake', '1991-07-31', 'M', '270C/1/1, Dickland Watta, Hokandara Road, Thalawathugoda', '912132480v', '715439739', NULL, 'dmuthu91@gmail.com', 'G16060089', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('Pumudi Gardiyawasam', '1991-03-03', 'F', '130/17, Sarasavi Pedesa, Uluvitike, Galle', '915632041v', '711000702', NULL, 'gphusala@gmail.com', 'G16060090', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('W.P. Dilshan Maduranga De Silva', '1987-12-26', 'M', '227/20A, Gemunu Mawata, Wettegedara Road, Maharagama', '873613033v', '719606564', NULL, 'dilshandesliva@yahoo.com', 'G16060091', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('K.V. Dilani Rachitra', '1991-08-07', 'F', '22, Wiskam Road, Galle', '917200203v', '773905001', NULL, 'vithanage.dilani@gmail.com', 'G16060092', 'general_1y', '2016-06-26', 312, NULL, 0, '1'),
('G.A. Dinusha Sewwandi', '1992-04-01', 'F', '42, Kaudumulla, Ambagaspitiya', '925220215v', '713322869', NULL, 'gadssewwandi401@gmail.com', 'G16060093', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('M.L. Vishwanath Peiris Malalanayake', '1992-05-03', 'M', '190/B, Kiriberiya Road, Panadura', '921240422v', '718864834', NULL, 'lakshitha_vishwa@yahoo.com', 'G16060094', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('Lilan Lalinda Rupasinghe', '1990-01-06', 'M', '1021/B, Ihalagama Rd, Deniyaya', '900064411v', '778391938', NULL, 'lalinda90@gmail.com', 'G16060095', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('M.S. Prasantha Perera', '1992-10-07', 'M', '174, Galthude, Bandaragama', '922813540v', '719987117', NULL, 'sprasantha174@gmail.com', 'G16060096', 'general_1y', '2016-06-26', 0, NULL, 0, '1'),
('U.J.D. Upekshika', '1991-10-21', 'F', 'Kettangoda Watta, Baddegama- South, Baddegama', '917950628v', '770611915', NULL, 'dayanthijalathge@gmail.com', 'G16060097', 'general_1y', '2016-06-26', 313, NULL, 0, '1'),
('W. Madhava S. Botejue ', '1984-08-27', 'M', '12/2, Purana Vihara Mawatha, Colombo 6', '842403120v', '714822797', NULL, 'madhavabotejue@gmail.com', 'G16080098', 'general_1y', '2016-08-27', 321, NULL, 0, '1'),
('Dinesh Eransaka Gabadage', '1969-04-03', 'M', '150/6, Stanley Thilakaratna Mawatha, Nugegoda', '690941724v', '777891116', '718293553', 'degabadage@gmail.com', 'G16080099', 'general_1y', '2016-08-27', 322, NULL, 0, '1'),
('E.K.Dilashan Madusanka Sarath Kumara', '1994-06-21', 'M', 'Kadaweediya, Miyanavita, Deraniyagala', '941731430v', '769290207', NULL, NULL, 'G16080100', 'general_1y', '2016-08-27', 320, NULL, 0, '1'),
('M.A.Dilan Sameera Nalaka', '1988-03-01', 'M', '86, 2nd Street, New City 2, Batakeththara, Piliyandala ', '880610198v', '716389686', NULL, 'dsnalaka@hotmail.com', 'G16080101', 'general_1y', '2016-08-27', 319, NULL, 0, '1'),
('Dilashinee Vasundara Meegahapola', '1991-03-26', 'F', '9/1, Morahela, Thenna, Matale', '915860320v', '711835070', NULL, 'dilaashani@gmail.com', 'G16080102', 'general_1y', '2016-08-27', 318, NULL, 0, '1'),
('Minandi Wilathgamuwa', '2001-09-07', 'F', '73/2k, Ekamuthu Mw, Maviththara, Piliyandala', NULL, '713253699', NULL, NULL, 'S16080103', 'school', '2016-08-27', 317, NULL, 0, '1'),
('P.H. Sahani Prabha Chandrasiri', '1988-08-27', 'F', '341/C/15, 1st Lane, Mahayayawatta, Siddamulla, Piliyandala', '887400776v', '766999101', NULL, 'spchandrasiri@gmail.com', 'G16080104', 'general_1y', '2016-08-27', 316, NULL, 0, '1'),
('W.N.A. Upeksha Nayani Weerasinghe', '1988-12-20', 'F', '242/1A, Pahala Karagahamuna, Kadawata', '888552502v', '710619741', NULL, 'upekshanayani@yahoo.com', 'G16080105', 'general_1y', '2016-08-27', 315, NULL, 0, '1'),
('A.G. Gayathra Charuka Bandara', '1995-10-27', 'M', '119, Illukmodara, Gurudeniya', '953062038v', '712572181', NULL, 'gayarandy2010@gmail.com', 'G16090106', 'general_1y', '2016-08-27', 327, NULL, 0, '1'),
('K.R. Pasindu Shaneth Premarathne', '1994-05-09', 'M', '02, Dalupathgedara, Mellawagedara', '941300456v', '771726979', NULL, 'pasindushaneth9@gmail.com', 'G16090107', 'general_1y', '2016-09-24', 326, NULL, 0, '1'),
('O.A. Sheran Madhawa Perera', '1996-06-24', 'M', '398, Paran Ambalama, Uswawtakeiyawa', '961763134v', '717003113', NULL, 'sheranperera96@outlook.com', 'G16090108', 'general_1y', '2016-09-24', 325, NULL, 0, '1'),
('W. Susantha ', '1973-11-17', 'M', '125/1, Sweep Watte, Biyagama Road, Kelaniya', '733221275v', '777132070', NULL, 'susabirdspotter@gmail.com', 'G16090109', 'general_1y', '2016-09-24', 324, NULL, 0, '1'),
('G.D. Kalpani Iroshika Somachandra', '1991-02-21', 'F', 'G.D.S. Somachandra, 294, Pambadeniya', '915521223v', '719302964', '372279625', 'krissiroshi@gmail.com', 'G17010110', 'general_1y', '2017-01-28', 0, NULL, 0, '1'),
('A.S. Hettiarachchi', '1958-01-26', 'M', '160/4, Koswatta Road, Nawala', '580260438v', '716061048', NULL, 'anurahhe@yahoo.com', 'G17010111', 'general_1y', '2017-01-28', 0, NULL, 0, '1'),
('Kanishka Chathuranga Malimbada Liyanage', '1993-09-01', 'M', '446/7A, Kurunduwatta, Watabage, Hirana, Panadura', '932450445v', '754380711', NULL, 'kani.chathranga@gmail.com', 'G17010112', 'general_1y', '2017-01-28', 0, NULL, 0, '1'),
('Vidura Subharatha Bandara Pihillanda', '1996-09-30', 'M', '19/86, Wadamalpanawa Watta, Polgolla', '962740553v', '710945028', NULL, 'vidurasbp@gmail.com', 'G17010113', 'general_1y', '2017-01-28', 0, NULL, 0, '1'),
('Nawalage Ishara Chathuranga Kumara', '1991-10-23', 'M', '270/A, Devala Road, Batakeththara, Madapatha', '912970167v', '713919694', NULL, 'isharahat@gmail.com', 'G17010114', 'general_1y', '2017-01-28', 0, NULL, 0, '1'),
('Pitiwala Liyanage Aruni Omalka Rathnasekara', '1990-02-11', 'F', '285/64, Wellagaha Watta, Miriswatta, Piliyandala', '905420585v', '717005070', '112614513', 'aruniomalka058gmail.com', 'G17010115', 'general_1y', '2017-01-28', 0, NULL, 0, '1'),
('Medha De Alwis', '1978-03-29', 'F', '1034/6, Pothuarava Road, Malabe', '786200237v', '714488513', NULL, 'medhadealwis@gmail.com', 'G17020116', 'general_1y', '2017-02-25', 0, NULL, 0, '1'),
('Wijayathunga Arachchige Lasanthi Kanthika', '1989-06-28', 'F', 'B-6, Railway Flats, Ratmalana', '896802348v', '711776399', NULL, 'wijayathunga.lasanthi@gmail.com', 'G17030117', 'general_1y', '2017-03-18', 0, NULL, 0, '1'),
('D.L. Muthuthanthirige', '1991-08-28', 'F', '64/10/15, Sarasavi Uyana, Siyambalagoda, Polgasowita, Kottawa', '917411204v', '715384942', NULL, 'deshikalm@gmail.com', 'G17030118', 'general_1y', '2017-03-18', 0, NULL, 0, '1'),
('Asiru Veditha Karunathna', '1987-11-08', 'M', '\"Sooriya Villa\", Jambugahahena, Meegahathenna', '873132108v', '714524124', NULL, 'asiruveditha@gmail.com', 'G17050119', 'general_1y', '2017-05-30', 0, NULL, 0, '1'),
('P. Thamandari Devasmitha Pathirana', '1991-11-09', 'F', '19/415, 8th Lane, Wanaguru Mawatha, Hokandara North, Hokandara', '918140905v', '779482744', NULL, 'thamandari@gmail.com', 'G17050120', 'general_1y', '2017-05-30', 0, NULL, 0, '1'),
('D.V. Peshala Pasan Karunarathna', '1993-08-21', 'M', '\"Sooriya Villa\", Jambugahahena, Meegahathenna', '932340380v', '710580734', NULL, 'peshalapasan@gmail.com', 'G17060121', 'general_1y', '2017-06-06', 0, NULL, 0, '1'),
('Pitgala Arachchilage Himidu Himansi', '1994-02-23', 'F', '551/A/3, Obawatta, Heiyanthuduwa', '945540370v', '771750009', NULL, 'himiduhimansi.hh@gmail.com', 'G17060122', 'general_1y', '2017-06-06', 0, NULL, 0, '1'),
('M. Mallika Peiris', '1956-07-18', 'F', '26/A, 2nd Lane, Wanatha Road, Gangodawila, Nugegoda', '567001113v', '773828002', NULL, 'millaniyagemal@gmail.com', 'G17060123', 'general_1y', '2017-06-24', 0, NULL, 0, '1'),
('Sanjaya Weerasinghe', '1969-07-15', 'M', '42, Chapel Lane, Nugegoda', '691972550v', '777278406', NULL, 'sweerasinghe@sltnet.lk', 'G17060124', 'general_1y', '2017-06-24', 0, NULL, 0, '1'),
('Mapatunage Mangala Padmasiri Perera', '1960-11-13', 'M', '\"Methsitha\", Bolgoda, Bandaragama', '603170032v', '774314463', '382292566', 'mangala.perera7@gmail.com', 'G17060125', 'general_1y', '2017-06-24', 0, NULL, 0, '1'),
('Medhisha Pasan Gunawardena', '1988-04-26', 'M', '\"Udagiri\", Nilpanagoda, Wegowwa', '881173654v', '717204729', NULL, 'medhisha@gmail.com', 'G17070126', 'general_5y', '2017-07-29', 457, NULL, 0, '1'),
('Lakmali Sepalika Liyanage', '1981-10-17', 'F', '123/B, Mamudawella, Ketakumbura', '817910718v', '779702836', NULL, 'sepali12@yahoo.com', 'G17070127', 'general_5y', '2017-07-29', 455, NULL, 0, '1'),
('K. Gayathri Upamali Perera', '1988-10-30', 'F', '167/A, Ruchirapura, Batuwandara, Piliyandala', '888042423v', '715376203', NULL, 'upamali28@gmail.com', 'G17070128', 'general_5y', '2017-07-29', 453, NULL, 0, '1'),
('Yohan Weerasuriya', '1965-12-15', 'M', '49/8, Fife road, Colombo 05', '653500904v', '777753975', NULL, 'yohan@backofbeyond.lk', 'G17070129', 'general_5y', '2017-07-29', 452, NULL, 0, '1'),
('K.A.D.Y. Sewwandi', '1996-06-28', 'F', '284/A, Jalthara, Ranala', '966801786v', '710655082', NULL, 'sewwandionline96@gmail.com', 'G17070130', 'general_1y', '2017-07-29', 459, NULL, 0, '1'),
('S.M.T.N. Samarakoon', '1993-04-14', 'F', '29/3, Gamhatha, Welamboda', '936054495v', '719282031', NULL, 'samarakoonthilini@ymail.com', 'G17070131', 'general_1y', '2017-07-29', 458, NULL, 0, '1'),
('D.A.A.S. Saranga', '1990-10-03', 'M', '8/62, Seelarathana Road, Halthotiyawatta, Horana', '902774564v', '775845544', NULL, 'sashika.saranga@outlook.com', 'G17070132', 'general_1y', '2017-07-29', 456, NULL, 0, '1'),
('E.M. Deepthi Ekanayake', '1993-06-17', 'F', 'Kiwlegama, Nebadawa, Nikaweratiya', '936692524v', '774076170', NULL, 'deepthiekanayake0@gmail.com', 'G17070133', 'general_1y', '2017-07-30', 465, NULL, 0, '1'),
('E.M.L.T. Ekanayake', '1991-01-25', 'F', '487/4Q, Old Kottawa Road, Udahamulla, Nugegoda', '915252206v', '779699321', NULL, 'lakmi.te@gmail.com', 'G17070134', 'general_1y', '2017-07-30', 464, NULL, 0, '1'),
('A.P. Kodithuwakku', '1989-12-23', 'M', '487/4Q, Old Kottawa Road, Udahamulla, Nugegoda', '893580050v', '712201966', NULL, 'amilak.ac@gmail.com', 'G17070135', 'general_1y', '2017-07-30', 463, NULL, 0, '1'),
('H.A. Dasuni Pramodya', '1993-01-14', 'F', '\"Ananda\", Imbulgoda, Akuressa', '935143446v', '710542916', NULL, 'dasunipramodya1@gmail.com', 'G17070136', 'general_1y', '2017-07-30', 462, NULL, 0, '1'),
('T. Pavani Dilshanika Perera', '1994-09-07', 'F', '79, Gangarama road, Piliyandala', NULL, '772046045', NULL, 'pavanidilshperera@gmail.com', 'G17070137', 'general_1y', '2017-07-30', 461, NULL, 0, '1'),
('Shirosh Ayeshmantha Pieris', '1985-11-28', 'M', '6/306, Sapumal place, Miriswatta, Piliyandala', '853332186v', '714613222', NULL, 'shirosh.pieris@gmail.com', 'G17070138', 'general_1y', '2017-07-30', 460, NULL, 0, '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
