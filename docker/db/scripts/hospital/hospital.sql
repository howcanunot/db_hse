CREATE TABLE "StationPersonell" (
  "PersNr" integer PRIMARY KEY,
  "Name" varchar,
  "StationNr" integer
);

CREATE TABLE "Caregiver" (
  "Id" integer PRIMARY KEY,
  "Qualification" varchar
);

CREATE TABLE "Doctor" (
  "Id" integer PRIMARY KEY,
  "Area" varchar,
  "Rank" varchar
);

CREATE TABLE "Room" (
  "RoomNr" integer PRIMARY KEY,
  "BedNumber" integer,
  "StationNr" integer
);

CREATE TABLE "Station" (
  "StationNr" integer PRIMARY KEY,
  "Name" varchar
);

CREATE TABLE "Patient" (
  "PatientNr" integer PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar,
  "DoctorId" integer
);

ALTER TABLE "StationPersonell" ADD FOREIGN KEY ("StationNr") REFERENCES "Station" ("StationNr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("Id") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("DoctorId") REFERENCES "Doctor" ("Id");

ALTER TABLE "Room" ADD FOREIGN KEY ("StationNr") REFERENCES "Station" ("StationNr");

ALTER TABLE "Caregiver" ADD FOREIGN KEY ("Id") REFERENCES "StationPersonell" ("PersNr");