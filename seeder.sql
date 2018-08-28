INSERT INTO users (username, first_name, last_name, email, password, phone_no)
VALUES
('mike1', 'mike', 'jones', 'mikejones@adlister.com', 'mike123', '555-212-1313'),
('sue1', 'sue', 'smith', 'suesmith@adlister.com', 'sue123', '555-897-1453'),
('matt134', 'matt', 'jones', 'mattjones@adlister.com', 'matt123', '555-212-1313'),
('stu007', 'stu', 'pitt', 'mstu2pitt@adlister.com', 'stu123', '555-432-8694'),
('thepepe', 'pepe', 'ronny', 'ronny@adlister.com', 'mron123', '555-292-2313'),
('mortyc137',  'morty', 'smith', 'mortyc137@adlister.com', 'morty123', '555-212-1313'),
('billygoat', 'bill', 'gotti', 'billcotti@adlister.com', 'bill123', '555-276-1314'),
('slam1', 'sal', 'ami', 'salami@adlister.com', 'sal123','555-292-1913'),
('cole2', 'cutter', 'cole', 'colecuts@adlister.com', 'cole123', '555-412-3213'),
('phil1', 'phil', 'dagrave', 'phildagrave@adlister.com', 'phill123', '575-272-1713'),
('don1', 'don', 'juan', 'don1@adlister.com', 'don123', '555-312-3323');

INSERT INTO ads (user_id, title, description, date_posted)
VALUES
(3, 'garage sale', 'household goods, 3 bicycles, books and many more.', '2018-02-03'),
(2, 'Fridge for sale', ' Old Stuyvesant 1976 refrigerator in tip-top shape ', '2018-02-05'),
(3, 'MJ couch', 'Michael Jackson sat on it – own a piece of the King of Pop memorabilia.', '2018-02-05'),
(1, 'Motorcycle', '2007 Kawasaki Vulcan Classic 1600 7000 miles ($10000 Cash only!!)', '2018-03-01'),
(5, 'Professional Land Clearing by Joe', 'We clear acres of land with trees for a reasonable price – we also haul-off!', '2018-03-25'),
(6, 'Book a Session', 'Light, deep tissue, 30 min spots. Book with me online.', '2018-04-02'),
(2, 'wedding dress', 'Maybe it’s jinxed, but it has never been worn. I bought it because it was so pretty.', '2018-04-08'),
(4, 'Western Coral Snake', 'Looking for a Western Coral Snake. Call Stu Pitt at 555-432-8694', '2018-04-14'),
(7, 'German Shepherd', 'Retired service animal looking for a loving forever home. Neutered and gentle with kids. h', '2018-05-09'),
(7, '1yr old olde English Bully for adoption', 'English bulldog with crate – loves to go for long walks.', '2018-05-09'),
(8, '2016 KIA Optima', '2016 KIA OPTIMA EX SEDAN 35K MILES WITH BACK UP CAMERA REBUILT TITLE FROM PREVIOUS ACCIDENT PRICE IS $8700 FIRM', '2018-05-09'),
(11, '2014 Honda Accord', '46K miles with BACKUP Camera rebuilt Title from prev accident.', '2018-05-10'),
(10, '$40 Mowing Lawn Service', 'Will mow front and back – outside dogs must be fenced in.', '2018-06-03'),
(9, 'power chair', 'My mom’s old chair – she upgraded to a new one. Battery is dead, but will work with a new battery.', '2018-06-10'),
(9, 'Elegant Gray MicroFiber LoveSeat', 'Loveseat set with plush cushions made with polyfill – some stubborn cat hairs and stains, but still good.', '2018-06-10');

INSERT INTO ads_topics (ads_id, category_id)
VALUES
(1,1), (1,2), (1,4), (1,7), (1,9),(1,10), (1,11), (1,12), (1,13),
(2,3),
(3,2), (3,10),
(4,5),
(5,1),
(6,1),
(7,1),
(8,14),
(9,14),
(10,14),
(11,5),
(12,5),
(13,1),
(14,2),(14,10),
(15,10)
;

