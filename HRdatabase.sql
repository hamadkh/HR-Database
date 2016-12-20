/*

MYSQL - DATABASE
HAMAD KHAWAJA
DATABASE CONCEPTS

USED SEQUEL PRO (MYSQL 5.7.16) FOR MAC TO CREATE DATABASE
QUERIES SHOULD WORK FOR ANY VERSION MYSQL DATABASE

*/
-- create the Schema
CREATE DATABASE IF NOT EXISTS `HRdatabase`;
DROP DATABASE IF EXISTS `HRdatabase`;

-- use

USE HRdatabase;

-- denormalized query
SELECT *
FROM EmployeeSkill
INNER JOIN Employee
ON EmployeeSkill.emp_ID=Employee.emp_ID
INNER JOIN Skill
ON EmployeeSkill.skill_ID=Skill.skill_ID
INNER JOIN Location
ON Employee.location_ID=Location.location_ID
INNER JOIN Scale
ON EmployeeSkill.scale_ID=EmployeeSkill.scale_ID
INNER JOIN Role
ON Employee.role_ID=Role.role_ID
INNER JOIN PositionSkills
ON PositionSkills.skill_ID=Skill.skill_ID
INNER JOIN VacantPositions
ON VacantPositions.job_ID=PositionSkills.skill_ID
-- create ROLE TABLE
CREATE TABLE IF NOT EXISTS Role (
  role_ID int(11) NOT NULL AUTO_INCREMENT,
  role_name varchar(45) NOT NULL,
  PRIMARY KEY (role_ID),
  UNIQUE KEY role_ID_UNIQUE (role_ID),
  UNIQUE KEY role_name_UNIQUE (role_name)
)

--create TABLE LOCATION
CREATE TABLE IF NOT EXISTS Location (
  location_ID int(11) NOT NULL AUTO_INCREMENT,
  location_name varchar(45) NOT NULL,
  PRIMARY KEY (Location_ID),
  UNIQUE KEY location_ID_UNIQUE (location_ID),
  UNIQUE KEY location_name_UNIQUE (location_name)
)

--create TABLE SCALE
CREATE TABLE IF NOT EXISTS Scale (
  scale_ID int(11) NOT NULL AUTO_INCREMENT,
  scale_level varchar(45) NOT NULL,
  PRIMARY KEY (scale_ID),
  UNIQUE KEY scale_ID_UNIQUE (scale_ID),
  UNIQUE KEY scale_level_UNIQUE (scale_level)
)

--create TABLE SKILL
CREATE TABLE IF NOT EXISTS Skill (
  skill_ID int(11) NOT NULL AUTO_INCREMENT,
  skill_name varchar(45) NOT NULL,
  PRIMARY KEY (skill_ID),
  UNIQUE KEY skill_ID_UNIQUE (skill_ID),
  UNIQUE KEY skill_name_UNIQUE (skill_name)
)

ALTER TABLE Skill
ADD UNIQUE (skill_name);

--create TABLE VACANTPOSITIONS
CREATE TABLE IF NOT EXISTS VacantPositions (
  job_ID int(11) NOT NULL AUTO_INCREMENT,
  job_name varchar(45) NOT NULL,
  PRIMARY KEY (job_ID),
  UNIQUE KEY job_ID_UNIQUE (job_ID),
  UNIQUE KEY job_name_UNIQUE (job_name)
)

--creat table EMPLOYEE

CREATE TABLE IF NOT EXISTS Employee (
   emp_ID INT NOT NULL AUTO_INCREMENT,
   emp_fname VARCHAR(45) NOT NULL,
   emp_lname VARCHAR(45) NOT NULL,
   emp_phone VARCHAR(45) NOT NULL UNIQUE,
   emp_email VARCHAR(45) NOT NULL,
   location_ID INT(11) NOT NULL,
   role_ID INT(11) NOT NULL,
  CONSTRAINT emp_ID
  PRIMARY KEY (emp_ID),
  CONSTRAINT location_ID
    FOREIGN KEY (location_ID)
    REFERENCES Location (location_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT role_ID
    FOREIGN KEY (role_ID)
    REFERENCES Role (role_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

    ALTER TABLE Employee
    ADD UNIQUE (emp_phone);

    ALTER TABLE Employee
    ADD UNIQUE (emp_email);

    --create TABLE POSITIONSKILLS

    CREATE TABLE IF NOT EXISTS PositionSkills (
       job_ID INT(11) NOT NULL,
       skill_ID INT(11) NOT NULL,
      PRIMARY KEY (job_ID,skill_ID),
        FOREIGN KEY (job_ID)
        REFERENCES VacantPositions(job_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        CONSTRAINT skill_ID
        FOREIGN KEY (skill_ID)
        REFERENCES Skill (skill_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE);

  --create EMPLOYEESKILL TABLE

  CREATE TABLE IF NOT EXISTS EmployeeSkill (
   emp_ID INT(11) NOT NULL,
   skill_ID INT(11) NOT NULL,
   scale_ID INT(11) NOT NULL,
  PRIMARY KEY (emp_ID,skill_ID),
        FOREIGN KEY (emp_ID)
    REFERENCES Employee(emp_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (skill_ID)
    REFERENCES Skill(skill_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT scale_ID
    FOREIGN KEY (scale_ID)
    REFERENCES Scale (scale_ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

    -----------------------------------------------  INSERT QUERIES -----------------------------------------------------
insert into Role (role_name) values
 ('Database Administrator III'),
 ('Database Administrator II'),
 ('Database Administrator I'),
 ('Application Developer'),
 ('Xamrin Developer'),
 ('Senior Developer'),
 ('Software Test Engineer I'),
 ('SEO Specialist'),
 ('Technologist'),
 ('Automation Specialist I'),
 ('Web Designer'),
 ('Senior Sales Associate'),
 ('IT Manager'),
 ('Operator'),
 ('Technical Writer'),
 ('Software Engineer III'),
 ('Data Scientist'),
 ('Software Engineer I'),
 ('Software Engineer II'),
 ('Network Engineer');

 insert into Scale(scale_level) values
 ('Fundamental Awareness'),
 ('Novice'),
 ('Intermediate'),
 ('Advance'),
 ('Expert');

 insert into Location(location_name) values
 ('NYC'),
 ('Bristol'),
 ('LA'),
 ('Huston'),
 ('Illinois'),
 ('New Haven'),
 ('Boston'),
 ('Miami'),
 ('London'),
 ('Frankfurt'),
 ('Berlin'),
 ('Seoul'),
 ('Dehli'),
 ('Milan'),
 ('Luceren');

---------- INSERT EMPLOYEE ------------

 INSERT IGNORE INTO Employee (emp_fname,emp_lname,emp_phone,emp_email,location_ID,role_ID) VALUES
 ("Rebekah","Olga","(916) 635-4198","eleifend@loremsitamet.co.uk",15,13),
 ("Yasir","Jessamine","(574) 944-1002","id.libero@erosturpisnon.ca",1,7),
 ("Zane","Hollee","(368) 237-5614","quis.lectus.Nullam@elitpellentesquea.net",3,11),
 ("Julian","Knox","(633) 366-9624","a.enim@eu.edu",2,12),
 ("Cody","Lester","(238) 387-5983","iaculis.aliquet.diam@cursusInteger.com",14,4),
 ("Chaney","Dillon","(906) 583-7235","egestas.Aliquam.nec@antebibendum.ca",7,8),
 ("Kato","Kylynn","(482) 414-9308","Nunc.ac.sem@neccursusa.ca",7,6),
 ("Keane","Wang","(218) 181-2713","eu.augue.porttitor@elitAliquamauctor.com",5,18),
 ("Hilel","Keegan","(229) 842-6747","dis.parturient.montes@Nullatempor.net",5,20),
 ("Quinn","Channing","(988) 821-5292","sapien@mus.ca",2,4),
 ("Tanek","Kiayada","(637) 417-8646","ultrices@lectusjustoeu.org",4,17),
 ("Daniel","Mercedes","(179) 975-8397","urna.Ut@montesnascetur.net",1,13),
 ("Kamal","Michael","(970) 183-7891","faucibus.orci.luctus@idblandit.ca",4,15),
 ("Molly","Bianca","(750) 697-5699","massa.non@risusNulla.co.uk",12,9),
 ("Tarik","Mona","(752) 497-4703","varius.ultrices.mauris@augueutlacus.com",9,1),
 ("Jorden","Tad","(276) 665-1731","tincidunt.congue.turpis@eusem.edu",13,2),
 ("Ocean","Roth","(455) 145-6905","at.libero.Morbi@eudolor.net",15,8),
 ("Porter","Lareina","(173) 761-7807","fringilla.est.Mauris@sagittisDuis.com",15,2),
 ("Kristen","Christen","(376) 209-8304","risus.Donec@Lorem.org",5,7),
 ("Chelsea","Philip","(149) 167-8722","velit.Aliquam.nisl@euismod.com",12,13),
 ("Lacy","Angela","(717) 438-0880","elit.sed.consequat@Cras.com",10,4),
 ("Galvin","Calista","(604) 907-9082","Pellentesque.ultricies@aneque.ca",10,5),
 ("Cadman","Kellie","(933) 738-5965","porttitor@egettincidunt.ca",11,20),
 ("Sydnee","Armand","(555) 272-3457","nulla@estacfacilisis.co.uk",13,19),
 ("Addison","Reuben","(492) 793-4989","sed@interdumSedauctor.co.uk",2,5),
 ("Kermit","Rinah","(270) 673-3926","feugiat@augueutlacus.co.uk",7,1),
 ("Avye","Jamalia","(197) 752-7772","non.leo.Vivamus@loremluctus.edu",15,9),
 ("Lyle","Alexander","(340) 200-1121","semper.Nam@Nullaeget.co.uk",11,15),
 ("Bradley","Kibo","(898) 884-3097","id@duiCras.net",15,16),
 ("Denise","Jillian","(667) 858-9219","lorem.vitae.odio@acturpisegestas.edu",1,1),
 ("Bell","Alec","(176) 128-3339","Duis@sedduiFusce.org",1,1),
 ("Fulton","Clare","(239) 496-2212","sapien@fringilla.co.uk",4,19),
 ("Dakota","Jaquelyn","(928) 709-7414","molestie.arcu.Sed@lacusMaurisnon.com",5,12),
 ("Heidi","Walter","(387) 200-3120","dictum.mi.ac@velitSedmalesuada.ca",12,2),
 ("Sloane","Abraham","(847) 879-3182","lacus.pede.sagittis@nectempusscelerisque.net",13,2),
 ("Danielle","Uta","(430) 524-2765","In@mifelis.org",1,16),
 ("Quinn","Elliott","(107) 314-2039","id.ante.dictum@nuncQuisqueornare.org",4,6),
 ("Leo","Andrew","(145) 688-4090","et.eros@estmollisnon.co.uk",7,4),
 ("Raja","Kareem","(987) 640-6360","consectetuer.adipiscing.elit@Nulla.net",9,3),
 ("Stone","Brianna","(335) 268-4484","mi.tempor@rhoncusProin.com",14,18),
 ("Keith","Cheryl","(865) 827-2281","et@sed.org",8,18),
 ("Micah","Blake","(862) 842-7546","sed.dictum.eleifend@etmagnisdis.net",4,5),
 ("Rosalyn","Sharon","(174) 467-9711","laoreet.ipsum.Curabitur@Maecenasmifelis.com",12,19),
 ("Kirestin","Mia","(778) 649-9568","turpis.nec@amet.com",14,7),
 ("Hiram","Avram","(915) 129-8794","mus.Aenean.eget@indolorFusce.com",3,12),
 ("Shea","Wynne","(642) 645-0433","cursus.et.eros@pedenecante.org",2,5),
 ("Steven","Lilah","(167) 483-6960","Quisque.varius.Nam@urna.ca",10,5),
 ("Desirae","Rose","(280) 515-4008","mi.enim@malesuadavelconvallis.ca",3,2),
 ("Natalie","Beverly","(481) 242-6592","et@Fuscemilorem.edu",7,18),
 ("Gabriel","Dacey","(171) 551-3585","vulputate@molestie.org",2,14),
 ("Mikayla","Bell","(475) 206-2939","blandit.enim.consequat@facilisislorem.ca",7,10),
 ("Tatyana","Wanda","(331) 736-2981","ac.fermentum@inconsequatenim.ca",15,18),
 ("Danielle","Brynn","(296) 627-4906","mollis.lectus.pede@Aliquamadipiscing.org",9,16),
 ("Aspen","Libby","(826) 315-7949","ultrices@sagittisaugueeu.co.uk",14,13),
 ("Ali","Mallory","(607) 801-0595","libero.nec@vestibulumloremsit.co.uk",10,2),
 ("Oleg","Brennan","(375) 690-6770","purus.Nullam.scelerisque@eros.edu",12,4),
 ("Quyn","Heidi","(135) 705-9488","ipsum.Donec@magnisdisparturient.com",6,15),
 ("Anjolie","Vielka","(516) 850-5114","ornare.lectus@morbitristiquesenectus.co.uk",8,13),
 ("Sydney","Ezekiel","(694) 665-4810","enim.Mauris.quis@utipsum.com",6,4),
 ("Aurora","Regan","(253) 301-3427","orci.Ut.sagittis@nonnisiAenean.net",8,9),
 ("Leslie","Petra","(213) 943-8254","augue@sem.co.uk",3,16),
 ("Guinevere","Jin","(287) 855-3671","sed.facilisis.vitae@aenimSuspendisse.net",14,13),
 ("Eden","Reed","(623) 617-2188","pharetra.sed.hendrerit@justofaucibuslectus.edu",10,9),
 ("Kelly","Ursa","(405) 688-1622","tempus@arcuMorbi.org",1,2),
 ("Oleg","Xerxes","(933) 144-1012","non.arcu@perinceptoshymenaeos.net",7,10),
 ("Ross","Risa","(398) 654-0504","arcu.Vestibulum.ante@lacusAliquam.co.uk",3,17),
 ("Lacey","India","(124) 891-8513","tempor.augue@ultriciessemmagna.com",13,4),
 ("Quon","Molly","(193) 210-6530","Donec.fringilla.Donec@velitQuisquevarius.net",9,17),
 ("Giselle","Jolene","(474) 204-0888","cubilia@vitaeorciPhasellus.ca",13,7),
 ("Fritz","Baker","(878) 287-1010","erat@Duis.com",13,17),
 ("Illana","Kieran","(719) 353-9676","justo.faucibus@pharetrafeliseget.org",12,19),
 ("Clare","Chase","(799) 471-0043","fringilla@ornare.org",13,2),
 ("Valentine","Cheryl","(863) 903-1673","fringilla.Donec.feugiat@Donecatarcu.org",3,4),
 ("Stephen","Kylee","(590) 160-8337","lorem.sit@nasceturridiculusmus.org",4,16);


------ INSERT SKILLS ----------

INSERT IGNORE INTO Skill (skill_name) VALUES
("Data Management"),
("Database Capacity Management"),
("Database Creation"),
("Database Monitoring & Performance Tuning"),
("Managing Database Instances"),
("RAC Administration"),
("Availability Management"),
("Capacity Management"),
("Change Management"),
("Deployment Management"),
("Design and Planning"),
("Compiler Development"),
("Compiling"),
("Debugging"),
("Defining the Specification"),
("Front End Programming/Scripting"),
("Desktop Application Development"),
("Embedded Systems"),
("Enterprise Application Development"),
("Firmware"),
("Game Development"),
("API Testing"),
("Automated Testing"),
(" BlackBox Testing"),
("Compatibility Testing"),
("Create Test Strategy"),
("JAVA"),
("Mobile Application"),
("VBScripting"),
("Testing for compatibility"),
("Hadoop"),
("SAP EC"),
("SAP EHS"),
("SAP EP"),
("SAP EWM"),
("C Programming Language"),
("C#");

---- INSERT EMPLOYEE SKILLS -------

INSERT INTO EmployeeSkill (emp_ID,skill_ID,scale_ID) VALUES (63,34,1),(65,21,3),(49,6,5),(44,37,2),(37,14,2),(27,7,5),(59,22,2),
(25,10,4),(28,31,4),(41,24,2),(69,32,2),(38,33,5),(66,1,1),(6,11,4),(47,19,2),(23,31,1),(54,9,2),(34,22,5),(12,3,3),(41,5,3),
(2,17,5),(22,22,1),(62,32,3),(5,2,3),(22,10,3),(16,24,5),(20,20,5),(24,36,3),(51,7,2),(22,27,5),(58,2,4),(26,27,3),(13,24,1),
(50,8,5),(64,4,4),(69,11,3),(39,16,4),(59,32,4),(1,37,2),(14,35,1),(39,10,5),(64,30,2),(5,22,4),(26,17,4),(60,4,2),(62,30,2),
(31,4,1),(21,5,4),(12,19,2),(25,14,2),(30,7,3),(59,21,5),(8,10,2),(28,28,5),(42,27,5),(40,31,3),(13,12,2),(47,28,4),(45,27,5),
(23,2,2),(40,27,2),(29,8,2),(26,12,1),(46,28,4),(7,27,1),(44,19,1),(26,8,3),(56,17,4),(47,35,5),(13,32,5),(26,28,2),(61,13,5),
(25,29,4),(64,11,3),(56,1,2),(41,31,1),(6,6,3),(64,8,4),(12,20,5),(12,22,4),(65,34,2),(66,28,4),
(10,6,2),(25,37,1),(18,15,5),(54,21,4),(40,24,1),(66,32,4),(3,2,3),(65,25,1),(28,11,1),(3,13,4),(39,4,2),(4,25,3),
(34,24,1);

------ INSERT VACANT POSITION -----------
insert into VacantPositions (job_name) values
 ('Technologist'),
 ('Automation Specialist I'),
 ('Web Designer'),
 ('Senior Sales Associate'),
 ('IT Manager'),
 ('Operator'),
 ('Technical Writer'),
 ('Software Engineer III'),
 ('Data Scientist'),
 ('Software Engineer I'),
 ('Software Engineer II'),
 ('Network Engineer');

---------------------------POSITION SKILLS ------------------

INSERT IGNORE INTO PositionSkills (job_ID,skill_ID) VALUES (4,5),(1,21),(7,27),(5,30),(10,26),(7,8),(10,5),(2,8),(2,24),
(2,7),(12,17),(11,27),(3,4),(5,8),(3,13),(4,23),(12,7),(5,14),(10,7),(2,15),(12,32),(2,9),(1,31),(7,1),(10,13),(1,22),
(6,25),(5,24),(11,2),(10,28),(5,3),(7,9),(1,6),(2,30),(9,1),(8,34),(8,15),(4,15),(9,16),(2,2),(5,32),(4,7),(9,37),(11,3),
(10,22),(2,36),(2,5),(1,9),(7,2),(10,18),(12,26),(10,15),(6,14),(8,21),(8,12),(9,26),(5,3),(3,37),(3,15),(7,26),(9,8),(1,19),
(7,36),(7,7),(4,7),(11,31),(8,33),(9,20),(7,13),(11,14),(9,15),(7,26),(10,19),(9,34),(3,11),(4,6),(5,9),(4,25),(7,10),(12,14),
(9,30),(7,16),(12,8),(8,24),(4,1),(4,23),(2,26),(12,10),(6,14),(9,20),(2,32),(9,33),(9,2),(12,6),(7,37),(1,2),(6,34),(1,26),
(1,19),(3,21);

-----------------------------------------------------------------------------

QURIES VIEW

-----------------------------------------------------------------------------

--all employees and their current positions
CREATE VIEW EMPLOYEE_POSITIONS AS
SELECT EMPLOYEE.emp_fname, EMPLOYEE.emp_lname, Role.role_name
FROM Employee
INNER JOIN Role
ON Employee.role_ID=Role.role_ID;

--employees and their skills
CREATE VIEW EMPLOYEE_SKILL AS
SELECT Employee.emp_fname, Employee.emp_lname, Skill.skill_name
FROM EmployeeSkill
INNER JOIN Employee
ON EmployeeSkill.emp_ID=Employee.emp_ID
INNER JOIN Skill
ON EmployeeSkill.skill_ID=Skill.skill_ID
ORDER BY EmployeeSkill.emp_ID ;


--- list of Vacant positions and their required skills
CREATE VIEW VacantPositions_ReqSkills AS
SELECT VacantPositions.job_name,Skill.skill_name
FROM PositionSkills
INNER JOIN VacantPositions
ON VacantPositions.job_ID=PositionSkills.job_ID
INNER JOIN Skill
ON Skill.skill_ID=PositionSkills.skill_ID
ORDER BY VacantPositions.job_ID ;

-- NUMBER OF EMPLYOEES PER POSITION OR ROLE
CREATE VIEW NUMBER_OF_EMPLOYEES_PER_ROLE AS
SELECT Role.role_name,COUNT(DISTINCT Employee.emp_ID) as NUMBER_OF_EMPLOYEES FROM Employee, Role WHERE Employee.role_ID=Role.role_ID
GROUP BY Role.role_ID;

--- NUMBER OF SKILLS REQUIRED FOR EACH VacantPositions
CREATE VIEW Skills_required AS
SELECT VacantPositions.job_name,COUNT(DISTINCT PositionSkills.skill_ID) as NUMBER_OF_SKILLS FROM VacantPositions, PositionSkills WHERE PositionSkills.job_ID=VacantPositions.job_ID
GROUP BY VacantPositions.job_ID;


--------------
-- GET VACANT POSITION WITH MOST REQUIRED to least REQUIRED
CREATE VIEW MOST_SKILLS AS
SELECT m.job_name,
        COUNT(*) AS SKILLS_N
   FROM VacantPositions m
   JOIN PositionSkills c ON c.job_ID = m.job_ID
   JOIN SKILL a ON a.skill_id = c.skill_id
GROUP BY m.job_ID
ORDER BY SKILLS_N DESC, m.job_name DESC
-----------------------------
-- select Positon with max/max number of SKILLS
SELECT * FROM most_skills
WHERE SKILLS_N =(SELECT MAX(SKILLS_N) FROM most_skills)

SELECT * FROM most_skills
WHERE SKILLS_N =(SELECT MIN(SKILLS_N) FROM most_skills)

-- AVG SUM of skills requires for postions

SELECT AVG(SKILLS_N) FROM most_skills
SELECT SUM(DISTINCT SKILLS_N) FROM most_skills
-----------------------------
-- Vacant PositionSkills greater than 7

SELECT VacantPositions.job_name as PP,COUNT(DISTINCT PositionSkills.skill_ID) as COUNTED FROM VacantPositions, PositionSkills WHERE PositionSkills.job_ID=VacantPositions.job_ID
GROUP BY VacantPositions.job_ID
Having COUNTED > 7

-----------------------------
-- SELECT EMPLOYEES LOCATED IN NYC OR LA
CREATE VIEW MOST_EMPLOYEES_NYC_LA AS
SELECT EMPLOYEE.emp_fname, EMPLOYEE.emp_lname, Location.location_name
FROM Employee, Location
WHERE Employee.location_ID = Location.location_ID && (Location.location_name = 'NYC' or Location.location_name = 'LA')
ORDER BY location_name DESC;

---------------------------
-- Employees with roles starting with 'Software'
CREATE VIEW SOFTWARE_ROLES AS
SELECT EMPLOYEE.emp_fname, EMPLOYEE.emp_lname, Role.role_name
FROM Employee, Role
WHERE Employee.Role_ID = Role.role_ID
&&  (Role.role_name like 'Software%');

------------------------
-- EMPLOYEES name starting with S or A and both having 7 characters
select * from Employee where emp_fname like'S______' or emp_fname like 'A______';
-- EMPOYEES fname and lname ending in only R
select * from Employee where emp_fname like'%R' or emp_lname like '%R' ORDER BY emp_fname;

-- skills of emp that are java , c# or have SAP in the start
SELECT Employee.emp_fname, Employee.emp_lname, Skill.skill_name
FROM EmployeeSkill
INNER JOIN Employee
ON EmployeeSkill.emp_ID=Employee.emp_ID
INNER JOIN Skill
ON EmployeeSkill.skill_ID=Skill.skill_ID
WHERE Skill.skill_name like 'SAP%' or Skill.skill_name='JAVA' or Skill.skill_name='C#';
ORDER BY Employee.emp_fname ;


-----------
-- select employees with skill java and C# but have only Expert level scale experience

SELECT Employee.emp_fname, Employee.emp_lname, Skill.skill_name, Scale.scale_level
FROM EmployeeSkill
INNER JOIN Employee
ON EmployeeSkill.emp_ID=Employee.emp_ID
INNER JOIN Skill
ON EmployeeSkill.skill_ID=Skill.skill_ID
INNER JOIN Scale
ON EmployeeSkill.scale_ID=Scale.scale_ID
WHERE (Skill.skill_name='JAVA' or Skill.skill_name='C#') && (Scale.scale_level='Expert');
--------
