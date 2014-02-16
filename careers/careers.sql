-- careers.sql for Grad Career Application
-- creates tables in database for careers schema

-- matt weiner

DROP SCHEMA IF EXISTS careerSchema;

CREATE SCHEMA careerSchema;

SET search_path = careerSchema, public;

DROP TABLE IF EXISTS graduates;
CREATE TABLE graduates (
	firstName 	varchar(50),
	lastName	varchar(50),
	degree		varchar(50),
	degreeCode	int
);

INSERT INTO graduates VALUES ('Matthew','Weiner','IT',1);

DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
	companyID int,
	name varchar(50),
	address varchar(50),
	city varchar(50),
	zipcode int,
	PRIMARY KEY (companyID)
);

INSERT INTO companies VALUES (1,'IBM','2810 Lemone Industrial','Columbia', 65201);
--DROP TABLE IF EXISTS company_jobs;
--CREATE TABLE company_jobs (
	
--);

DROP TABLE IF EXISTS jobs;
CREATE TABLE jobs (
	jobID		int,
	jobTitle	varchar(50),
	compnay		varchar(50),
	PRIMARY KEY (jobID)
);

DROP TABLE IF EXISTS admins;
CREATE TABLE admins (
	adminID		int,
	username	varchar(50),
	firstName	varchar(50),
	lastName	varchar(50),
	PRIMARY KEY (adminID)
);