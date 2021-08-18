--liquibase formatted sql

--changeset juliano:1
CREATE TABLE tbUser (
    id varchar(255) NOT NULL DEFAULT gen_random_uuid(),
    username varchar(155) NOT NULL,
    password varchar(100) NOT NULL,
CONSTRAINT pk_tbUser PRIMARY KEY (id)
);

--changeset juliano:2
INSERT INTO tbUser(username, password) VALUES ('hanote', 'atapobls');
INSERT INTO tbUser(username, password) VALUES ('luan', 'atapobls2');
INSERT INTO tbUser(username, password) VALUES ('cris', 'atapobls3');