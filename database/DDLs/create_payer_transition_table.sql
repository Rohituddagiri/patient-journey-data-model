create table payerTransitions(
    patientID VARCHAR,
    memberID VARCHAR,
    startDate TIMESTAMP,
    endDate TIMESTAMP,
    payerID VARCHAR,
    planOwnership VARCHAR,
    ownerName VARCHAR,
    FOREIGN KEY (patientID) REFERENCES patients(patientID),
    FOREIGN KEY (payerID) REFERENCES payers(payerID)
);