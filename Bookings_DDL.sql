CREATE TABLE facilities (
    facid integer NOT NULL PRIMARY KEY,
    name character varying(100) NOT NULL,
    membercost numeric NOT NULL,
    guestcost numeric NOT NULL,
    initialoutlay numeric NOT NULL,
    monthlymaintenance numeric NOT NULL
);



CREATE TABLE members (
    memid integer NOT NULL PRIMARY KEY,
    surname character varying(200) NOT NULL,
    firstname character varying(200) NOT NULL,
    address character varying(300) NOT NULL,
    zipcode integer NOT NULL,
    telephone character varying(20) NOT NULL,
    recommendedby integer,
    joindate timestamp without time zone NOT NULL,
    FOREIGN KEY (recommendedby) REFERENCES members(memid) ON DELETE SET NULL
);

CREATE TABLE bookings (
    bookid integer NOT NULL PRIMARY KEY,
    facid integer NOT NULL,
    memid integer NOT NULL,
    starttime timestamp without time zone NOT NULL,
    slots integer NOT NULL,
        FOREIGN KEY (facid) REFERENCES facilities(facid),
        FOREIGN KEY (memid) REFERENCES members(memid)
);



CREATE INDEX "bookings.memid_facid"
  ON bookings
  USING btree
  (memid, facid);

CREATE INDEX "bookings.facid_memid"
  ON bookings
  USING btree
  (facid, memid);

CREATE INDEX "bookings.facid_starttime"
  ON bookings
  USING btree
  (facid, starttime);

CREATE INDEX "bookings.memid_starttime"
  ON bookings
  USING btree
  (memid, starttime);

CREATE INDEX "bookings.starttime"
  ON bookings
  USING btree
  (starttime);

CREATE INDEX "members.joindate"
  ON members
  USING btree
  (joindate);

CREATE INDEX "members.recommendedby"
  ON members
  USING btree
  (recommendedby);