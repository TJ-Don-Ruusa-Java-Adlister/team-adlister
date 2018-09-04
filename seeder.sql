-- All pre-made users share the same password ('passw0rd')
INSERT INTO users (username, first_name, last_name, email, password, phone_no)
VALUES
('admin', 'Admin', 'Le'' Admin', 'admin@adlister.com', '$2a$12$bgagtXCOELVsYg4dLXcwh.7s5lxaLvTny.Pv.tJHppkWvr2YLNtGO', '555-555-5555'),
('codeyduck', 'Codey', 'Duckery', 'codey@adlister.com', '$2a$12$bgagtXCOELVsYg4dLXcwh.7s5lxaLvTny.Pv.tJHppkWvr2YLNtGO', '555-897-1453'),
('frequentposter1', 'Bob', 'Johnson', 'sellerMaster@adlister.com', '$2a$12$bgagtXCOELVsYg4dLXcwh.7s5lxaLvTny.Pv.tJHppkWvr2YLNtGO', '555-212-1313');

INSERT INTO ads (user_id, title, description, date_posted)
VALUES
(3, 'garage sale', 'household goods, 3 bicycles, books and many more.', '2018-02-03 13:55:52'),
(2, 'Fridge for sale', ' Old Stuyvesant 1976 refrigerator in tip-top shape ', '2018-02-05'),
(3, 'MJ couch', 'Michael Jackson sat on it – own a piece of the King of Pop memorabilia.', '2018-02-05 13:55:52'),
(1, 'Motorcycle', '2007 Kawasaki Vulcan Classic 1600 7000 miles ($10000 Cash only!!)', '2018-03-01 13:55:52'),
(2, 'Professional Land Clearing by Joe', 'We clear acres of land with trees for a reasonable price – we also haul-off!', '2018-03-25 13:55:52'),
(1, 'Book a Session', 'Light, deep tissue, 30 min spots. Book with me online.', '2018-04-02 13:55:52'),
(2, 'wedding dress', 'Maybe it’s jinxed, but it has never been worn. I bought it because it was so pretty.', '2018-04-08 13:55:52'),
(1, 'Western Coral Snake', 'Looking for a Western Coral Snake. Call Stu Pitt at 555-432-8694', '2018-04-14 13:55:52'),
(2, 'German Shepherd', 'Retired service animal looking for a loving forever home. Neutered and gentle with kids. h', '2018-05-09 13:55:52'),
(2, '1yr old old English Bully for adoption', 'English bulldog with crate – loves to go for long walks.', '2018-05-09 13:55:52'),
(3, '2016 KIA Optima', '2016 KIA OPTIMA EX SEDAN 35K MILES WITH BACK UP CAMERA REBUILT TITLE FROM PREVIOUS ACCIDENT PRICE IS $8700 FIRM', '2018-05-09 13:55:52'),
(1, '2014 Honda Accord', '46K miles with BACKUP Camera rebuilt Title from prev accident.', '2018-05-10 13:55:52'),
(1, '$40 Mowing Lawn Service', 'Will mow front and back – outside dogs must be fenced in.', '2018-06-03 13:55:52'),
(3, 'power chair', 'My mom’s old chair – she upgraded to a new one. Battery is dead, but will work with a new battery.', '2018-06-10 13:55:52'),
(3, 'Elegant Gray MicroFiber LoveSeat', 'Loveseat set with plush cushions made with polyfill – some stubborn cat hairs and stains, but still good.', '2018-06-10 13:55:52');

INSERT INTO category (category)
VALUES
  ('Other'),
  ('Antiques'),
  ('Appliances'),
  ('Arts and Craft'),
  ('Automobile'),
  ('Beauty'),
  ('Children'),
  ('Computers'),
  ('Electronics'),
  ('Furniture'),
  ('Garden'),
  ('Toys and Games'),
  ('Video Games'),
  ('Pets and Animals');

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
(15,10);