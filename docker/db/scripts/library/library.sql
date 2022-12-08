CREATE TABLE "Reader" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "address" varchar,
  "birthday" date
);

CREATE TABLE "Book" (
  "isbn" integer PRIMARY KEY,
  "year" integer,
  "title" varchar,
  "author" varchar,
  "pages," integer,
  "publishing_house_id" integer
);

CREATE TABLE "BookCopy" (
  "id" integer,
  "isbn" integer,
  "pos" integer,
  PRIMARY KEY ("id", "isbn")
);

CREATE TABLE "Publisher" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "address" varchar
);

CREATE TABLE "Category" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "parent_id" integer
);

CREATE TABLE "Borrow" (
  "expiration" timestamp,
  "book_isbn" integer,
  "instance_number" integer,
  "reader_id" integer
);

CREATE TABLE "Category_Book" (
  "category_id" integer,
  "book_isbn" integer,
  PRIMARY KEY ("category_id", "book_isbn")
);

ALTER TABLE "BookCopy" ADD FOREIGN KEY ("isbn") REFERENCES "Book" ("isbn");

ALTER TABLE "Book" ADD FOREIGN KEY ("publishing_house_id") REFERENCES "Publisher" ("id");

ALTER TABLE "Category" ADD FOREIGN KEY ("parent_id") REFERENCES "Category" ("id");

ALTER TABLE "Category_Book" ADD FOREIGN KEY ("category_id") REFERENCES "Category" ("id");

ALTER TABLE "Category_Book" ADD FOREIGN KEY ("book_isbn") REFERENCES "Book" ("isbn");


ALTER TABLE "Borrow" ADD FOREIGN KEY ("reader_id") REFERENCES "Reader" ("id");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("book_isbn", "instance_number") REFERENCES "BookCopy" ("isbn", "id");
