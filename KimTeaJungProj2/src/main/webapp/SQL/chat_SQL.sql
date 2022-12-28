
/* Drop Triggers */

DROP TRIGGER TRI_chat_data_chat_no;



/* Drop Tables */

DROP TABLE chat_data CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_chat_data_chat_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_chat_data_chat_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE chat_data
(
	chat_no number NOT NULL,
	chat_room number NOT NULL UNIQUE,
	send_nick nvarchar2(100) NOT NULL,
	receive_nick nvarchar2(100) NOT NULL,
	send_time date NOT NULL,
	read_time date NOT NULL,
	content nvarchar2(2000) NOT NULL,
	read_chk number NOT NULL,
	PRIMARY KEY (chat_no)
);



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_chat_data_chat_no BEFORE INSERT ON chat_data
FOR EACH ROW
BEGIN
	SELECT SEQ_chat_data_chat_no.nextval
	INTO :new.chat_no
	FROM dual;
END;

/




