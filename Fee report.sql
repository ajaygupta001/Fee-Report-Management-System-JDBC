CREATE TABLE ADMIN(
ID NUMBER (11) NOT NULL PRIMARY KEY,
NAME VARCHAR (30) NOT NULL,
EMAIL VARCHAR (50) NOT NULL,
PASSWORD VARCHAR (30) NOT NULL
);
SELECT * FROM ADMIN;

CREATE TABLE Accountant(
ID NUMBER (11) NOT NULL PRIMARY KEY,
NAME VARCHAR (30) NOT NULL,
PASSWORD VARCHAR (30) NOT NULL
EMAIL VARCHAR (50) NOT NULL,
CONTACT VARCHAR (12) NOT NULL
);
SELECT * FROM Accountant;
delete from Accountant where id=102;

CREATE TABLE Student(
ROLL_NO NUMBER (15) NOT NULL PRIMARY KEY,
NAME VARCHAR (30) NOT NULL,
DOB VARCHAR(20) NOT NULL,
ADDRESS VARCHAR(50),
BRANCH VARCHAR(20) NOT NULL,
ACADEMIC_YEAR NUMBER(10)NOT NULL,
GENDER VARCHAR(10),
CONTACT VARCHAR(15)
);
SELECT * FROM STUDENT;
delete from STUDENT;
/*int roll = st.getId();
		String name = st.getName();
		String branch = st.getBranch();
		int year = st.getYear();
		int fees = 40000;
		int paid = st.getPaidfees();
		int due = fees - paid ; 
		long millis = System.currentTimeMillis();
		Date Date_of_receipt = new Date(millis); */
        
CREATE TABLE FEES(
RECEIPT_ID NUMBER(15) NOT NULL PRIMARY KEY,
ROLL_NO NUMBER (15) NOT NULL,
NAME VARCHAR (30) NOT NULL,
BRANCH VARCHAR(20) NOT NULL,
ACADEMIC_YEAR NUMBER(10)NOT NULL,
FEES NUMBER(10)NOT NULL,
PAID NUMBER(10)NOT NULL,
DUE NUMBER(10) NOT NULL,
DATE_OF_RECEIPT DATE
);
alter table FEES
ADD CONSTRAINT fk_fees FOREIGN KEY(ROLL_NO) REFERENCES Student(ROLL_NO);
/* set receipt_id to auto_increment*/
CREATE SEQUENCE seq_fee
minvalue 500
start with 500
increment by 1
cache 1000;

CREATE OR REPLACE TRIGGER fees_trigger 
BEFORE INSERT 
ON FEES 
REFERENCING NEW AS NEW 
FOR EACH ROW 
BEGIN 
SELECT seq_fee.nextval INTO :NEW.RECEIPT_ID FROM dual; 
END;

select * from FEES

















































