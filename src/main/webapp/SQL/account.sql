use webprojectDB;

CREATE TABLE IF NOT EXISTS account(
    id VARCHAR(10) NOT NULL,
    password VARCHAR(10) NOT NULL,
    email VARCHAR(255),
    nick VARCHAR(50),
    age INT,
    PRIMARY KEY (id)
    );

INSERT INTO account(id, password) VALUES('admin','0000');

select * from account;



