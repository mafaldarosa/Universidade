CREATE TABLE userA(
	userID SERIAL,
	username varchar(255),
	password varchar(255),
	PRIMARY KEY(userID)
);

CREATE TABLE space(
	spaceID SERIAL,
	spaceName varchar(255),
	PRIMARY KEY(spaceID)
);

CREATE TABLE entries(
	entryID SERIAL,
    entrydate timestamp,
    spaceOcup varchar(255),
    spaceID int,
    userID int,
    uniqueCode varchar(255),
	PRIMARY KEY(entryID),
	FOREIGN KEY(spaceID) REFERENCES space(spaceID) ON DELETE CASCADE,
    FOREIGN KEY(userID) REFERENCES userA(userID) ON DELETE CASCADE
);

CREATE TABLE user_spaces(
    userID int,
    spaceID int,
    FOREIGN KEY(spaceID) REFERENCES userA(userID) ON DELETE CASCADE,
	FOREIGN KEY(spaceID) REFERENCES space(spaceID) ON DELETE CASCADE
);
