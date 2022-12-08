CREATE TABLE "City" (
  "Name" varchar,
  "Region" varchar,
  PRIMARY KEY ("Name", "Region")
);

CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "TracksNr" integer
);


CREATE TABLE "Train" (
  "TrainNr" integer PRIMARY KEY,
  "Length" integer,
  "StartStationName" varchar,
  "EndStationName" varchar
);

CREATE TABLE "Connection" (
  "From" varchar,
  "To" varchar
);

CREATE TABLE "StationSchedule" (
  "StationName" varchar,
  "TrainNr" integer,
  "Arrival" timestamp,
  "Departure" timestamp
);

ALTER TABLE "Connection" ADD FOREIGN KEY ("From") REFERENCES "Station" ("Name");

ALTER TABLE "Connection" ADD FOREIGN KEY ("To") REFERENCES "Station" ("Name");

ALTER TABLE "StationSchedule" ADD FOREIGN KEY ("TrainNr") REFERENCES "Train" ("TrainNr");

ALTER TABLE "Train" ADD FOREIGN KEY ("StartStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("EndStationName") REFERENCES "Station" ("Name");

ALTER TABLE "StationSchedule" ADD FOREIGN KEY ("StationName") REFERENCES "Station" ("Name");