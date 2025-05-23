-- drop table patients;

CREATE TABLE patients (
	patientID VARCHAR,
	birthDate DATE,
	deathDate DATE,
	SSN INT,
	drivers VARCHAR,
	passport VARCHAR,
	prefix VARCHAR,
	firstName VARCHAR,
	middleName VARCHAR,
	lastName VARCHAR,	
	suffix VARCHAR,
	maiden VARCHAR,
	martial VARCHAR,
	race VARCHAR,
	ethinicity VARCHAR,
	gender VARCHAR,
	birthPlace VARCHAR,
	address VARCHAR,
	city VARCHAR,
	state VARCHAR,
	county VARCHAR,
	fips VARCHAR,
	zip INT,
	lat FLOAT8,
	lon FLOAT8,
	healthcareExpenses DECIMAL,
	healthcareCoverage DECIMAL,
	income DECIMAL,
	PRIMARY KEY(patientID)
);