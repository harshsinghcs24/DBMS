CREATE DATABASE IF NOT EXISTS insurance;
USE insurance;

CREATE TABLE PERSON (
    driver_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE CAR (
    reg_num VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

CREATE TABLE ACCIDENT (
    report_num INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(100)
);

CREATE TABLE OWNS (
    driver_id VARCHAR(10),
    reg_num VARCHAR(10),
    PRIMARY KEY (driver_id, reg_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num) ON DELETE CASCADE
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(10),
    reg_num VARCHAR(10),
    report_num INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, reg_num, report_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id) ON DELETE CASCADE,
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num) ON DELETE CASCADE,
    FOREIGN KEY (report_num) REFERENCES ACCIDENT(report_num) ON DELETE CASCADE
);

INSERT INTO PERSON VALUES
('A01', 'Richard', 'Srinivas nagar'),
('A02', 'Pradeep', 'Rajaji nagar'),
('A03', 'Smith', 'Ashok nagar'),
('A04', 'Venu', 'N R Colony'),
('A05', 'Jhon', 'Hanumanth nagar');

INSERT INTO CAR VALUES
('KA052250', 'Indica', 1990),
('KA031181', 'Lancer', 1957),
('KA095477', 'Toyota', 1998),
('KA053408', 'Honda', 2008),
('KA041702', 'Audi', 2005);

INSERT INTO ACCIDENT VALUES
(11, '2003-01-01', 'Mysore Road'),
(12, '2004-02-02', 'South end Circle'),
(13, '2003-01-21', 'Bull temple Road'),
(14, '2008-02-17', 'Mysore Road'),
(15, '2005-03-04', 'Kanakpura Road');

INSERT INTO OWNS VALUES
('A01', 'KA052250'),
('A02', 'KA053408'),
('A03', 'KA031181'),
('A04', 'KA095477'),
('A05', 'KA041702');

INSERT INTO PARTICIPATED VALUES
('A01', 'KA052250', 11, 10000),
('A02', 'KA053408', 12, 50000),
('A03', 'KA095477', 13, 25000),
('A04', 'KA031181', 14, 3000),
('A05', 'KA041702', 15, 5000);


SELECT accident_date, location FROM ACCIDENT;

SELECT * FROM PERSON;	
SELECT * FROM CAR;
SELECT * FROM ACCIDENT;
SELECT * FROM OWNS;
SELECT * FROM PARTICIPATED;

update PARTICIPATED set damage_amount=25000 where reg_num='KA041702' and report_num=12;
select count(distinct driver_id) CNT
from participated p, accident a
where p.report_num=a.report_num and a.accident_date like '%08';

insert into accident values(16,'2008-03-08','Domlur');
select * from accident;