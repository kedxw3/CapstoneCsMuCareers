-- careers.sql for Grad Career Application
-- creates tables in database for careers schema

-- matt weiner

-- drop tables
DROP TABLE IF EXISTS careerSchema.graduates;
DROP TABLE IF EXISTS careerSchema.companies;
DROP TABLE IF EXISTS careerSchema.company_jobs;
DROP TABLE IF EXISTS careerSchema.jobs;
DROP TABLE IF EXISTS careerSchema.admins;

CREATE SCHEMA careerSchema;

SET search_path = careers, public;

DROP TABLE IF EXISTS graduates;
CREATE TABLE graduates (
	firstName 	varchar(50),
	lastName	varchar(50),
	degree		varchar(50)
);

DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
	compnayID int,
	name varchar(50),
	address varchar(50),
	city varchar(50),
	zipcode int
	PRIMARY KEY (companyID)
);

DROP TABLE IF EXISTS company_jobs;
CREATE TABLE company_jobs (
	
);

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