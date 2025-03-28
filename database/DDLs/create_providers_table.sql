create table providers(
    providerID VARCHAR,
    organizationID VARCHAR,
    name VARCHAR,
    gender VARCHAR,
    speciality VARCHAR,
    address VARCHAR,
    city VARCHAR,
    state VARCHAR,
    zip INT,
    lat FLOAT8,
    lon FLOAT8,
    encounters INT,
    PRIMARY KEY(providerID),
    FOREIGN KEY (organizationID) REFERENCES organizations(organizationID)
);