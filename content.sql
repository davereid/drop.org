# MySQL dump 7.1
#
# Host: localhost    Database: dries
#--------------------------------------------------------
# Server version	3.22.32

#
# Table structure for table 'authors'
#
CREATE TABLE authors (
  aid varchar(30) DEFAULT '' NOT NULL,
  name varchar(50),
  url varchar(60),
  email varchar(60),
  pwd varchar(12),
  PRIMARY KEY (aid)
);

#
# Dumping data for table 'authors'
#

INSERT INTO authors VALUES ('Dries','God','http://www.buytaert.net/','dries@buytaert.net','pa55w0rd');

#
# Table structure for table 'blocks'
#
CREATE TABLE blocks (
  id tinyint(4) DEFAULT '0' NOT NULL auto_increment,
  author varchar(30),
  title varchar(60),
  content text,
  PRIMARY KEY (id)
);

#
# Dumping data for table 'blocks'
#


#
# Table structure for table 'comments'
#
CREATE TABLE comments (
  tid int(11) DEFAULT '0' NOT NULL auto_increment,
  pid int(11) DEFAULT '0',
  sid int(11) DEFAULT '0',
  date datetime,
  name varchar(60) DEFAULT '' NOT NULL,
  email varchar(60),
  url varchar(60),
  host_name varchar(60),
  subject varchar(60) DEFAULT '' NOT NULL,
  comment text NOT NULL,
  score tinyint(4) DEFAULT '0' NOT NULL,
  reason tinyint(4) DEFAULT '0' NOT NULL,
  PRIMARY KEY (tid)
);

#
# Dumping data for table 'comments'
#

INSERT INTO comments VALUES (1,0,9,'2000-05-03 20:47:54','','','','127.0.0.1','Re: my subject','my reply',0,2);

#
# Table structure for table 'poll'
#
CREATE TABLE poll (
  id int(11) DEFAULT '0' NOT NULL auto_increment,
  question varchar(150),
  answer1 varchar(100),
  answer2 varchar(100),
  answer3 varchar(100),
  answer4 varchar(100),
  answer5 varchar(100),
  answer6 varchar(100),
  votes1 tinyint(4),
  votes2 tinyint(4),
  votes3 tinyint(4),
  votes4 tinyint(4),
  votes5 tinyint(4),
  votes6 tinyint(4),
  status tinyint(4) DEFAULT '0',
  PRIMARY KEY (id)
);

#
# Dumping data for table 'poll'
#

INSERT INTO poll VALUES (8,'What chips do you prefer?','Mama Mia\'s','Doritos','Chipsletten','Hula Hoops','Pepper n\' Salt','Regular salt',NULL,0,0,0,0,NULL,0);
INSERT INTO poll VALUES (3,'My favorite puppet is?','Kermit','Miss Piggy','Gonzo','Dr. Teeth','UnConeD','',0,0,1,NULL,5,NULL,0);
INSERT INTO poll VALUES (4,'I eat my waffles ...','in fork sized pieces','one square at the time','one huge bite','on a train','I hate waffles','huh?',1,3,9,1,NULL,NULL,0);
INSERT INTO poll VALUES (9,'Fear leads to anger, anger leads to hate, and hate leads to ...','war','revolution','suffering','migraine','alcohol abuse','',NULL,1,1,2,2,NULL,0);
INSERT INTO poll VALUES (10,'Fear leads to anger, anger leads to hate, and hate leads to ...','war','revolution','suffering','migraine','alcohol abuse','',NULL,1,4,3,5,NULL,1);

#
# Table structure for table 'queue'
#
CREATE TABLE queue (
  qid smallint(5) unsigned DEFAULT '0' NOT NULL auto_increment,
  uid mediumint(9) DEFAULT '0' NOT NULL,
  uname varchar(40) DEFAULT '' NOT NULL,
  subject varchar(100) DEFAULT '' NOT NULL,
  article text,
  timestamp int(11),
  category varchar(64),
  abstract text,
  value int(11),
  votes int(11),
  PRIMARY KEY (qid)
);

#
# Dumping data for table 'queue'
#

#
# Table structure for table 'refer'
#
CREATE TABLE refer (
  url varchar(255) DEFAULT '' NOT NULL,
  name varchar(255),
  status int(1) DEFAULT '1',
  refers int(7) DEFAULT '0',
  create_dt int(11),
  access_dt int(11),
  PRIMARY KEY (url)
);

#
# Dumping data for table 'refer'
#

INSERT INTO refer VALUES ('http://www.buytaert.net/','buytaert.net',1,42,NULL,NULL);
INSERT INTO refer VALUES ('http://www.atlantis.lan/','',1,7,955955129,955957398);

#
# Table structure for table 'stories'
#
CREATE TABLE stories (
  sid int(11) DEFAULT '0' NOT NULL auto_increment,
  aid varchar(30) DEFAULT '' NOT NULL,
  subject varchar(255),
  time int(11),
  abstract text,
  comments text,
  article text,
  category varchar(128),
  informant varchar(20) DEFAULT '' NOT NULL,
  department varchar(128),
  PRIMARY KEY (sid)
);

#
# Dumping data for table 'stories'
#

INSERT INTO stories VALUES (9,'Dries','my subject',957369475,'my abstract','an acoomenttenjejee','my full story','Announcements','','we-added-a-department');
INSERT INTO stories VALUES (6,'Dries','test subject',957298138,'a story','editor\'s note','article','Space','','cool');
INSERT INTO stories VALUES (7,'Dries','now as a logged on user',957298203,'storietje','cool story','article','Gaming','Dries','beta-test');
INSERT INTO stories VALUES (8,'Dries','a real story',957301647,'abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract abstract  ','','story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story story','Girls','','');
INSERT INTO stories VALUES (10,'Dries','no article, just an abstract',957369541,'lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala lala','','','Announcements','','huh-huh-huh-huh');

#
# Table structure for table 'users'
#
CREATE TABLE users (
  uid int(11) DEFAULT '0' NOT NULL auto_increment,
  name varchar(60) DEFAULT '' NOT NULL,
  uname varchar(15) DEFAULT '' NOT NULL,
  email varchar(60) DEFAULT '' NOT NULL,
  femail varchar(60) DEFAULT '' NOT NULL,
  url varchar(100) DEFAULT '' NOT NULL,
  pass varchar(20) DEFAULT '' NOT NULL,
  storynum tinyint(4) DEFAULT '10' NOT NULL,
  umode varchar(10) DEFAULT '' NOT NULL,
  uorder tinyint(1) DEFAULT '0' NOT NULL,
  thold tinyint(1) DEFAULT '0' NOT NULL,
  noscore tinyint(1) DEFAULT '0' NOT NULL,
  bio tinytext NOT NULL,
  ublockon tinyint(1) DEFAULT '0' NOT NULL,
  ublock text,
  theme varchar(255) DEFAULT '' NOT NULL,
  signature varchar(255) DEFAULT '' NOT NULL,
  PRIMARY KEY (uid)
);

#
# Dumping data for table 'users'
#

INSERT INTO users VALUES (1,'D. Buytaert','Dries','grmbl@buytaert.net','grmbl_at_buytaert.net','http://www.buytaert.net/','pa55w0rd',8,'threaded',2,-1,0,'Information highways will make a greater impact on society then railways, electronic power and telephone!\r\n<BR>\r\n20, male, Antwerp, undergaduate CS at University of Antwerp\r\n',1,'<LI><A HREF=\"http://www.slashdot.org/\">slashdot.org</A></LI>\r\n<LI><A HREF=\"http://www.freshmeat.net/\">freshmeat.net</A></LI>\r\n<LI><A HREF=\"http://www.linux.com/\">linux.com</A></LI>\r\n<LI><A HREF=\"http://www.themes.org/\">themes.org</A></LI>\r\n<HR>\r\n<LI><A HREF=\"http://projectx.mx.dk/\">ProjectX</A></LI>\r\n<LI><A HREF=\"http://www.mirc.net/\">mIRC.net</A></LI>\r\n<LI><A HREF=\"http://www.irc-scripts.com/\">irc-scripts.com</A></LI>','starlight','-- Dries\r\n\r\n--\r\nI would hate to die.');
INSERT INTO users VALUES (2,'','dummy','dummy@fakeuser.com','dummy_at_fakeuser.com','http://www.fake.com/','javahack',10,'threaded',0,0,0,'I\'m a fake user created for testing purpose! =)',0,'','','Pfft.  I\'m fake but so what?');

#
# Table structure for table 'webboard'
#
CREATE TABLE webboard (
  topic_id int(11) DEFAULT '0' NOT NULL auto_increment,
  parent_id int(11) DEFAULT '0',
  root_id int(11) DEFAULT '0',
  subject varchar(255),
  message text,
  create_dt int(11) DEFAULT '0',
  author varchar(255),
  hostname varchar(255),
  PRIMARY KEY (topic_id)
);

#
# Dumping data for table 'webboard'
#
