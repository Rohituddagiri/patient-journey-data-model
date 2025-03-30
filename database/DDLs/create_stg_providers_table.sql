create table stg_providers(
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