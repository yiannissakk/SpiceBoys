DROP SCHEMA IF EXISTS SB1 CASCADE;
CREATE SCHEMA SB1;
DROP TABLE IF EXISTS USERS CASCADE;
CREATE  TABLE SB1.USERS
(   USR_USER_ID         bigint ,
    USR_FIRST_NAME      varchar,
    USR_LAST_NAME       varchar,
    USR_ADDRESS         varchar,
    USR_STATE           varchar,
    USR_ZIP_CODE        bigint,
    USR_PHONE           bigint,
    USR_EMAIL           varchar
  )
;
CREATE  TABLE SB1.USERS_CHANGES
(   USR_USER_ID         bigint ,
    USR_FIRST_NAME      varchar,
    USR_LAST_NAME       varchar,
    USR_ADDRESS         varchar,
    USR_STATE           varchar,
    USR_ZIP_CODE        bigint,
    USR_PHONE           bigint,
    USR_EMAIL           varchar,
    USR_TBL_OP	        varchar(30)
  )
;

CREATE LANGUAGE plpgsql;

-- create trigger function, this will write old values of all columns of the row
-- into the changes table for update and delete operation. For insert operation,
-- it will write newly inserted record into the changes table also. For each 
-- insertion into the changes table, it also writes timestamp. 

DROP FUNCTION IF EXISTS  ins_users_changes();

CREATE FUNCTION ins_users_changes() RETURNS trigger AS '
BEGIN
  IF tg_op = ''DELETE'' THEN
     INSERT INTO SB1.USERS_CHANGES(USR_USER_ID, USR_FIRST_NAME, USR_LAST_NAME, USR_ADDRESS, USR_STATE, USR_ZIP_CODE, USR_PHONE, USR_EMAIL, USR_TBL_OP)
     VALUES (old.USR_USER_ID, old.USR_FIRST_NAME, old.USR_LAST_NAME, old.USR_ADDRESS, old.USR_STATE, old.USR_ZIP_CODE, old.USR_PHONE, old.USR_EMAIL, tg_op);
     RETURN old;
  END IF;
  IF tg_op = ''INSERT'' THEN
     INSERT INTO SB1.USERS_CHANGES(USR_USER_ID, USR_FIRST_NAME, USR_LAST_NAME, USR_ADDRESS, USR_STATE, USR_ZIP_CODE, USR_PHONE, USR_EMAIL, USR_TBL_OP)
     VALUES (new.USR_USER_ID, new.USR_FIRST_NAME, new.USR_LAST_NAME, new.USR_ADDRESS, new.USR_STATE, new.USR_ZIP_CODE, new.USR_PHONE, new.USR_EMAIL, tg_op);
     RETURN new;
  END IF;
  IF tg_op = ''UPDATE'' THEN
     INSERT INTO SB1.USERS_CHANGES(USR_USER_ID, USR_FIRST_NAME, USR_LAST_NAME, USR_ADDRESS, USR_STATE, USR_ZIP_CODE, USR_PHONE, USR_EMAIL, USR_TBL_OP)
     VALUES (old.USR_USER_ID, old.USR_FIRST_NAME, old.USR_LAST_NAME, old.USR_ADDRESS, old.USR_STATE, old.USR_ZIP_CODE, old.USR_PHONE, old.USR_EMAIL, tg_op);
     RETURN new;
  END IF;
END
' LANGUAGE plpgsql;


CREATE TRIGGER ins_changes AFTER INSERT OR DELETE OR UPDATE
        ON SB1.USERS FOR each ROW
        EXECUTE PROCEDURE ins_users_changes();
