create table medications(
    start TIMESTAMP,
    stop TIMESTAMP,
    patientID VARCHAR,
    payerID VARCHAR,
    encounterID VARCHAR,
    code INT,
    description VARCHAR,
    baseCost DECIMAL,
    payerCoverage DECIMAL,
    dispenses INT,
    totalCost DECIMAL,
    reasonCode INT,
    reasonDescription VARCHAR,
    FOREIGN KEY (patientID) REFERENCES patients(patientID),
    FOREIGN KEY (payerID) REFERENCES payers(payerID),
    FOREIGN KEY (encounterID) REFERENCES encounters(encounterID)
);