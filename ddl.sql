use event_management;
CREATE TABLE admin (
  admin_id int NOT NULL,
  admin_email varchar(45) NOT NULL,
  event_head_id int DEFAULT NULL,
  username varchar(45) NOT NULL,
  password varchar(45) NOT NULL,
  PRIMARY KEY (admin_id),
  CONSTRAINT admin_ibfk_1 FOREIGN KEY (event_head_id) REFERENCES event_org (Event_head_ID)
);
insert into admin values(11,'anusha@gmail.com',50,'Anusha','rtehrhbdxf');

CREATE TABLE competition(
  co_ID int NOT NULL,
  co_name varchar(45) NOT NULL,
  co_date date NOT NULL,
  co_venue varchar(45) DEFAULT NULL,
  Event_head_id int DEFAULT NULL,
  PRIMARY KEY (co_ID),
  CONSTRAINT competition_ibfk_1 FOREIGN KEY (Event_head_id) REFERENCES event_org (Event_head_ID)
);
insert into competition values(212,'Hackathon','2022-12-05','Software Lab-2',10),
(234,'Gaana Sparde','2022-11-27','Mech Auditorium',60),
(321,'Treasure Hunt','2023-01-10','NesCafe', 50),
(423,'Move And Grove','2021-11-30','Basketball Court', 70),
(354,'Areo-Dash','2022-04-19','Football Ground',30);

CREATE TABLE departments (
  Department_ID int NOT NULL,
  Department_name varchar(45) NOT NULL,
  D_location varchar(45) NOT NULL,
  Dept_head varchar(45) NOT NULL,
  Internet_servers int DEFAULT NULL,
  PRIMARY KEY (Department_ID)
);

CREATE TABLE event_org (
  Event_head_ID int NOT NULL,
  Event_org_name varchar(45) NOT NULL,
  Department_id int NOT NULL,
  domain varchar(45) NOT NULL,
  Years_of_experience int NOT NULL,
  PRIMARY KEY (Event_head_ID),
  KEY Department_id (Department_id),
  CONSTRAINT event_head_ibfk_1 FOREIGN KEY (Department_id) REFERENCES department(Department_ID),
  CONSTRAINT event_head_ibfk_2 FOREIGN KEY (Department_id) REFERENCES department (Department_ID)
);

CREATE TABLE events_jssstu (
  Event_ID int NOT NULL,
  Event_Name varchar(60) NOT NULL,
  Event_head_id int NOT NULL,
  Venue varchar(45) NOT NULL,
  Date date NOT NULL,
  Count_user int NOT NULL ,
  PRIMARY KEY (Event_ID),
  KEY Event_head_id (Event_head_id),
  CONSTRAINT events_jssstu_ibfk_1 FOREIGN KEY (Event_head_id) REFERENCES event_org (Event_head_ID)
);
insert into events_jssstu values (001,'PLacement-Talk',50,'IS-Seminar Hall','2023-04-17',0),
(002,'Explore ML Workshop',10,'Software Lab-1','2023-03-05',0),
(003,'Blood Donation Drive',40,'Mech Auditorium','2022-10-20',0),
(004,'Marathon',40,'Mysore Palace','2021-01-15',0),
(005,'Dance your Heart Out',70,'MBA Lobby','2023-02-12',0);

CREATE TABLE finance_comittee (
  Finance_com_id int NOT NULL,
  com_name varchar(45) NOT NULL,
  Sponsers varchar(45) DEFAULT NULL,
  budget_limit int DEFAULT NULL,
  Size_of_committee int DEFAULT NULL,
  FOREIGN KEY(Finance_com_id) REFERENCES event_org(Event_head_ID)
);
insert into finance_comittee values(10,'Sponsors and Public Relations','Dreamers Cafe',5000,3),(20,'Executive Team','Kapoors cafe',4000,5), (50,'Treasurer','FirangiSutra',3000,2),(30,'Sponsorship','SolidWorks',6500,4),(70,'Treasuring Comittee','Devdan Foundation',2000,8);

CREATE TABLE user (
  Student_id int NOT NULL,
SR_NO int NOT NULL,
  user_email varchar(25) NOT NULL,
  user_phone_no int DEFAULT NULL,
  student_name varchar(45) NOT NULL,
  Event_id INT NOT NULL,
  PRIMARY KEY (Student_id,Event_id),
  Foreign key(Event_id) references events_jssstu(Event_ID)
);
insert into user values('01JST20CS032',202314,'Manojkumar@gmail.com',9333231788,'Manoj Kumar',''),('01JST20EC143',202451,'aashishurs@gmail.com',9856432315,'Aashish Urs','sdsdrddf'),('01JST20IS089',202132,'Eshanya@gmail.com',9832221343,'Eshanya','eefeerer');



 