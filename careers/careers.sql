-- careers.sql for Grad Career Application
-- creates tables in database for careerSchema

-- team x

DROP SCHEMA IF EXISTS careerSchema;
CREATE SCHEMA careerSchema;


SET search_path = careerSchema, public;


DROP TABLE IF EXISTS careerSchema.graduates;
CREATE TABLE careerSchema.graduates (
	username	varchar(50) PRIMARY KEY,
	firstName 	varchar(50),
	lastName	varchar(50),
	degree		varchar(50),
	degreeCode	int,
	linkedIn	varchar(50)
);


INSERT INTO careerSchema.graduates VALUES ('Matthew','Weiner','IT',1);


-- Table: careerSchema.graduateAuthentication
-- Columns:
--    username      - The username tied to the authentication info.
--    password_hash - The hash of the user's password + salt. Expected to be SHA1.
--    salt          - The salt to use. Expected to be a SHA1 hash of a random input.
DROP TABLE IF EXISTS careerSchema.graduateAuthentication
CREATE TABLE careerSchema.graduateAuthentication (
	username 		VARCHAR(30) PRIMARY KEY,
	password_hash 	CHAR(40) NOT NULL,
	salt 			CHAR(40) NOT NULL,
	FOREIGN KEY (username) REFERENCES careerSchema.graduates(username)
);


DROP TABLE IF EXISTS careerSchema.companies;
CREATE TABLE careerSchema.companies (
	companyID 	int,
	name 		varchar(50),
	address 	varchar(50),
	city 		varchar(50),
	zipcode 	int,
	PRIMARY KEY (companyID)
);


INSERT INTO careerSchema.companies VALUES (1,'IBM','2810 Lemone Industrial','Columbia', 65201);


--DROP TABLE IF EXISTS careerSchema.company_jobs;
--CREATE TABLE careerSchema.company_jobs (
	
--);

DROP TABLE IF EXISTS careerSchema.jobs;
CREATE TABLE careerSchema.jobs (
	jobID		int,
	jobTitle	varchar(50),
	compnay		varchar(50),
	PRIMARY KEY (jobID)
);

DROP TABLE IF EXISTS careerSchema.admin_info;
CREATE TABLE careerSchema.admin_info (
	username			varchar(50) PRIMARY KEY,
	firstName			varchar(50),
	lastName			varchar(50),
	registration_date 	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	description			varchar(50),
	PRIMARY KEY (username)
);

-- Table: careerSchema.adminAuthentication
-- Columns:
--    username      - The username tied to the authentication info.
--    password_hash - The hash of the user's password + salt. Expected to be SHA1.
--    salt          - The salt to use. Expected to be a SHA1 hash of a random input.
CREATE TABLE careerSchema.adminAuthentication (
	username 		VARCHAR(30) PRIMARY KEY,
	password_hash 	CHAR(40) NOT NULL,
	salt 			CHAR(40) NOT NULL,
	FOREIGN KEY (username) REFERENCES careerSchema.admin_info(username)
);

-- Table: careerSchema.log
-- Columns:
--    log_id     - A unique ID for the log entry. Set by a sequence.
--    username   - The user whose action generated this log entry.
--    ip_address - The IP address of the user at the time the log was entered.
--    log_date   - The date of the log entry. Set automatically by a default value.
--    action     - What the user did to generate a log entry (i.e., "logged in").
CREATE TABLE careerSchema.log (
	log_id  	SERIAL PRIMARY KEY,
	username 	VARCHAR(30) NOT NULL REFERENCES lab8.user_info,
	ip_address 	VARCHAR(15) NOT NULL,
	log_date 	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	action 		VARCHAR(50) NOT NULL
);

CREATE INDEX log_log_id_index ON careerSchema.log (username);