INSERT INTO patients (
SELECT 
	patientid,
	to_date(birthdate,'YYYY-MM-DD'),
	to_date(nullif(deathdate,''),'YYYY-MM-DD'),
	REPLACE(ssn, '-', '')::INT,
	nullif(drivers,''),
	nullif(passport,''),
	nullif(prefix,''),
	nullif(firstname,''),
	nullif(middlename,''),
	nullif(lastname,''),
	nullif(suffix,''),
	nullif(maiden,''),
	nullif(martial,''),
	nullif(race,''),
	nullif(ethinicity,''),
	nullif(gender,''),
	nullif(birthplace,''),
	nullif(address,''),
	nullif(city,''),
	nullif(state,''),
	nullif(county,''),
	nullif(zip,'')::INT,
	nullif(lat,'')::FLOAT8,
	nullif(lon,'')::FLOAT8,
	nullif(healthcareexpenses,'')::DECIMAL,
	nullif(healthcarecoverage,'')::DECIMAL,
	nullif(income,'')::DECIMAL
FROM "STAGE_SCHEMA".stg_patients
);

INSERT INTO payers (
	select
	payerid,
	name,
	ownership,
	nullif(address,''),
	nullif(city,''),
	nullif(stateheadquartered,''),
	nullif(zip,'')::INT,
	nullif(phone,'')::INT,
	nullif(amountcovered,'')::DECIMAL,
	nullif(amountuncovered,'')::DECIMAL,
	nullif(revenue,'')::DECIMAL,
	coveredencounters::INT,
	uncoveredencounters::INT,
	coveredmedications::INT,
	uncoveredmedications::INT,
	uniquecustomers::INT,
	qlosavg::DECIMAL,
	membermonths::INT
from "STAGE_SCHEMA".stg_payers
);

INSERT INTO payertransitions(
	select
		patientid,
		memberid,
		startdate::TIMESTAMPTZ,
		enddate::TIMESTAMPTZ,
		payerid,
		nullif(planownership,''),
		nullif(ownername,'')
	from "STAGE_SCHEMA".stg_payertransitions
);

INSERT INTO organizations(
	select 
		organizationID,
		name,
		address,
		city,
		state,
		zip::INT,
		lat::FLOAT8,
		lon::FLOAT8,
		phone,
		revenue::DECIMAL,
		utilization::INT
	from "STAGE_SCHEMA".stg_organizations
);

INSERT INTO providers(
	select
		providerID,
		organizationID,
		name,
		gender,
		speciality,
		address,
		city,
		state,
		zip::INT,
		lat::FLOAT8,
		lon::FLOAT8,
		encounters::INT
	from "STAGE_SCHEMA".stg_providers
);

INSERT INTO encounters(
	select
		encounterID,
		start::TIMESTAMPTZ,
		stop::TIMESTAMPTZ,
		patientID,
		organizationID,
		providerID,
		payerID,
		encounterClass,
		nullif(left(code,9),'')::INT,
		description,
		baseEncounterCost::DECIMAL,
		totalClaimCost::DECIMAL,
		payerCoverage::DECIMAL,
		nullif(left(reasonCode,9),'')::INT,
		reasonDescription
	from "STAGE_SCHEMA".stg_encounters
);

insert into medications(
	select
		start::TIMESTAMPTZ,
		nullif(stop,'')::TIMESTAMPTZ,
		patientID,
		payerID,
		encounterID,
		nullif(left(code,9),'')::INT,
		description,
		baseCost::DECIMAL,
		payerCoverage::DECIMAL,
		dispenses::INT,
		totalCost::DECIMAL,
		nullif(left(reasonCode,9),'')::INT,
		reasonDescription
	from "STAGE_SCHEMA".stg_medications
);