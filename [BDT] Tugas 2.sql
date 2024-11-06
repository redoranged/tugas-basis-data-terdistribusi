/**
 * Tugas Basis Data Terdistribusi
 * 
 * NPM 		: 23552011007
 * Nama 	: Daniel Dwi Fortuna
 * Kelas	: TIF RM 23B
 */

/**
 * Schema Creation
 */

DROP DATABASE IF EXISTS tugas_daniel_23552011007;
CREATE DATABASE tugas_daniel_23552011007;

USE tugas_daniel_23552011007;

DROP TABLE IF EXISTS developer;

CREATE TABLE developer (
	idDeveloper CHAR(3) NOT NULL PRIMARY KEY,
	devNama VARCHAR(50),
	devCeo VARCHAR(50),
	devAlamat VARCHAR(100)
);

INSERT INTO developer (idDeveloper, devNama, devCeo, devAlamat)
VALUES
('D01', 'Electronic Arts', 'Andrew Wilson', 'Redwood City California'),
('D02', 'Ubisoft', 'Yves Guilemot', 'Bay Area San Fransisco'),
('D03', 'Rockstar Game', 'Terry Donovan', 'Broadway New York'),
('D04', 'Square Enix', 'Yusuhiro Fukushima', 'Shinjuku Eastside'),
('D05', 'Activision', 'Bobby Kotick', 'Ocean Park Boulevard');

DROP TABLE IF EXISTS game;

CREATE TABLE game(
	idGame INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idDeveloper CHAR(3),
	gameName VARCHAR(50),
	genre VARCHAR(50)
);

INSERT INTO game (idDeveloper, gameName, genre)
VALUES
('D01', 'Apex Legends', 'Battle Royale'),
('D01', 'Battlefield V', 'First Person Shooter'),
('D01', 'Star wars Jedi Fallen Order', 'Action Adventure'),
('D02', 'Watch Dog', 'Action Adventure'),
('D02', 'Rainbow Six Quarantine', 'Tactical Shooter'),
('D03', 'Grand Theft Auto V', 'Action Open World'),
('D03', 'Red Dead Redemption', 'Action Adventure'),
('D04', 'Final Fantasy IX', 'Action RPG'),
('D04', 'Kingdom Hearts III', 'Action RPG'),
('D05', 'Call of Duty Modern Warfare', 'Action Adventure');

DROP TABLE IF EXISTS tester;

CREATE TABLE tester(
	idTester INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idGame INT,
	namaTester VARCHAR(50),
	usia INT,
	rateGame FLOAT
);

INSERT INTO tester(idGame, namaTester, usia, rateGame)
VALUES
(1, 'Dave', 18, 85),
(6, 'Kirana', 21, 90),
(9, 'Frank', 15, 80),
(8, 'Jessica', 18, 95),
(10, 'Patrick', 24, 85),
(3, 'Farah', 19, 75),
(2, 'Jacob', 25, 90),
(4, 'Sabila', 18, 75);


DROP TABLE IF EXISTS logTester;

CREATE TABLE logTester(
	idLog INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	jenis VARCHAR(50),
	waktu TIMESTAMP DEFAULT(NOW())
);

/**
 * Soal

1. Buat Query Untuk menampilkan kolom devNama, devCeo, dan devAlamat pada tabel developer ?
2.
Buat Query untuk menampilkan devNama, dan devAlamat pada tabel developer yang beralamat di 'California' ?
3.
Buat Query Untuk menampilkan semua data di tabel developer untuk developer bernama 'Square Enix' ?
4. Buat Quary untuk menampilkan semua data di tabel game untuk tipe genre 'First Person Shooter' ?
5. Buat Query untuk menampilkan semua data di tabel game untuk idDeveloper D01 dan DO5 ?
6. Buat Query yang menampilkan gameName dan Genre di tabel game urutkan sesuai alfabet dari gameNama dan
Genre ?
7. Buat Query Untuk menampilkan gameName dan Genre di tabel game untuk genre game 'Action RPG' dan 'Action
Adventure'
8.
Buat Query untuk menghitung jumlah game bergenre 'First Person Shooter' ?
9.
Buat Query untuk menampilkan gameName, devNama, genre, devCeo dari tabel developer dan game ?
10. Buat Query untuk menampilkan namaTester, gameName, Usia dan RateGame dari tabel game dan tester ?
11. Buat Query untuk menghitung nilai rata2 dari tabel tester untuk rata2 RateGame ?
12. Buat Query untuk menampilkan semua data di tabel tester untuk usia yang berumur antara 15 sampai 18 (15 dan
18 ikut terbawa)
13. Buat Query untuk menampilkan gameName, namaTester, RateGame dari tabel game dan tester yang
rategamenya diantara nilai 80 sampai 90 (80 dan 90 dibawa) ?
14.
15.
Buat Query untuk menghitung jumlah tester yang memberi rate antara 85-90 (85 dan 90 ikut terbawa) ?
Buat Query untuk menampilkan gameName, namaTester, genre dan rate game dari tabel game dan tester yang
bermain genre Action RPG ?
16.
Buat view untuk melihat kolom gameName, devNama, namaTester, RateGame dari tabel developer, game dan
tester beri nama view tersebut 'vRateGame'?
a. Buat view vRateGame
b. Query memanggil view tersebut
17. Buat Store Procedure untuk input data pada tabel Tester dan beri nama SP tersebut 'INPUTTESTER?
a. Buat SP 'INPUTTESTER'
b. Panggil SP 'INPUTTESTER inputkan (idGame =7, namaTester 'Hilda'
, usia = 21, Rate 80)
18. Buat Store Procedure untuk Edit data pada tabel Tester dan beri nama SP tersebut 'EDITTESTER?
a. Buat SP 'EDITTESTER dengan 2 parameter (nama tester yang akan diganti dan hasil yg diganti)
b. Panggil SP 'EDITTESTER ubah nama Hilda yang tadi iinputkan menjadi Hildawati
19. Buat Store Procedure untuk Delete data pada tabel Tester dan beri nama SP tersebut 'DELETETESTER?
a. Buat SP 'DELETETESTER (1 parameter nama tester yang ingin dihapus)
b. Panggil SP 'DELETETESTER untuk menghapus data tester yang bernama Hildawati
20. Buat Triger untuk setiap aktivitas Create,Update dan Delete pada tabel tester dan masukan kedalam logtester dan
berinama
a. Buat Trigger dengan nama TrackTesterInput untuk setiap data tester yang diinput, jenis berinama 'Tambah
Data'
b. Buat Trigger dengan nama TrackTesterEdit untuk setiap data tester yang diedit, jenis berinama 'Edit Data'
c. Buat Trigger dengan nama TrackTesterDelete untuk setiap data tester yang didelete ,jenis berinama 'Delete
Data'

 */


/* Nomor 1 */

SELECT devNama, devCeo, devAlamat FROM developer;

/* Nomor 2 */

SELECT devNama, devAlamat FROM developer 
WHERE devAlamat LIKE '%California%';

/* Nomor 3 */

SELECT * FROM developer 
WHERE devNama = 'Square Enix';

/* Nomor 4 */

SELECT * FROM game 
WHERE genre = 'First Person Shooter';

/* Nomor 5 */

SELECT * FROM game 
WHERE idDeveloper IN ('D01', 'D05');

/* Nomor 6 */

SELECT gameName, genre FROM game 
ORDER BY gameName, genre;

/* Nomor 7 */

SELECT gameName, genre FROM game 
WHERE genre IN ('Action RPG', 'Action Adventure');

/* Nomor 8 */

SELECT COUNT(*) FROM game 
WHERE genre = 'First Person Shooter';

/* Nomor 9 */

SELECT gameName, devNama, genre, devCeo FROM developer
JOIN game ON developer.idDeveloper = game.idDeveloper;


/* Nomor 10 */

SELECT gameName, namaTester, genre, rateGame FROM game 
JOIN tester ON game.idGame = tester.idGame;

/* Nomor 11 */

SELECT AVG(rateGame) FROM tester;

/* Nomor 12 */

SELECT * FROM tester WHERE usia BETWEEN 15 AND 18;

/* Nomor 13 */

SELECT gameName, namaTester, rateGame FROM game
JOIN tester ON game.idGame = tester.idGame
WHERE rateGame BETWEEN 80 AND 90;

/* Nomor 14 */

SELECT COUNT(*) FROM tester
WHERE rateGame BETWEEN 85 AND 90;

/* Nomor 15 */

SELECT gameName, namaTester, genre, rateGame FROM game
JOIN tester ON game.idGame = tester.idGame 
WHERE genre = 'Action RPG';

/* Nomor 16 */

DROP VIEW IF EXISTS vRateGame;

CREATE VIEW vRateGame AS
SELECT gameName, devNama, namaTester, rateGame FROM developer
JOIN game ON developer.idDeveloper = game.idDeveloper 
JOIN tester ON game.idGame = tester.idTester;

SELECT * FROM vRateGame;

/* Nomor 17 */

/* a */
DROP PROCEDURE IF EXISTS inputTester;

DELIMITER //
//
CREATE PROCEDURE inputTester(
	IN input_idGame INT, 
	IN input_namaTester VARCHAR(50),
	IN input_usia INT,
	IN input_rate FLOAT
)
BEGIN
	INSERT INTO tester(idGame, namaTester, usia, rateGame)
	VALUES (input_idGame, input_namaTester, input_usia, input_rate);
END//
DELIMITER ;

/* b */
CALL inputTester(7, 'Hilda', 21, 80);

/* Nomor 18 */

/* a */
DROP PROCEDURE IF EXISTS editTester;

DELIMITER $$
CREATE PROCEDURE editTester(
	IN old_namaTester VARCHAR(50), 
	IN new_namaTester VARCHAR(50)
)
BEGIN
	UPDATE tester 
	SET namaTester = new_namaTester
	WHERE namaTester = old_namaTester;
END$$
DELIMITER ;

/* b */
CALL editTester('Hilda', 'Hildawati');

/* Nomor 19 */

/* a */
DROP PROCEDURE IF EXISTS deleteTester;

DELIMITER $$
CREATE PROCEDURE deleteTester(
	IN input_namaTester VARCHAR(50)
)
BEGIN
	DELETE FROM tester 
	WHERE namaTester = input_namaTester;
END$$
DELIMITER ;

/* b */
CALL deleteTester('Hildawati');

/* Nomor 20 */

/* a */
DROP TRIGGER IF EXISTS trackTesterInput

DELIMITER $$
CREATE TRIGGER trackTesterInput AFTER INSERT ON tester
FOR EACH ROW
BEGIN 
	INSERT INTO logTester (jenis, waktu)
	VALUES('Tambah Data', NOW());
END$$
DELIMITER ;

CALL inputTester(4, 'Daniel', 24, 90);

/* b */
DROP TRIGGER IF EXISTS trackTesterEdit

DELIMITER $$
CREATE TRIGGER trackTesterEdit AFTER UPDATE ON tester
FOR EACH ROW
BEGIN 
	INSERT INTO logTester (jenis, waktu)
	VALUES('Edit Data', NOW());
END$$
DELIMITER ;

CALL editTester('Daniel', 'Daniel D Fortuna');

/* c */
DROP TRIGGER IF EXISTS trackTesterDelete

DELIMITER $$
CREATE TRIGGER trackTesterDelete AFTER DELETE ON tester
FOR EACH ROW
BEGIN 
	INSERT INTO logTester (jenis, waktu)
	VALUES('Delete Data', NOW());
END$$
DELIMITER ;

CALL deleteTester('Daniel D Fortuna');

