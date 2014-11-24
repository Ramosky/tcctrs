/*script creation dataBase TCCTR*/
USE master


IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'tcctr'))
BEGIN
	ALTER DATABASE tcctr SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE tcctr  
END

CREATE DATABASE tcctr
GO

USE tcctr

/*CREATE TABLE member*/
CREATE TABLE members(
	idMember INT IDENTITY PRIMARY KEY,
	firstName VARCHAR(15) NOT NULL ,
	lastName  VARCHAR(15) NOT NULL,
	userName varchar(45) NOT NULL UNIQUE,
	address VARCHAR(100) NOT NULL,
	phoneNumber VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL
)

/*CREATE TABLE court*/
CREATE TABLE court(
	idCourt INT IDENTITY PRIMARY KEY,
	position VARCHAR(15) NOT NULL,
	number INT NOT NULL
)

/*CREATE TABLE reservation*/
CREATE TABLE reservation(
	idReservation INT IDENTITY PRIMARY KEY,
	fkMember INT NOT NULL ,
	fkCourt INT NOT NULL,
	withWho INT Not Null,
	date Date NOT NULL ,

	CONSTRAINT date CHECK (date>getdate() and date < DATEADD(month,1,getdate()))
)

/*CREATE table Comité*/

CREATE TABLE groups(
	idGroup INT IDENTITY PRIMARY KEY,
	name VARCHAR(45) NOT NULL
)


CREATE TABLE userGroup(
	idUserGroup INT IDENTITY PRIMARY KEY,
	fkGroup int NOT NULL,
	fkMembers int NOT NULL
)

GO
/*Add Contraint*/
ALTER TABLE reservation ADD FOREIGN KEY (fkMember) REFERENCES members(idMember);
ALTER TABLE reservation ADD FOREIGN KEY (fkCourt) REFERENCES court(idCourt);


ALTER TABLE userGroup ADD FOREIGN KEY (fkGroup) REFERENCES groups(idGroup) ON DELETE CASCADE;
ALTER TABLE userGroup ADD FOREIGN KEY (fkMembers) REFERENCES members(idMember);


/*INSERT INTO court*/
INSERT INTO court(position,number) values('North', 1);
INSERT INTO court(position,number) values('SOUTH', 2);

/*INSERT INTO members*/
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Octavius','Rowan','Boris','470-479 Vel, St.','(933) 934-0764','auctor.Mauris@Nullaegetmetus.edu'),('Gregory','Hyacinth','Luke','Ap #366-4199 Ante. Avenue','(234) 193-3649','ut@nislelementumpurus.org'),('Richard','Larissa','Hamilton','664-5905 Ac Street','(441) 899-1021','diam@augue.edu'),('Hilel','Blaine','Sawyer','Ap #484-9955 Vestibulum, Rd.','(114) 668-1534','lacus.Etiam@aliquetProinvelit.co.uk'),('Neil','Leila','Joshua1','Ap #307-3686 Dapibus St.','(150) 564-2292','nonummy.ut.molestie@risus.ca'),('Jamal','Lila','Rahim','9180 Curabitur Ave','(838) 829-6476','Quisque.porttitor.eros@musProin.co.uk'),('Preston','Reagan','Galvin','782-9320 Ac St.','(173) 245-7953','leo@faucibusMorbivehicula.org'),('Ralph','Kelly','Kevin','P.O. Box 914, 3975 Lorem Avenue','(484) 243-8807','pretium.et.rutrum@aliquetodio.co.uk'),('Burton','Anjolie','Upton','Ap #335-6011 Metus. Avenue','(943) 442-4421','enim.nec.tempus@sempercursusInteger.org'),('Cooper','Astra','Grant','P.O. Box 922, 2184 Mauris Avenue','(996) 384-9433','Curabitur.egestas@PraesentluctusCurabitur.net');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Cairo','Alma','Fuller1','Ap #195-7779 Placerat Rd.','(711) 677-0567','et.libero.Proin@eros.edu'),('Grant','Geraldine','Kato2','6472 Ac Rd.','(185) 342-8567','Integer@eratvitae.co.uk'),('Kevin','Shelly','Justin','P.O. Box 114, 3035 Elit Road','(689) 956-8838','urna.et@montes.net'),('Hayden','Heather','Bruno1','4547 Mauris Rd.','(904) 738-1203','libero.Morbi.accumsan@et.edu'),('Elmo','Paloma','Scottt','866-3452 Sed, Street','(504) 477-1511','ipsum.Donec.sollicitudin@gravidanuncsed.org'),('Elijahh','Imani','Cadman','9873 Vestibulum Road','(219) 304-7674','conubia.nostra@enimgravidasit.ca'),('Aladdin','MacKensie','Zane1','7465 Sed Av.','(699) 305-1913','elit.pharetra.ut@Integeridmagna.co.uk'),('Baker','Madison','Darius','P.O. Box 766, 4745 Diam Street','(296) 886-0932','dolor@luctuslobortis.ca'),('Quinlan','Lacota','Donovan','P.O. Box 269, 7670 Blandit St.','(823) 616-4845','Integer@In.edu'),('Neville','Linda','Baxter','Ap #440-7462 Nec Ave','(311) 708-5252','Proin.velit@velitCras.co.uk');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Victor','Zena','Wing','4152 Orci. St.','(773) 745-0604','Donec@Aliquam.ca'),('Jerry','Hadley','Charless','585-2070 Quisque Road','(715) 791-1689','et@tristique.com'),('Joel','Galena','Cain','513-7017 Nibh Ave','(975) 528-0580','Proin@commodoat.net'),('Simon','Tara','Colt','P.O. Box 845, 9817 Mauris Rd.','(214) 617-2837','diam.luctus.lobortis@duiCraspellentesque.ca'),('Justin','Willow','Scot','Ap #901-6572 Montes, Rd.','(596) 631-5177','facilisis.eget@elitelit.ca'),('Hiram','Lillith','Isaac','Ap #736-8904 Mi Av.','(299) 196-9001','lorem.auctor@neceleifend.com'),('Duncan','Christine','Mufutau1','564-3649 Eget Road','(583) 834-5884','sit.amet.dapibus@dignissimlacus.org'),('Rajah','Kitra','Francis','Ap #768-6899 Ipsum St.','(873) 144-1961','porttitor@Proin.co.uk'),('Vernon','Dora','Christian','106-3794 Diam Avenue','(777) 533-9254','sit@volutpatNulla.edu'),('Austin','Jessamine','Dean','P.O. Box 597, 7937 Gravida. Rd.','(800) 565-8308','adipiscing.elit@Duis.org');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Charle','Mara','Colin','P.O. Box 700, 3156 Facilisis Avenue','(272) 391-1920','amet@pedenecante.org'),('Ethan','Imogene','Price','Ap #986-1467 Lorem St.','(578) 408-7866','molestie.Sed.id@consectetuer.net'),('Yasir','Daphne','Slade','607-9931 Vel, Rd.','(991) 154-7197','velit@etnunc.edu'),('Ferdinand','Kylynn','Charles','P.O. Box 641, 7336 Morbi St.','(208) 779-0937','nibh.Aliquam.ornare@Fusce.org'),('Marsden','Olympia','Henry','1094 Class St.','(147) 751-8867','ut.dolor.dapibus@Quisque.com'),('Odysseus','Iliana','Eaton','784-3435 Donec Rd.','(387) 280-7997','eros.non@Aliquamadipiscinglobortis.org'),('Maxwell','Lucy','Lucas','1310 Lacinia St.','(293) 348-6493','semper.pretium.neque@Duiselementumdui.com'),('Cooper','Pascale','Mohammad','855-9498 Integer Street','(244) 580-5101','non@ipsumsodalespurus.com'),('Kasper','Ginger','Brian','4627 Velit St.','(592) 665-9299','a@lectussit.edu'),('Owen','Tatiana','Thanee','750-8313 Amet Rd.','(227) 445-9320','dapibus.ligula@Inscelerisquescelerisque.edu');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Connor','Yeo','Lionel','176-4080 Bibendum Avenue','(830) 407-9322','est@a.org'),('Drake','Phoebe','Damon1','802-5281 Morbi Road','(765) 276-9119','euismod.enim@sitametluctus.org'),('Devin','Azalia','Walker','P.O. Box 685, 4636 Ornare, Road','(403) 901-5207','consequat.nec.mollis@etrutrum.com'),('Quinn','Leah','John','P.O. Box 298, 7937 Sociosqu Avenue','(851) 563-5356','et@feugiat.edu'),('Hamilton','Lois','Kareem','P.O. Box 195, 7535 Ornare, Street','(798) 181-6962','ut.erat.Sed@liberoProinsed.org'),('Carter','Maia','Richard','1670 Pede St.','(590) 255-3456','sed.dui@commodohendreritDonec.net'),('Griffith','Rylee','Griffin','Ap #791-577 Quisque Road','(511) 462-4829','purus.ac.tellus@nislsem.edu'),('Akeem','Martha','Kato','P.O. Box 924, 2821 Erat. St.','(462) 408-3474','mi@convallisdolorQuisque.co.uk'),('Ulric','Nichole','Mannix','P.O. Box 942, 271 Molestie Rd.','(185) 228-4995','lobortis@Sedet.ca'),('Erasmus','Ora','Wesley','8150 Eu Rd.','(816) 743-6110','faucibus.id.libero@Morbivehicula.ca');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Octavius','Catherine','Platoo','8523 Sem. Rd.','(356) 483-5970','arcu.et@molestieSed.ca'),('Sawyer','Chiquita','Jared1','Ap #155-5252 Eros. Road','(221) 226-2386','tellus@anteipsumprimis.org'),('Robert','Martha','Beck1','Ap #498-7189 Libero Avenue','(885) 761-9311','nisi@euismodenim.net'),('Evan','Cecilia','Mark','765-611 Sed, Avenue','(653) 369-1055','nec.cursus@Suspendisse.org'),('Jesse','Rhea','Gregory','346-2298 Suscipit, St.','(929) 125-6649','amet.nulla@sagittisfelis.ca'),('Alden5n','Candace','Aalden','Ap #789-3427 Odio. Ave','(706) 942-2801','nec@etipsumcursus.edu'),('Brandon','Ayanna','Erasmus','845-8192 Natoque Street','(216) 245-6408','cursus.luctus.ipsum@gravidasagittisDuis.org'),('Quentin','Vivian','Ta4d','889 Pellentesque Rd.','(975) 313-2833','per.conubia.nostra@facilisisvitaeorci.net'),('Barclay','Maile','Cody','Ap #821-8169 Donec St.','(934) 804-4703','est.Nunc.ullamcorper@massanon.edu'),('Lucian','Quemby','Amir','P.O. Box 563, 8155 Sed Street','(989) 590-0310','Sed@Etiam.ca');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Cedric','Adara','Lester','Ap #717-4410 Elit St.','(123) 821-0341','quis.pede@duinec.edu'),('Seth','Mechelle','Quentin','P.O. Box 991, 6534 Quis, Avenue','(114) 472-4458','tempus@loremipsumsodales.co.uk'),('Howard','Sopoline','Boriss','P.O. Box 547, 7226 Hendrerit Street','(341) 299-4659','purus@Nuncmauris.co.uk'),('Tanner','Hayfa','Rudyard','P.O. Box 252, 7112 Enim. St.','(716) 543-7619','enim@montesnasceturridiculus.ca'),('Jeremy','Simone','Decla1n','7987 Quisque Avenue','(889) 671-3723','est@sagittis.edu'),('Philip','Laura','Adrian','348-1744 In Rd.','(601) 426-1171','ac.metus@orci.edu'),('Patrick','Cameran','Grady','387-7682 Vitae Ave','(352) 504-1214','penatibus.et.magnis@lacusvestibulumlorem.edu'),('Mason','Jayme','Zephania1','249-4556 Suspendisse Avenue','(151) 469-3600','at.velit@idlibero.org'),('Aquila','Naomi','Lars','Ap #143-9102 Eleifend Ave','(117) 851-7833','blandit@Nullamvelit.org'),('Zane2','Sophia','Keane','Ap #213-530 Vitae Rd.','(442) 722-6951','Proin@felisNullatempor.com');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Kirk','Erin','Traviss','P.O. Box 560, 6628 A, St.','(726) 102-8346','lectus@sed.co.uk'),('Thor','Idola','Callum1','8834 Pede Rd.','(611) 702-3331','Phasellus@urna.com'),('Kieran','Adena','August','Ap #884-2278 Augue. St.','(825) 537-2555','nibh@convalliserat.net'),('Jordan','Zephr','Peter','7262 Non Rd.','(642) 393-2958','mollis.vitae@ipsum.edu'),('Xavier','Shannon','Vladimir','962 Mollis. Road','(658) 469-4581','dolor.nonummy.ac@atliberoMorbi.net'),('Nathan','Eden','Myles','P.O. Box 637, 6128 Est. Av.','(824) 482-3160','faucibus@luctussitamet.net'),('Colby','Kay','Platto','841-4642 Mus. St.','(830) 251-7840','metus.eu.erat@enim.com'),('Dominic','Colleen','Travsis','P.O. Box 680, 5343 Mauris. Av.','(948) 186-8900','faucibus.ut.nulla@tellus.edu'),('Alden','Phyllis','Hakeem','Ap #508-461 Ac Av.','(665) 597-3028','imperdiet.ullamcorper@aliquamarcu.co.uk'),('Devin','Jade','Dieter','P.O. Box 547, 4640 Ligula. Rd.','(233) 468-4894','sit@enimsitamet.ca');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Orlando','Freya','Eda1n','2548 Sed Road','(508) 390-1861','urna.nec.luctus@et.edu'),('Dieter','Brielle','Hayes','752-5140 Ut, St.','(451) 227-8197','ligula.eu@id.co.uk'),('Solomon','Olympia','Channving','Ap #842-3736 Vel, Rd.','(811) 504-9827','sed.orci@risusMorbimetus.com'),('Elvis','Zorita','Stone','2359 Purus St.','(634) 626-7191','urna.Ut@at.org'),('Austin','Alana','Channing','Ap #847-6957 Velit. St.','(176) 392-9300','luctus.vulputate.nisi@consectetuer.ca'),('Cedric','Karyn','Alden1','Ap #447-3560 Nulla Rd.','(406) 101-4800','nunc@In.ca'),('Cole','Brittany','Raymond','P.O. Box 458, 5396 Non, Avenue','(910) 266-0534','Donec.tempor.est@quisaccumsanconvallis.org'),('Murphy','Audrey','Jared2','Ap #530-1557 Egestas. St.','(983) 285-6430','ullamcorper.viverra@laoreetlectus.org'),('Kibo','Taylor','Brandon','Ap #518-1873 Libero. Rd.','(670) 738-3670','diam.vel.arcu@auctorquis.co.uk'),('Harding','Shelly','Callum2','Ap #922-7960 At, St.','(903) 993-5570','cubilia.Curae.Donec@dolordolor.org');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Sylvester','Colette','Callum3','Ap #380-7368 Praesent Av.','(157) 265-4390','ornare.lectus.justo@enim.ca'),('Vance','Gloria','Brennan','Ap #995-7181 In Rd.','(861) 798-6116','mattis@non.org'),('Harlan','Brenna','Elijah1','P.O. Box 792, 2213 A Avenue','(759) 407-4242','ornare@Mauriseu.org'),('Victor','Jessamine','Tad1','9069 Sem. Rd.','(711) 299-2380','tellus.justo@utdolordapibus.co.uk'),('Malcolm1','Quyn','Dominic','Ap #760-191 Sit Av.','(864) 310-9968','Vivamus.rhoncus@quisurnaNunc.com'),('Drake','Fallon','Beck2','P.O. Box 102, 4199 Ac, Road','(197) 194-2143','morbi.tristique@hendreritidante.org'),('Kelly','Jasmine','Thaneee','P.O. Box 480, 8852 Mauris St.','(308) 381-4519','tempor@egestasligula.net'),('Emmanuel','Jocelyn','Malcolm2','Ap #851-5706 A, St.','(246) 590-2158','nec.eleifend@luctus.edu'),('Giacomo','TaShya','Arden','1024 Porta Avenue','(907) 878-4755','neque.sed@Quisque.edu'),('Steven','Isadora','Basil','955-7637 Iaculis Av.','(757) 262-5957','elementum@luctus.net');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Knox','Maite','Merrill','Ap #906-3222 Enim Avenue','(488) 188-3707','enim.gravida@In.net'),('Brady','Brianna','Tad2','6722 Consectetuer Rd.','(815) 513-7367','id@urnaUt.edu'),('Harding','Desiree','Bruno2','4790 Proin St.','(789) 300-6116','aliquet.magna@lobortis.ca'),('Keegan','Kristen','Blaze','324-2892 Luctus. Avenue','(354) 209-7771','diam.at@morbi.com'),('Knox','Maggie','Kane','Ap #688-1964 Odio. St.','(458) 977-3156','eget.magna.Suspendisse@Donec.co.uk'),('Curran','Petra','Lyle','Ap #909-7905 Aliquam Rd.','(721) 517-6375','laoreet@Fusce.edu'),('Guy','Britanney','Malcolm3','293-2790 Leo. Street','(454) 304-7846','et@nonlaciniaat.co.uk'),('Palmer','Avye','Harding','Ap #919-6329 Suspendisse Avenue','(179) 795-3213','eu@Aliquamnisl.edu'),('Philip','Belle','Burton','9486 Et Ave','(634) 102-4363','velit.Sed.malesuada@Cum.com'),('Orlando','Fredericka','Axel','P.O. Box 153, 2486 Arcu. St.','(910) 181-2342','non.vestibulum.nec@anuncIn.com');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Travics','Amaya','Jacob','Ap #942-3515 Aenean Rd.','(630) 502-0424','dapibus.ligula@eu.ca'),('Rooney','Echo','Tad3','3045 Aliquet Ave','(341) 129-7285','sed@ligulaconsectetuerrhoncus.edu'),('Conan','Dahlia','Roth','5609 Sodales. Rd.','(499) 273-7609','amet@ac.co.uk'),('Brady','Sonya','Ryan','7220 Ac St.','(817) 884-2394','Sed.eu@Nullatinciduntneque.ca'),('Hilel','Keiko','Dalton','P.O. Box 887, 2664 Arcu St.','(821) 456-0940','fermentum.metus@duiFuscealiquam.edu'),('Aidan','Brynn','Palmer','P.O. Box 329, 1335 Quisque Avenue','(527) 478-6136','ultricies.sem@Vivamus.com'),('Steven','Serena','Jarrod','P.O. Box 104, 7390 Ut Street','(828) 146-4017','parturient@necante.com'),('Tobias','Hope','Norman','Ap #549-341 Proin Rd.','(650) 373-3501','Nunc.mauris@vulputatelacusCras.ca'),('Dale','Naomi','Forrest','P.O. Box 860, 9659 Mattis Road','(229) 634-0997','erat.semper@tristique.com'),('Odysseus','Angelica','Marsden','9207 Aliquet Av.','(695) 666-6706','ante@Praesent.net');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Tad','Blythe','Connor','Ap #978-6017 Torquent Street','(677) 512-6932','Curabitur.consequat.lectus@condimentumDonec.net'),('Daquan','Jade','Gage','5964 In, Rd.','(433) 846-7150','lobortis.augue@pedeCum.com'),('Harrison','Phoebe','Zachery1','589 Magna. St.','(540) 659-6982','enim.consequat.purus@duiFuscediam.edu'),('Ishmael','Helen','Marshall','706 Hendrerit St.','(464) 419-2719','nunc.id.enim@commodo.com'),('Kirk','Debra','Fuller2','657-6485 Mattis Av.','(569) 941-0190','Fusce@ascelerisquesed.com'),('Felix','Idona','Thane','Ap #487-180 Non Av.','(432) 400-4984','ac.tellus@mi.ca'),('Ulric','Nita','Ian','Ap #951-5452 Fusce Street','(373) 848-4638','iaculis.enim@gravidanunc.ca'),('Walker','Tatiana','Caesar','P.O. Box 291, 7311 Quis St.','(106) 444-2432','convallis.erat.eget@etmalesuadafames.co.uk'),('Ali','Lilah','Edan3','592-6020 Sapien, Avenue','(952) 115-9630','Suspendisse.eleifend.Cras@euenimEtiam.org'),('Boriis','Cameran','Dane','P.O. Box 337, 7142 Vitae Ave','(988) 252-6083','et.rutrum@Proin.net');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Curran','Holly','Jakeem','P.O. Box 524, 2581 Fusce Road','(440) 663-1103','tortor.Nunc@lacusMaurisnon.org'),('Craig','Georgia','Ignatius','P.O. Box 785, 4670 Arcu Street','(793) 609-0905','imperdiet@rutrummagna.net'),('Paul','Maia','Barry','9788 At, Av.','(997) 822-3268','non.quam@Maurisnon.org'),('Macaulay','Brielle','Clarke','5768 Taciti Rd.','(803) 784-9822','congue.elit.sed@dapibus.ca'),('Geoffrey','Hanae','Kibo','669 Lacus. Av.','(862) 847-5100','sed@habitantmorbi.net'),('Kevin','Tara','Silas','P.O. Box 243, 823 Lorem, Street','(800) 916-6590','dui.in.sodales@etmalesuada.edu'),('Dean','Risa','Kenyon','3760 Amet, Street','(531) 592-7083','fames@laoreetipsumCurabitur.co.uk'),('Otto','Cleo','Gray','Ap #312-1028 Lorem St.','(640) 716-3949','metus.urna.convallis@sit.com'),('Cedric','Whoopi','Gavin','Ap #148-9600 Vel St.','(723) 318-0520','malesuada@Inmi.co.uk'),('Ralph','Denise','Leo','P.O. Box 996, 8527 Sapien, St.','(769) 844-2965','ac.metus@antedictum.net');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Curran','Leila','Guy','982-1782 Sollicitudin Rd.','(261) 554-1831','nunc@Proinnisl.com'),('Cyrus','Jolie','Jeremy','P.O. Box 508, 5466 Egestas. St.','(748) 275-5274','ligula.tortor@ultricesaauctor.co.uk'),('Camden','Gwendolyn','Lewis','491-2132 Scelerisque St.','(739) 698-5507','nulla@sit.ca'),('Todd','Rebecca','Cairo','155-8488 Pede St.','(490) 325-8920','pharetra@Crasvehiculaaliquet.com'),('Ross','Velma','Jesse','P.O. Box 167, 9450 Tellus Avenue','(887) 950-0410','ipsum.ac@porttitortellusnon.com'),('Ishmael','Daphne','Finn','Ap #229-9309 Consequat, St.','(850) 176-0589','dui.semper.et@atvelit.net'),('Wallace','Yoshi','Chaim','637-8907 Non Av.','(958) 422-3205','sit.amet.consectetuer@Duisvolutpat.ca'),('Hasad','Gisela','Ferris','2602 Est, Av.','(644) 691-0565','convallis.convallis@faucibuslectusa.ca'),('Quentin','Daria','Zane3','P.O. Box 716, 6097 Parturient St.','(591) 351-3569','vitae.nibh.Donec@non.co.uk'),('Alan','Mechelle','Chandler','9228 Odio Rd.','(536) 931-1336','tempus@ullamcorper.org');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Carl','Desiree','Troy','127-677 Nibh. St.','(700) 925-7575','Phasellus.elit.pede@non.edu'),('Grady','Lenore','Wade','P.O. Box 353, 7873 Mauris, Road','(784) 785-6128','quis.pede@quam.ca'),('Erich','Nerea','Marvin','Ap #910-7541 Eu Road','(266) 281-5729','vel@aliquetmetusurna.ca'),('William','Faith','Malachi','146-7795 Faucibus Avenue','(736) 348-6816','fermentum.arcu@Proinvelarcu.co.uk'),('Kuame','Macy','Damon2','P.O. Box 559, 8032 Quis, Ave','(487) 358-3632','Quisque.tincidunt@urnaVivamusmolestie.org'),('Valentine','Emma','Jack','666 Scelerisque Road','(693) 480-8317','velit.eu@idlibero.co.uk'),('Brian','Daphne','Emerson','Ap #112-6034 Dolor Ave','(649) 217-6827','gravida.nunc.sed@augue.edu'),('Xavier','Samantha','Allistair','Ap #387-1722 Enim. Road','(624) 321-2324','quam.elementum.at@mollis.ca'),('Zeph','Elizabeth','Barclay','Ap #225-6582 Cursus. St.','(768) 320-6086','rutrum.Fusce.dolor@vestibulummassarutrum.edu'),('Hoyt','Aretha','Xander','5187 Libero. Rd.','(231) 305-9357','elit@cursusinhendrerit.edu');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Francis','Maisie','Jerome','8132 Nam Street','(332) 656-9206','placerat.orci.lacus@feugiat.org'),('Gabriel','Breanna','Ferdinand','P.O. Box 606, 7496 Congue, Ave','(341) 465-7240','venenatis@risus.com'),('Dane','Leilani','Zephania2','Ap #199-9491 Metus Road','(761) 735-4237','Maecenas.malesuada.fringilla@auctorquis.org'),('Yoshio','Avye','Armando','533-7268 Ac, Avenue','(389) 840-1078','semper.dui.lectus@quis.org'),('Andrew','Leigh','Joel','642-5562 Ac Street','(173) 362-4073','Fusce@Quisqueporttitoreros.co.uk'),('Hashim','Freya','Hayden','Ap #570-4647 Pede Rd.','(563) 931-1344','magna.nec@rutrum.ca'),('Judah','Hannah','Curran','P.O. Box 155, 7873 Eleifend Street','(948) 446-1820','ornare@Nam.org'),('Gil','Gillian','Thomas','P.O. Box 341, 3399 Id, Avenue','(632) 630-8686','Vestibulum.ante.ipsum@nec.com'),('Elmo','Hayley','Clark','P.O. Box 817, 6745 Sit Rd.','(178) 666-1125','cursus.et@nasceturridiculusmus.org'),('Alde3n','Hollee','Kat1o','Ap #755-6522 Curabitur St.','(352) 549-4825','Sed@Phasellusvitae.ca');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Abbot','Maggy','Phelan','104 Non, Rd.','(413) 135-6876','Cum@ornaretortor.org'),('Ignatius','Desiree','Paki','P.O. Box 239, 8906 Vulputate, Avenue','(536) 957-4426','in.consectetuer@eu.co.uk'),('Len','Nerea','Hammett','Ap #427-3531 Parturient Rd.','(236) 555-3090','gravida.sit@Vivamusnibhdolor.co.uk'),('Dennis','Wynter','Nash','Ap #890-9638 Mollis Road','(302) 275-6725','non@ut.net'),('Abel','Kameko','Calvin','P.O. Box 115, 6162 Ligula. Avenue','(492) 101-7008','Nunc.mauris@maurissit.org'),('Melvin','Imelda','Russell','1329 Orci. St.','(100) 412-7651','arcu.Sed.et@Donectempus.com'),('Thomas','Jayme','Hashim','P.O. Box 389, 2875 Hendrerit Rd.','(271) 933-1385','malesuada@Phasellus.org'),('Elijah2','Kerry','Joshua2','2308 Metus. Road','(425) 234-5475','faucibus@aodio.co.uk'),('Talon','Blossom','Keefe','6269 Sed Av.','(539) 429-4919','odio.sagittis.semper@Craseget.edu'),('Coby','Signe','Bruce','106-7469 Neque. Street','(500) 922-0293','in.faucibus.orci@diamvel.ca');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Perry','Sophia','Denton','383-6210 Urna. Street','(343) 378-2654','sodales.nisi.magna@sollicitudincommodoipsum.edu'),('Prescotti','Suki','Phillip','Ap #918-7160 Proin Rd.','(720) 419-0046','sociis@Sedpharetrafelis.net'),('Dane','Caryn','Tyler','P.O. Box 411, 3078 Ridiculus Road','(213) 572-6894','porttitor@adipiscinglobortisrisus.edu'),('Edward','Hanae','Nero','Ap #385-7939 Nunc. Road','(568) 341-1726','fermentum@turpisIncondimentum.edu'),('Caesar','Kiona','Lucius','1894 Sem, Ave','(211) 634-3473','enim@Curabitur.ca'),('Ian','Lydia','Michael','782-8347 Augue Rd.','(293) 174-7103','felis.purus.ac@Fuscedolorquam.co.uk'),('Yuli','Leslie','Ciaran','6632 Tincidunt Avenue','(992) 775-6442','a.nunc@placerat.ca'),('Colin','Hyacinth','Ivor','Ap #282-9706 A, Av.','(442) 697-5671','non@Morbinequetellus.net'),('Barclay','Callie','Kadeem','944-490 Nisi Rd.','(568) 871-7427','Fusce.aliquet.magna@arcuSed.net'),('Yoshio','Shay','Benedict','P.O. Box 755, 6245 Mauris. Av.','(817) 321-3355','id.ante.Nunc@eros.edu');
INSERT INTO members([firstName],[lastName],[userName],[address],[phoneNumber],[email]) VALUES('Cairo','Ebony','Vaughan','Ap #735-5647 Tincidunt Rd.','(783) 883-9333','ac.turpis@lacusAliquam.ca'),('Vance','Willa','Bec3k','P.O. Box 434, 9811 Lacus. Street','(380) 889-0656','Donec.porttitor@habitant.edu'),('Alexander','Sandra','Elijah3','P.O. Box 424, 3469 Imperdiet Road','(875) 782-8828','risus.Quisque.libero@blandit.ca'),('Zephania3','Zoe','Arthur','2173 Quisque Avenue','(884) 616-7142','libero@tempor.org'),('Jameson','Unity','Shad','5124 Amet Ave','(814) 955-7206','sed@Pellentesque.co.uk'),('Lars','Gloria','Valentine','2206 Tempus Avenue','(558) 754-2648','scelerisque.neque.Nullam@commodoat.ca'),('Myles','Charissa','Decla3n','P.O. Box 460, 5135 Pede, Av.','(529) 626-8360','enim@Nunc.ca'),('Armando','Kalia','Zachery2','737-7593 Lorem Street','(728) 432-9885','velit.Pellentesque.ultricies@Curae.com'),('Cruz','Natalie','Dylan','Ap #587-4167 Morbi Road','(445) 650-8891','magna.Praesent@tellusjusto.edu'),('Ian','Alika','Mufutau2','535-5863 Vestibulum. Ave','(544) 569-4732','elit.pellentesque@commodoatlibero.co.uk');




/*SELECT *  FROM members  point 4 cast-test*/
SELECT *  FROM members
GO

/*SELECT *  FROM members  point 5 cast-test*/
SELECT COUNT(*) FROM members;

declare @nbrMembers as INT
select @nbrMembers =  COUNT(*) FROM members;
set @nbrMembers = (select COUNT(*) from members)

/*SELECT *  FROM court  point 6 cast-test*/
SELECT COUNT(*) FROM court;

declare @nbrCourt as INT
select @nbrCourt =  COUNT(*) FROM court;
set @nbrCourt = (select COUNT(*) from court)


/*Inserer une réservation pour le lendemain 16h00, faite par le membre 10 
et avec le membre 100, sur le court 123  point 7 cast-test*/

Begin TRY
	insert into reservation(fkMember, fkCourt ,withWho,date) VALUES('10' ,'123' , '100', '2014-11-25 16:00');
END TRY

BEGIN CATCH
	print 'Court dont exist';
END CATCH;
GO


/*Inserer une réservation pour le lendemain 16h00, faite par le membre 10 et avec le membre 100, sur le court 1*/

Begin TRY
	insert into reservation(fkMember, fkCourt ,withWho,date) VALUES('10' ,'1' , '100', '2014-11-25 16:00');
	print 'Insert ok';
END TRY

BEGIN CATCH
	print 'Insert Error';
END CATCH;
GO


/*Effacer le court 1*/
Begin TRY
	Delete from court where number = '1';
	print 'Delete ok';
END TRY
BEGIN CATCH
	print 'Delete Error';
END CATCH;
GO

/*Inserer un nouveau membre ayant le même nom d’utilisateur que le membre 23*/
GO
insert into members([firstName],[lastName],[address],[phoneNumber],[email],[userName]) VALUES('toto','toto','totohouse', '000000000', 'toto@toto.toto','toto');

Begin TRY
	insert into members([firstName],[lastName],[address],[phoneNumber],[email],[userName]) VALUES('toto','toto','totohouse', '000000000', 'toto@toto.toto','toto');
END TRY
BEGIN CATCH
	print 'Insert Error !!!! Same userName';
END CATCH;
GO


/*Inserer un membre sans spécifier de nom*/

Begin TRY
	insert into members([firstName],[lastName],[address],[phoneNumber],[email],[userName]) VALUES('','toto','totohouse', '000000000', 'toto@toto.toto','toto1');
END TRY
BEGIN CATCH
	print 'Insert Error !!!! Empty firstName';
END CATCH;
GO



/*Inserer un membre sans spécifier de lastName*/

Begin TRY
	insert into members([firstName],[lastName],[address],[phoneNumber],[email],[userName]) VALUES('toto','','totohouse', '000000000', 'toto@toto.toto','toto1');
END TRY
BEGIN CATCH
	print 'Insert Error !!!! Empty lastName';
END CATCH;
GO


/*Inserer une réservation dans le passé*/
Begin TRY
	insert into reservation(fkMember, fkCourt ,withWho,date) VALUES('10' ,'1' , '100', '2014-10-25 16:00');
	print 'Insert ok';
END TRY

BEGIN CATCH
	print 'Insert Error Time on the pass';
END CATCH;
GO


/*Inserer une réservation dans le passé*/
Begin TRY
	insert into reservation(fkMember, fkCourt ,withWho,date) VALUES('10' ,'1' , '100', '2014-12-25 16:00');
	print 'Insert ok';
END TRY

BEGIN CATCH
	print 'Insert Error Time on the futur';
END CATCH;
GO

/*Créer un nouveau groupe « Comité », associer le membre 44 à ce groupe*/
Insert into groups (name) VALUES('Comite');

Insert into userGroup(fkGroup,fkMembers) VALUES('1', '44');

/*Effacer le groupe « Comité »*/
Begin TRY
	DELETE from  groups where name = 'Comite';
	print 'Delete Group OK';
END TRY
BEGIN CATCH
	print ' Error Delete group';
END CATCH;
GO