create table stg_encounters(
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