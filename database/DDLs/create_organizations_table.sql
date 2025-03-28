create table organizations(
    organizationID VARCHAR,
    name VARCHAR,
    address VARCHAR,
    city VARCHAR,
    state VARCHAR,
    zip INT,
    lat FLOAT8,
    lon FLOAT8,
    phone VARCHAR,
    revenue DECIMAL,
    utilization INT,
    PRIMARY KEY(organizationID)
);