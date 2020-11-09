--liquibase formatted sql

--changeset juliano:1
CREATE TABLE User (
    id varchar(255) NOT NULL DEFAULT random_uuid(),
    username varchar(155) NOT NULL,
    password varchar(100) NOT NULL,
CONSTRAINT pk_tbUser PRIMARY KEY (id)
);

--changeset juliano:2
INSERT INTO User(username, password) VALUES ('hanote', 'atapobls');
INSERT INTO User(username, password) VALUES ('luan', 'atapobls2');
INSERT INTO User(username, password) VALUES ('cris', 'atapobls3');