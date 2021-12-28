--
-- Database Project2
--

CREATE DATABASE IF NOT EXISTS `project2` ;
USE `project2`;

-- -------------------------------------------

-- 
-- Table Membership
--
CREATE TABLE membership (
	mem_id		char(16)		PRIMARY KEY,
    mem_name	nvarchar(50)		NOT NULL,
    mem_phone	char(10)			NOT NULL,
    mem_email	nvarchar(50)		NOT NULL,
    mem_date	datetime			NOT NULL
);
show tables;
-- 
-- Table Bill
--
CREATE TABLE bill (
	bill_no		char(5)			PRIMARY KEY,
    total_price	int				NOT NULL,
    cash_name	nvarchar(50)	NOT NULL,
    bill_date	datetime		NOT NULL,
    mem_id		char(16),
    CONSTRAINT FK_billmem FOREIGN KEY (mem_id) references membership(mem_id)
);

-- 
-- Table Point Statement
--
CREATE TABLE point_statement (
	trans_id		nchar(16)			PRIMARY KEY,
    point_timestamp	datetime			NOT NULL,
    point_balance	int					NOT NULL,
    redeem			int,	
    earning			int,
    mem_id			char(16),
    CONSTRAINT FK_mempoint FOREIGN KEY (mem_id) references membership(mem_id)
);

-- 
-- Table Application
--
CREATE TABLE online_application (
	username		nvarchar(20)		PRIMARY KEY,
    address			nvarchar(200)		NOT NULL,
    app_password	nvarchar(20)		NOT NULL,
    mem_id			char(16)			NOT NULL,
    CONSTRAINT FK_memonline FOREIGN KEY (mem_id) references membership(mem_id)
);

-- 
-- Table Card Type
--
CREATE TABLE card_type (
	type_id			char(1)			NOT NULL,
    card_name		varchar(40)		PRIMARY KEY,
    cash_discount	decimal(5,2)	NOT NULL,
    credit_discount	decimal(5,2)	NOT NULL,
    bdate			date			NOT NULL,
    CONSTRAINT	CHK_TYPE	CHECK (type_id in ('R','B','D','U'))
);
show tables;
-- 
-- Table Branch
--
CREATE TABLE branch (
	branch_id		int				PRIMARY KEY,
    branch_location	nvarchar(50)	NOT NULL,
    branch_phone	char(9)			NOT NULL
);

-- 
-- Table Onsite Card
--
CREATE TABLE onsite_card (
	card_no		char(9)	PRIMARY KEY,
	exp_date	date		NOT NULL,
    status_card	char(1)		NOT NULL,
    activate	datetime	NOT NULL,
    deactivate	datetime,
    CONSTRAINT	CHK_STATUS	CHECK (status_card in ('T','F')),
    mem_id		char(16),
    CONSTRAINT FK_memonsite FOREIGN KEY (mem_id) references membership(mem_id),
    card_name	varchar(40),
    CONSTRAINT FK_typeonsite FOREIGN KEY (card_name) references card_type(card_name),
    branch_id	int,
    CONSTRAINT FK_branchonsite FOREIGN KEY (branch_id) references branch(branch_id)
);
show tables;

--
-- Insert data into membership
--
INSERT INTO membership(mem_id, mem_name, mem_phone, mem_email, mem_date) VALUES
('1200367215384927','Chutikarn Anukul',			'0924979953','pink2000@hotmail.com',				'2020-10-09 18:50:00'),
('9800437866483294','Haley Davidson',			'0897645322','haley76@gmail.com',					'2017-07-08 13:52:45'),
('1200546834828385','Jeff Hardy',				'0945634527','jeff_wwe@hotmail.com',				'2015-12-03 12:59:01'),
('9800463989387525','Tony Stark',				'0645700478','tony_ironman3@hotmail.com',			'2017-09-24 13:03:43'),
('1200247844719603','Pongsakorn Piboonpongpun',	'0802855506','bt_mark2556@yahoo.com',				'2019-03-15 12:34:45'),
('1200336244738295','Pranungfun Prapaenee',		'0830271397','pixelszamakk@gmail.com',				'2019-12-31 11:11:11'),
('9800473905843902','Prom Prompichan',			'0945678910','prom_piang58@hotmail.com',			'2017-03-16 16:11:12'),
('1200746382984012','Krittitee Nildam',			'0826288843','boat_kn20622@hotmail.com',			'2016-06-25 13:46:09'),
('9800287693485982','Krissanapong Palakham',	'0922843224','punza15@hotmail.com',					'2018-05-26 11:47:34'),
('9800202397571923','Paweena Hongitthiporn',	'0824822142','paweenaaun12@hotmail.com',			'2019-11-02 11:32:12'),
('1200758120249572','Wasin Heesawat',			'0846537222','oat20499@hotmail.com',				'2018-06-15 12:34:50'),
('1200783201923759','Pitipat Lertsoontornpoj',	'0802442525','pitipat.ler@student.mahidol.ac.th',	'2020-07-30 18:36:59'),
('9800845910139102','Songchai Nildam',			'0989393897','snsnil@hotmail.com',					'2017-12-01 19:01:32'),
('1200345286572910','Napida Chongcharoenkit',	'0968609417','napida.cho@student.mahidol.ac.th',	'2019-12-23 17:36:53'),
('1200478392108592','Achiraya Roei',			'0824718884','achiraya001@hotmail.com',				'2015-09-30 20:21:39'),
('1200491230158023','Aekkaluk Panyacharoensri',	'0823349198','aekkaluk.pan@studemt.mahidol.ac.th',	'2016-04-16 15:53:00'),
('9800023102935864','Ajjima Sapthamrong',		'0619830909','aum.ajji@hotmail.com',				'2017-06-28 14:12:44'),
('1200083092139482','Jiratchaya Benyakul',		'0956043182','nunjiratchaya@gmail.com',				'2017-09-17 19:31:55'),
('9800123958230567','Brooke Perry',				'0979393897','brookeper@hotmail.com',				'2014-11-24 15:09:23'),
('9800123485039755','Martin Anderson',			'0693759823','martinande198@gmail.com',				'2019-02-24 16:39:42'),
('9800249230150459','Miranda Kelley',			'0674423859','mirakel94@hotmail.com',				'2020-11-01 11:30:11'),
('9800395074874830','Julai Turner',				'0974832095','TurJulla097@hotmail.com',				'2017-07-07 12:59:09'),
('1200958203985717','Edward Williams',			'0892759112','Edwilliam007@gmail.com',				'2019-12-19 18:02:54'),
('1200948036571249','Tony Adams',				'0606385910','tonyjaa@hotmail.com',					'2018-10-18 17:58:39'),
('1200859012936763','Annabella Myers',			'0992058718','annabell@gmail.com',					'2018-12-01 18:00:31'),
('1200058586571258','Alissa Smith',				'0918674928','alissa_smi@hotmail.com',				'2015-01-31 21:05:10'),
('1200950218503867','Sienna Douglas',			'0686038671','siendglas@hotmail.com',				'2016-10-21 20:12:01'),
('9800098767127521','Abigail Murray',			'0897248843','murrabi@hotmail.com',					'2017-08-30 17:35:09'),
('9800868130689793','Lenny Andrews',			'0964582311','andrewslen502@gmail.com',				'2019-09-21 10:59:04'),
('1200589127590167','Carina Montgomery',		'0831311727','Carina_montgo@hotmail.com',			'2020-08-12 19:59:19');

--
-- Insert data into bill
--
INSERT INTO bill(bill_no, total_price, cash_name, bill_date, mem_id) VALUES
('A0012','523',	'Abraham Evans',	'2020-11-01 20:12:49','1200367215384927'),
('B0781','791',	'Max Fowler',		'2017-12-27 11:47:06','9800437866483294'),
('A0086','429',	'Carlos Adams',		'2016-05-07 10:43:06','1200546834828385'),
('B0169','754',	'Jared Ellis',		'2017-11-17 19:47:47','9800463989387525'),
('A0226','1287','Adam Wells',		'2019-06-16 12:09:58','1200247844719603'),
('A0905','931',	'Lydia Douglas',	'2020-02-25 14:45:36','1200336244738295'),
('B0062','762',	'Miranda Cooper',	'2017-07-06 15:18:59','9800473905843902'),
('A0186','608',	'Vincent Gray',		'2016-12-08 19:43:00','1200746382984012'),
('B0089','853',	'Anna Richards',	'2018-07-06 19:47:58','9800287693485982'),
('B0235','1862','Henry Carroll',	'2020-03-14 18:30:16','9800202397571923'),
('A0893','450',	'Vincent Gray',		'2018-09-27 13:15:44','1200758120249572'),
('A0133','682',	'Miranda Cooper',	'2020-09-06 17:04:38','1200783201923759'),
('B0256','2430','Anna Richards',	'2018-01-11 15:05:12','9800845910139102'),
('A0416','869',	'Carlos Adams',		'2020-11-19 13:45:26','1200345286572910'),
('A0749','560',	'Miranda Cooper',	'2015-12-12 12:12:21','1200478392108592'),
('A0165','692',	'Jared Ellis',		'2016-04-16 18:53:45','1200491230158023'),
('B0192','915',	'Vincent Gray',		'2017-06-28 14:12:44','9800023102935864'),
('A0158','1452','Jared Ellis',		'2017-12-04 17:15:20','1200083092139482'),
('B0567','896',	'Henry Carroll',	'2016-01-04 18:45:12','9800123958230567'),
('B0298','750',	'Lydia Douglas',	'2019-04-20 13:00:00','9800123485039755'),
('B0925','489',	'Jared Ellis',		'2020-12-02 11:01:51','9800249230150459'),
('B0308','943',	'Adam Wells',		'2017-11-14 21:12:44','9800395074874830'),
('A0576','998',	'Vincent Gray',		'2020-01-21 18:51:26','1200958203985717'),
('A0167','1053','Henry Carroll',	'2018-12-29 12:48:45','1200948036571249'),
('A0500','2150','Adam Wells',		'2019-12-23 10:49:31','1200859012936763'),
('A0345','685',	'Miranda Cooper',	'2015-09-27 15:01:59','1200058586571258'),
('A0151','712',	'Vincent Gray',		'2016-10-25 16:46:44','1200950218503867'),
('B0248','942',	'Adam Wells',		'2017-08-30 17:35:09','9800098767127521'),
('B0141','1254','Carlos Adams',		'2019-12-22 14:26:41','9800868130689793'),
('A1012','1052','Lydia Douglas',	'2020-10-29 19:52:01','1200589127590167');

--
-- Insert data into Point Statement
--
INSERT INTO point_statement(trans_id, point_timestamp, point_balance, redeem, earning, mem_id) VALUES
('U9512','2020-11-01 20:12:49',	'5262',	'500',	'5762',	'1200367215384927'),
('D5423','2017-12-27 11:47:06',	'353',	'100',	'453',	'9800437866483294'),
('B2571','2016-05-07 10:43:06',	'269',	'900',	'1169',	'1200546834828385'),
('R8942','2017-11-17 19:47:47',	'2795',	'200',	'2995',	'9800463989387525'),
('U1248','2019-06-16 12:09:58',	'4762',	'300',	'5062',	'1200247844719603'),
('B4123','2020-02-25 14:45:36',	'7468',	'700',	'8186',	'1200336244738295'),
('B9852','2017-07-06 15:18:59',	'7478',	'1200',	'8678',	'9800473905843902'),
('U0231','2016-12-08 19:43:00',	'4849',	'100',	'4949',	'1200746382984012'),
('R0971','2018-07-06 19:47:58',	'425',	'500',	'925',	'9800287693485982'),
('B0053','2020-03-14 18:30:16',	'4103',	'700',	'4803',	'9800202397571923'),
('D5032','2018-09-27 13:15:44',	'8816',	'900',	'9716',	'1200758120249572'),
('B9406','2020-09-06 17:04:38',	'8737',	'100',	'8837',	'1200783201923759'),
('R1619','2018-01-11 15:05:12',	'200',	'300',	'500',	'9800845910139102'),
('U9742','2020-11-19 13:45:26',	'2945',	'400',	'3345',	'1200345286572910'),
('B0156','2015-12-12 12:12:21',	'598',	'300',	'898',	'1200478392108592'),
('R8740','2016-04-16 18:53:45',	'5844',	'200',	'6044',	'1200491230158023'),
('B9523','2017-06-28 14:12:44',	'3631',	'100',	'3731',	'9800023102935864'),
('D5648','2017-12-04 17:15:20',	'7261',	'500',	'7761',	'1200083092139482'),
('R4723','2016-01-04 18:45:12',	'803',	'500',	'1303',	'9800123958230567'),
('B3945','2019-04-20 13:00:00',	'8944',	'100',	'9044',	'9800123485039755'),
('B9951','2020-12-02 11:01:51',	'3805',	'1500',	'5305',	'9800249230150459'),
('R2012','2017-11-14 21:12:44',	'2885',	'800',	'3685',	'9800395074874830'),
('D3807','2020-01-21 18:51:26',	'2702',	'900',	'2602',	'1200958203985717'),
('U9412','2018-12-29 12:48:45',	'443',	'1200',	'1643',	'1200948036571249'),
('D2164','2019-12-23 10:49:31',	'2090',	'500',	'2590',	'1200859012936763'),
('U5641','2015-09-27 15:01:59',	'4922',	'900',	'5822',	'1200058586571258'),
('B6821','2016-10-25 16:46:44',	'6167',	'700',	'6867',	'1200950218503867'),
('R4128','2017-08-30 17:35:09',	'5712',	'800',	'6512',	'9800098767127521'),
('D8123','2019-12-22 14:26:41',	'7365',	'200',	'7565',	'9800868130689793'),
('U9105','2020-10-29 19:52:01',	'1639',	'100',	'1739',	'1200589127590167');

-- 
-- Insert data into online application
--
INSERT INTO online_application(username, address, app_password, mem_id) VALUES
('Cherry007',		'1852-1854-1856 Sinthron Building Pattanakan Road Suan Luang 2 10250',	'nuryy092',				'1200367215384927'),
('HaleyBoyz',		'13, Sukhumvit Road soi 8 Bangkok 10110Thailand 10110',					'Davidsonnn',			'9800437866483294'),
('JeffHD094',		'Khun Thanawan 20/3 Sukhumvit Soi 23 Bangkok 10110, Bangkok',			'Iwillbechampion',		'1200546834828385'),
('Mark001',			'33/107 21St Floor Wall Street Tower Building Surawong Road',			'killthemall',			'9800463989387525'),
('BTmark2556',		'199 Sukhumvit Soi 22 c/o The Imperial Queen',							'Pongsa080',			'1200247844719603'),
('pixelzamakk',		'Ltd.72 PAV Building, Floor 4A, Ladprao Road',							'safeboys',				'1200336244738295'),
('prom_piang58',	'38 K Moo 9 Poochao Samingprai Road Samrongtai 2 10130',				'0945678910',			'9800473905843902'),
('Noisy_i3oAt',		'316/1 Moo 5 Phrabaramee Road Bankalim Patong Beach',					'0826288843',			'1200746382984012'),
('punzakungz',		'Srigun Don Mueang, 10210 Bangkok',										'028848120',			'9800287693485982'),
('paweena12',		'246 TIME SQUARE BIDG 21 ST FL. SUKHUMVIT RD., 2 10110',				'pawanapaikorn',		'9800202397571923'),
('Oatmaz20499',		'88/3-90 Soi Pathumkongka, Trimitr Rd., Samphantawong',					'oatty20499',			'1200758120249572'),
('pitipatmanz',		'43Rd Floor United Center Building Silom Road',							'commmpJaaa',			'1200783201923759'),
('Snsnil01',		'Nateen - Klong Son RoadMoo 4, Ao NangMuang 81000',						'16052501',				'9800845910139102'),
('nhufernny',		'246 Unit#10-02C 10Th Floor Time Square Building Sukhumvit Road',		'nipada096',			'1200345286572910'),
('InwRoei',			'40/1510-3 Ekachai 76 BANGBON 2 10150',									'0824718884',			'1200478392108592'),
('June_Aek012',		'Grand Pacific Hotel 259 Sukhumvit Road 2 10250',						'linemantime',			'1200491230158023'),
('aum_sap061',		'6th Floor HarinThorn Bldg., 54 North Sathorn Rd 2 10500',				'youdonotnomypass',		'9800023102935864'),
('nunjuratchaya', 	'453 Soi Ladphrao 122 Wangtonglang 2 10310',							'inahnun095',			'1200083092139482'),
('Brookeman',		'1/33 Soi WATANAWIBOON 1, BangkokNOI-TALINGCHAN Rd., TALINGCHAN',		'Pertyman',				'9800123958230567'),
('Martinlaws',		'80/47-48 Petchkasem Road Soi Petchkasem 42, 2 10160',					'onlymethatknowthis',	'9800123485039755'),
('Mirandasprite',	'43Rd Floor United Center Building Silom Road',							'spritesozaaa',			'9800249230150459'),
('Julairobert55',	'2 Soi Ladprakao 89 Khwang Anusaowari Khet Bang Khen Bangkok 10220',	'fiora1967',			'9800395074874830'),
('MiTH_Edward',		'218/7 Pairoj Village Bangna, 2 10260',									'PUBG_live',			'1200958203985717'),
('Adams_ty',		'150 M.2 Koktanode Karon',												'0606385910',			'1200948036571249'),
('annabellasc',		'64 MOO 1, BANGNA-TRAD ROAD KM.21 SRISAJORAKAEYAI 2 10540',				'feelingsobad555',		'1200859012936763'),
('Smite.TH',		'81 Northern Industry Estate Super Highway No. 11 Road Bangklang',		'whatismypassword',		'1200058586571258'),
('sienna.luc',		'Grand Pacific Hotel 259 Sukhumvit Road 2 10250',						'lucianismybf',			'1200950218503867'),
('agibarr',			'193/6266 16Th Floor Lake Ratchada Office Complex Ratchadapisek Road',	'Murrayme',				'9800098767127521'),
('Lendrewsa','		2116/32 Ramkhamhaeng Soi 24/3 Huamark',									'nyandthere',			'9800868130689793'),
('Carina_mont',		'16th Floor Italchai House 2013 New Petchburi Road Bangkapi 2 10320',	'merrymepls',			'1200589127590167');


--
-- Insert data into card type
--
INSERT INTO card_type(type_id, card_name, cash_discount, credit_discount, bdate) VALUES
('U',	'Chutikarn Anukul',			'0.05','0.1',	'2000-03-31'),
('D',	'Haley Davidson',			'0.2','0.25',	'1997-06-05'),
('B',	'Jeff Hardy',				'0.1','0.15',	'1998-07-14'),
('R',	'Tony Stark',				'0.05','0.1',	'2003-04-16'),
('U',	'Pongsakorn Piboonpongpun',	'0.05','0.1',	'1978-02-25'),
('B',	'Pranungfun Prapaenee',		'0.1','0.15',	'1994-09-16'),
('B',	'Prom Prompichan',			'0.1','0.15',	'1996-08-12'),
('U',	'Krittitee Nildam',			'0.05','0.1',	'2000-12-01'),
('R',	'Krissanapong Palakham',	'0.05','0.1',	'2001-02-26'),
('B',	'Paweena Hongitthiporn',	'0.1','0.15',	'1980-04-30'),
('D',	'Wasin Heesawat',			'0.2','0.25',	'1997-12-31'),
('B',	'Pitipat Lertsoontornpoj',	'0.1','0.15',	'1990-07-25'),
('R',	'Songchai Nildam',			'0.05','0.1',	'1985-04-14'),
('U',	'Napida Chongcharoenkit',	'0.05','0.1',	'1993-01-15'),
('B',	'Achiraya Roei',			'0.1','0.15',	'1996-03-16'),
('R',	'Aekkaluk Panyacharoensri',	'0.05','0.1',	'1989-04-24'),
('B',	'Ajjima Sapthamrong',		'0.1','0.15',	'1997-05-27'),
('D',	'Jiratchaya Benyakul',		'0.2','0.25',	'2000-05-14'),
('R',	'Brooke Perry',				'0.05','0.1',	'1999-09-20'),
('B',	'Martin Anderson',			'0.1','0.15',	'2000-02-14'),
('B',	'Miranda Kelley',			'0.1','0.15',	'2002-09-18'),
('R',	'Julai Turner',				'0.05','0.1',	'1988-11-28'),
('D',	'Edward Williams',			'0.2','0.25',	'1998-08-17'),
('U',	'Tony Adams',				'0.05','0.1',	'2001-07-25'),
('D',	'Annabella Myers',			'0.2','0.25',	'1997-05-16'),
('U',	'Alissa Smith',				'0.05','0.1',	'1998-04-24'),
('B',	'Sienna Douglas',			'0.1','0.15',	'1996-06-13'),
('R',	'Abigail Murray',			'0.05','0.1',	'2000-04-30'),
('D',	'Lenny Andrews',			'0.2','0.25',	'1978-10-24'),
('U',	'Carina Montgomery',		'0.05','0.1',	'1993-08-18');

--
-- Insert data into branch
--
INSERT INTO branch(branch_id, branch_location, branch_phone) VALUES
('1', 	'Central Pinklao', 		'028848120'),
('2', 	'Central Lardprao', 	'025411408'),
('3', 	'Fortune Town', 		'022485855'),
('4', 	'The Mall Bangkae', 	'024549265'),
('5', 	'BigC Chaengwatthana',	'025835857'),
('6', 	'Central Ramintra', 	'025525381'),
('7', 	'Central Rama III', 	'026736204'),
('8', 	'The Mall Bangkapi',	'027341852'),
('9', 	'Lotus Rama IV', 		'026716498'),
('10', 	'Homepro Rachapreuk', 	'024233266');

--
-- Insert data into onsite card
--
INSERT INTO onsite_card(card_no, exp_date, status_card, activate, deactivate, mem_id, card_name, branch_id) VALUES
('370481828','2021-10-09', 'T', '2020-10-09 18:50:00', null, 		   			'1200367215384927','Chutikarn Anukul','1'),
('748238498','2018-07-08', 'F', '2017-07-08 13:52:45', '2018-07-08 12:46:23', 	'9800437866483294','Haley Davidson','2'),
('747238746','2016-12-03', 'F', '2015-12-03 12:59:01', '2016-12-03 13:58:46', 	'1200546834828385','Jeff Hardy','3'),
('123042394','2018-09-24', 'F', '2017-09-24 13:03:43', '2018-09-24 11:57:43',	'9800463989387525','Tony Stark','4'),
('483249023','2021-03-15', 'T', '2019-03-15 12:34:45', null, 		   			'1200247844719603','Pongsakorn Piboonpongpun','5'),
('987324010','2021-12-31', 'T', '2019-12-31 11:11:11', null, 		   			'1200336244738295','Pranungfun Prapaenee','6'),
('342942349','2021-03-16', 'T', '2017-03-16 16:11:12', null, 					'9800473905843902','Prom Prompichan','7'),
('239409853','2017-06-25', 'F', '2016-06-25 13:46:09', '2017-06-25 18:49:36', 	'1200746382984012','Krittitee Nildam','8'),
('234234934','2021-05-26', 'T', '2018-05-26 11:47:34', null, 					'9800287693485982','Krissanapong Palakham','9'),
('023949732','2020-11-02', 'F', '2019-11-02 11:32:12', '2020-11-02 15:35:45', 	'9800202397571923','Paweena Hongitthiporn','10'),
('234932400','2021-06-15', 'T', '2018-06-15 12:34:50', null, 					'1200758120249572','Wasin Heesawat','8'),
('948943023','2021-07-30', 'T', '2020-07-30 18:36:59', null, 					'1200783201923759','Pitipat Lertsoontornpoj','7'),
('564849394','2018-12-01', 'F', '2017-12-01 19:01:32', '2017-12-01 14:25:10', 	'9800845910139102','Songchai Nildam','9'),
('234917347','2021-12-23', 'T', '2019-12-23 17:36:53', null, 					'1200345286572910','Napida Chongcharoenkit','3'),
('234812739','2016-09-30', 'F', '2015-09-30 20:21:39', '2016-09-30 11:49:56', 	'1200478392108592','Achiraya Roei','7'),
('343582739','2017-04-16', 'F', '2016-04-16 15:53:00', '2017-04-16 12:23:45', 	'1200491230158023','Aekkaluk Panyacharoensri','4'),
('324393040','2021-06-28', 'T', '2017-06-28 14:12:44', null, 					'9800023102935864','Ajjima Sapthamrong','8'),
('039483923','2017-09-17', 'T', '2017-09-17 19:31:55', null, 					'1200083092139482','Jiratchaya Benyakul','4'),
('234892939','2021-11-24', 'T', '2014-11-24 15:09:23', null, 					'9800123958230567','Brooke Perry','10'),
('234959032','2020-02-24', 'F', '2019-02-24 16:39:42', '2020-02-24 13:45:39', 	'9800123485039755','Martin Anderson','6'),
('584839203','2021-11-01', 'T', '2020-11-01 11:30:11', null, 					'9800249230150459','Miranda Kelley','4'),
('758492039','2021-07-07', 'T', '2017-07-07 12:59:09', null, 					'9800395074874830','Julai Turner','5'),
('578293498','2021-12-19', 'T', '2019-12-19 18:02:54', null, 					'1200958203985717','Edward Williams','8'),
('234823849','2021-10-18', 'T', '2018-10-18 17:58:39', null, 					'1200948036571249','Tony Adams','10'),
('394829239','2021-12-01', 'T', '2018-12-01 18:00:31', null, 					'1200859012936763','Annabella Myers','5'),
('959839238','2016-01-31', 'F', '2015-01-31 21:05:10', '2016-01-31 12:43:58', 	'1200058586571258','Alissa Smith','7'),
('387492929','2017-10-21', 'F', '2016-10-21 20:12:01', '2017-10-21 19:30:58',	'1200950218503867','Sienna Douglas','8'),
('234820983','2018-08-30', 'F', '2017-08-30 17:35:09', '2018-08-30 20:43:48',	'9800098767127521','Abigail Murray','5'),
('548920234','2021-09-21', 'T', '2019-09-21 10:59:04', null, 					'9800868130689793','Lenny Andrews','3'),
('348952939','2021-08-12', 'T', '2020-08-12 19:59:19', null, 					'1200589127590167','Carina Montgomery','6');
