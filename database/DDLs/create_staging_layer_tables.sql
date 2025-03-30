CREATE TABLE "STAGE_SCHEMA".stg_patients (
	patientID VARCHAR,
	birthDate VARCHAR,
	deathDate VARCHAR,
	SSN VARCHAR,
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
	zip VARCHAR,
	lat VARCHAR,
	lon VARCHAR,
	healthcareExpenses VARCHAR,
	healthcareCoverage VARCHAR,
	income VARCHAR,
	PRIMARY KEY(patientID)
);


create table "STAGE_SCHEMA".stg_payerTransitions(
    patientID VARCHAR,
    memberID VARCHAR,
    startDate VARCHAR,
    endDate VARCHAR,
    payerID VARCHAR,
    secondarypayer VARCHAR,
    planOwnership VARCHAR,
    ownerName VARCHAR
);

create table "STAGE_SCHEMA".stg_payers(
	payerID VARCHAR,
	name VARCHAR,
	ownership VARCHAR,
	address VARCHAR,
	city VARCHAR,
	stateHeadquartered VARCHAR,
	zip VARCHAR,
	phone VARCHAR,
	amountCovered VARCHAR,
	amountUnCovered VARCHAR,
	revenue VARCHAR,
	coveredEncounters VARCHAR,
	uncoveredEncounters VARCHAR,
	coveredMedications VARCHAR,
	uncoveredMedications VARCHAR,
	coveredprocedures VARCHAR,
	uncoveredprocedures VARCHAR,
    coveredimmunizations VARCHAR,
	uncoveredimmunizations VARCHAR,
	uniqueCustomers VARCHAR,
	qlosAvg VARCHAR,
	memberMonths VARCHAR,
	PRIMARY KEY(payerID)
);


create table "STAGE_SCHEMA".stg_providers(
    providerID VARCHAR,
    organizationID VARCHAR,
    name VARCHAR,
    gender VARCHAR,
    speciality VARCHAR,
    address VARCHAR,
    city VARCHAR,
    state VARCHAR,
    zip VARCHAR,
    lat VARCHAR,
    lon VARCHAR,
    encounters VARCHAR,
    procedures VARCHAR,
    PRIMARY KEY(providerID)
);


create table "STAGE_SCHEMA".stg_organizations(
    organizationID VARCHAR,
    name VARCHAR,
    address VARCHAR,
    city VARCHAR,
    state VARCHAR,
    zip VARCHAR,
    lat VARCHAR,
    lon VARCHAR,
    phone VARCHAR,
    revenue VARCHAR,
    utilization VARCHAR,
    PRIMARY KEY(organizationID)
);


create table "STAGE_SCHEMA".stg_medications(
    start VARCHAR,
    stop VARCHAR,
    patientID VARCHAR,
    payerID VARCHAR,
    encounterID VARCHAR,
    code VARCHAR,
    description VARCHAR,
    baseCost VARCHAR,
    payerCoverage VARCHAR,
    dispenses VARCHAR,
    totalCost VARCHAR,
    reasonCode VARCHAR,
    reasonDescription VARCHAR
);


create table "STAGE_SCHEMA".stg_encounters(
    encounterID VARCHAR,
    start VARCHAR,
    stop VARCHAR,
    patientID VARCHAR,
    organizationID VARCHAR,
    providerID VARCHAR,
    payerID VARCHAR,
    encounterClass VARCHAR,
    code VARCHAR,
    description VARCHAR,
    baseEncounterCost VARCHAR,
    totalClaimCost VARCHAR,
    payerCoverage VARCHAR,
    reasonCode VARCHAR,
    reasonDescription VARCHAR,
    PRIMARY KEY(encounterID)
);