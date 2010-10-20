# MySQL dump 7.1
#
# Host: localhost    Database: drop
#--------------------------------------------------------
# Server version  3.22.32

#
# Table structure for table 'access'
#
CREATE TABLE access (
  id tinyint(10) NOT NULL auto_increment,
  mask varchar(255) DEFAULT '' NOT NULL,
  type varchar(16) DEFAULT '' NOT NULL,
  reason text NOT NULL,
  UNIQUE mask (mask),
  PRIMARY KEY (id)
);

#
# Table structure for table 'blocks'
#
CREATE TABLE blocks (
  name varchar(64) DEFAULT '' NOT NULL,
  module varchar(64) DEFAULT '' NOT NULL,
  offset tinyint(2) DEFAULT '0' NOT NULL,
  status tinyint(2) DEFAULT '0' NOT NULL,
  weight tinyint(1) DEFAULT '0' NOT NULL,
  region tinyint(1) DEFAULT '0' NOT NULL,
  remove tinyint(1) DEFAULT '0' NOT NULL,
  PRIMARY KEY (name)
);

#
# Table structure for table 'blog'
#
CREATE TABLE blog (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'book'
#
CREATE TABLE book (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  body text NOT NULL,
  section int(10) DEFAULT '0' NOT NULL,
  parent int(10) DEFAULT '0' NOT NULL,
  weight tinyint(3) DEFAULT '0' NOT NULL,
  pid int(10) DEFAULT '0' NOT NULL,
  log text NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'boxes'
#
CREATE TABLE boxes (
  bid tinyint(4) NOT NULL auto_increment,
  title varchar(64) DEFAULT '' NOT NULL,
  body text,
  info varchar(128) DEFAULT '' NOT NULL,
  link varchar(128) DEFAULT '' NOT NULL,
  type tinyint(2) DEFAULT '0' NOT NULL,
  UNIQUE subject (title),
  UNIQUE info (info),
  PRIMARY KEY (bid)
);

#
# Table structure for table 'bundle'
#
CREATE TABLE bundle (
  bid int(11) NOT NULL auto_increment,
  title varchar(255) DEFAULT '' NOT NULL,
  attributes varchar(255) DEFAULT '' NOT NULL,
  UNIQUE title (title),
  PRIMARY KEY (bid)
);

#
# Table structure for table 'cache'
#
CREATE TABLE cache (
  url varchar(255) DEFAULT '' NOT NULL,
  data text NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (url)
);

#
# Table structure for table 'category'
#
CREATE TABLE category (
  cid int(10) unsigned NOT NULL auto_increment,
  name varchar(32) DEFAULT '' NOT NULL,
  type varchar(16) DEFAULT '' NOT NULL,
  post int(3) DEFAULT '0' NOT NULL,
  dump int(3) DEFAULT '0' NOT NULL,
  expire int(3) DEFAULT '0' NOT NULL,
  comment int(2) unsigned DEFAULT '0' NOT NULL,
  submission int(2) unsigned DEFAULT '0' NOT NULL,
  promote int(2) unsigned DEFAULT '0' NOT NULL,
  UNIQUE name (name),
  PRIMARY KEY (cid)
);

#
# Table structure for table 'channel'
#
CREATE TABLE channel (
  id int(11) NOT NULL auto_increment,
  site varchar(255) DEFAULT '' NOT NULL,
  file varchar(255) DEFAULT '' NOT NULL,
  url varchar(255) DEFAULT '' NOT NULL,
  contact varchar(255) DEFAULT '',
  timestamp int(11),
  UNIQUE site (site),
  UNIQUE file (file),
  UNIQUE url (url),
  PRIMARY KEY (id)
);

#
# Table structure for table 'chatevents'
#
CREATE TABLE chatevents (
  id int(11) NOT NULL auto_increment,
  body varchar(255) DEFAULT '' NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
);

#
# Table structure for table 'chatmembers'
#
CREATE TABLE chatmembers (
  id int(11) NOT NULL auto_increment,
  nick varchar(32) DEFAULT '' NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
);

#
# Table structure for table 'collection'
#
CREATE TABLE collection (
  cid int(10) unsigned NOT NULL auto_increment,
  name varchar(32) DEFAULT '' NOT NULL,
  types varchar(128) DEFAULT '' NOT NULL,
  UNIQUE name (name),
  PRIMARY KEY (cid)
);

#
# Table structure for table 'comments'
#
CREATE TABLE comments (
  cid int(6) NOT NULL auto_increment,
  pid int(6) DEFAULT '0' NOT NULL,
  lid int(6) DEFAULT '0' NOT NULL,
  author int(6) DEFAULT '0' NOT NULL,
  subject varchar(64) DEFAULT '' NOT NULL,
  comment text NOT NULL,
  hostname varchar(128) DEFAULT '' NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  score int(6) DEFAULT '0' NOT NULL,
  votes int(6) DEFAULT '0' NOT NULL,
  link varchar(16) DEFAULT '' NOT NULL,
  users text NOT NULL,
  PRIMARY KEY (cid),
  KEY lid (lid)
);

#
# Table structure for table 'cvs'
#
CREATE TABLE cvs (
  user varchar(32) DEFAULT '' NOT NULL,
  files text,
  status int(2) DEFAULT '0' NOT NULL,
  message text,
  timestamp int(11) DEFAULT '0' NOT NULL
);

#
# Table structure for table 'diaries'
#
CREATE TABLE diaries (
  id int(5) NOT NULL auto_increment,
  author int(6) DEFAULT '0' NOT NULL,
  text text,
  timestamp int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
);

#
# Table structure for table 'diary'
#
CREATE TABLE diary (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'entry'
#
CREATE TABLE entry (
  eid int(10) unsigned NOT NULL auto_increment,
  name varchar(32) DEFAULT '' NOT NULL,
  attributes varchar(255) DEFAULT '' NOT NULL,
  collection varchar(32) DEFAULT '' NOT NULL,
  UNIQUE name (name,collection),
  PRIMARY KEY (eid)
);

#
# Table structure for table 'feed'
#
CREATE TABLE feed (
  fid int(11) NOT NULL auto_increment,
  title varchar(255) DEFAULT '' NOT NULL,
  url varchar(255) DEFAULT '' NOT NULL,
  refresh int(11),
  uncache int(11),
  timestamp int(11),
  attributes varchar(255) DEFAULT '' NOT NULL,
  link varchar(255) DEFAULT '' NOT NULL,
  description text NOT NULL,
  UNIQUE title (title),
  UNIQUE link (url),
  PRIMARY KEY (fid)
);

#
# Table structure for table 'file'
#
CREATE TABLE file (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  version varchar(10) DEFAULT '' NOT NULL,
  url varchar(255) DEFAULT '' NOT NULL,
  downloads int(10) unsigned DEFAULT '0' NOT NULL,
  abstract text NOT NULL,
  description text NOT NULL,
  homepage varchar(255) DEFAULT '' NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'forum'
#
CREATE TABLE forum (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'item'
#
CREATE TABLE item (
  iid int(11) NOT NULL auto_increment,
  fid int(11) DEFAULT '0' NOT NULL,
  title varchar(255) DEFAULT '' NOT NULL,
  link varchar(255) DEFAULT '' NOT NULL,
  author varchar(255) DEFAULT '' NOT NULL,
  description text NOT NULL,
  timestamp int(11),
  attributes varchar(255) DEFAULT '' NOT NULL,
  PRIMARY KEY (iid)
);

#
# Table structure for table 'layout'
#
CREATE TABLE layout (
  user int(11) DEFAULT '0' NOT NULL,
  block varchar(64) DEFAULT '' NOT NULL
);

#
# Table structure for table 'locales'
#
CREATE TABLE locales (
  id int(11) NOT NULL auto_increment,
  location varchar(128) DEFAULT '' NOT NULL,
  string text NOT NULL,
  da text NOT NULL,
  fi text NOT NULL,
  fr text NOT NULL,
  en text NOT NULL,
  es text NOT NULL,
  nl text NOT NULL,
  no text NOT NULL,
  sw text NOT NULL,
  PRIMARY KEY (id)
);

#
# Table structure for table 'modules'
#
CREATE TABLE modules (
  name varchar(64) DEFAULT '' NOT NULL,
  PRIMARY KEY (name)
);

#
# Table structure for table 'node'
#
CREATE TABLE node (
  nid int(10) unsigned NOT NULL auto_increment,
  lid int(10) DEFAULT '0' NOT NULL,
  type varchar(16) DEFAULT '' NOT NULL,
  title varchar(128) DEFAULT '' NOT NULL,
  score int(11) DEFAULT '0' NOT NULL,
  votes int(11) DEFAULT '0' NOT NULL,
  author int(6) DEFAULT '0' NOT NULL,
  status int(4) DEFAULT '1' NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  comment int(2) DEFAULT '1' NOT NULL,
  promote int(2) DEFAULT '1' NOT NULL,
  moderate text NOT NULL,
  users text NOT NULL,
  timestamp_posted int(11) DEFAULT '0' NOT NULL,
  timestamp_queued int(11) DEFAULT '0' NOT NULL,
  timestamp_hidden int(11) DEFAULT '0' NOT NULL,
  attributes varchar(255) DEFAULT '' NOT NULL,
  KEY type (lid,type),
  KEY author (author),
  KEY title (title,type),
  PRIMARY KEY (nid),
  KEY promote (promote),
  KEY status (status)
);

#
# Table structure for table 'page'
#
CREATE TABLE page (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  link varchar(128) DEFAULT '' NOT NULL,
  body text NOT NULL,
  format tinyint(2) DEFAULT '0' NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'poll'
#
CREATE TABLE poll (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  runtime int(10) DEFAULT '0' NOT NULL,
  voters text NOT NULL,
  active int(2) unsigned DEFAULT '0' NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'poll_choices'
#
CREATE TABLE poll_choices (
  chid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  chtext varchar(128) DEFAULT '' NOT NULL,
  chvotes int(6) DEFAULT '0' NOT NULL,
  chorder int(2) DEFAULT '0' NOT NULL,
  PRIMARY KEY (chid)
);

#
# Table structure for table 'rating'
#
CREATE TABLE rating (
  user int(6) DEFAULT '0' NOT NULL,
  new int(6) DEFAULT '0' NOT NULL,
  old int(6) DEFAULT '0' NOT NULL,
  PRIMARY KEY (user)
);

#
# Table structure for table 'referer'
#
CREATE TABLE referer (
  url varchar(255) DEFAULT '' NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL
);

#
# Table structure for table 'role'
#
CREATE TABLE role (
  rid int(10) unsigned NOT NULL auto_increment,
  name varchar(32) DEFAULT '' NOT NULL,
  perm text NOT NULL,
  UNIQUE name (name),
  PRIMARY KEY (rid)
);

#
# Table structure for table 'site'
#
CREATE TABLE site (
  sid int(10) unsigned NOT NULL auto_increment,
  name varchar(128) DEFAULT '' NOT NULL,
  link varchar(255) DEFAULT '' NOT NULL,
  size text NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  feed varchar(255) DEFAULT '' NOT NULL,
  UNIQUE title (name),
  UNIQUE url (link),
  PRIMARY KEY (sid)
);

#
# Table structure for table 'story'
#
CREATE TABLE story (
  lid int(10) unsigned NOT NULL auto_increment,
  nid int(10) unsigned DEFAULT '0' NOT NULL,
  abstract text NOT NULL,
  body text NOT NULL,
  PRIMARY KEY (lid)
);

#
# Table structure for table 'tag'
#
CREATE TABLE tag (
  tid int(10) unsigned NOT NULL auto_increment,
  name varchar(32) DEFAULT '' NOT NULL,
  attributes varchar(255) DEFAULT '' NOT NULL,
  collections varchar(32) DEFAULT '' NOT NULL,
  UNIQUE name (name,collections),
  PRIMARY KEY (tid)
);

#
# Table structure for table 'topic'
#
CREATE TABLE topic (
  tid int(10) unsigned NOT NULL auto_increment,
  pid int(10) unsigned DEFAULT '0' NOT NULL,
  name varchar(32) DEFAULT '' NOT NULL,
  moderate text NOT NULL,
  UNIQUE name (name),
  PRIMARY KEY (tid)
);

#
# Table structure for table 'users'
#
CREATE TABLE users (
  id int(10) unsigned NOT NULL auto_increment,
  name varchar(60) DEFAULT '' NOT NULL,
  userid varchar(32) DEFAULT '' NOT NULL,
  passwd varchar(20) DEFAULT '' NOT NULL,
  real_email varchar(60) DEFAULT '' NOT NULL,
  fake_email varchar(60) DEFAULT '' NOT NULL,
  url varchar(100) DEFAULT '' NOT NULL,
  nodes tinyint(2) DEFAULT '10',
  mode tinyint(1) DEFAULT '0' NOT NULL,
  sort tinyint(1) DEFAULT '0',
  threshold tinyint(1) DEFAULT '0',
  bio tinytext NOT NULL,
  theme varchar(255) DEFAULT '' NOT NULL,
  signature varchar(255) DEFAULT '' NOT NULL,
  last_access int(10) unsigned,
  last_host varchar(255),
  status tinyint(4) DEFAULT '0' NOT NULL,
  hash varchar(12) DEFAULT '' NOT NULL,
  timezone varchar(8),
  rating decimal(8,2),
  language char(2) DEFAULT '' NOT NULL,
  role varchar(32) DEFAULT '' NOT NULL,
  PRIMARY KEY (id),
  UNIQUE name (name),
  UNIQUE userid (userid),
  UNIQUE real_email (real_email)
);

#
# Table structure for table 'variable'
#
CREATE TABLE variable (
  name varchar(32) DEFAULT '' NOT NULL,
  value text NOT NULL,
  PRIMARY KEY (name)
);

#
# Table structure for table 'watchdog'
#
CREATE TABLE watchdog (
  id int(5) NOT NULL auto_increment,
  user int(6) DEFAULT '0' NOT NULL,
  type varchar(16) DEFAULT '' NOT NULL,
  message varchar(255) DEFAULT '' NOT NULL,
  location varchar(128) DEFAULT '' NOT NULL,
  hostname varchar(128) DEFAULT '' NOT NULL,
  timestamp int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
);