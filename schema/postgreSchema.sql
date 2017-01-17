DROP TABLE IF EXISTS users CASCADE;
CREATE  TABLE users
(   usr_user_id         bigint PRIMARY KEY,
    usr_first_name      varchar,
    usr_last_name       varchar,
    usr_address         varchar,
    usr_state           varchar,
    usr_zip_code        bigint,
    usr_phone           bigint,
    usr_email           varchar
  )
;

DROP TABLE IF EXISTS web_events CASCADE;
CREATE  TABLE web_events
(   wev_timestamp       timestamp,
    wev_event_id        varchar PRIMARY KEY,
    wev_user_id         bigint,
    wev_user_orig_ip    varchar,
    wev_user_browser    varchar,
    wev_num_bytes       bigint,
    wev_http_command    varchar,
    wev_status          varchar,
    wev_referring_url    varchar,
    FOREIGN KEY (wev_user_id) REFERENCES users (usr_user_id)
  )
;

DROP TABLE IF EXISTS PRODUCT CASCADE;

CREATE TABLE PRODUCT(
P_NAME VARCHAR,
P_PRODUCT_ID BIGINT PRIMARY KEY,
P_DESCRIPTION VARCHAR,
P_CATEGORY BIGINT,
P_PRICE BIGINT,
P_MARGINAL_COST BIGINT,
P_MANUFACTURER_ID BIGINT,
P_WEIGHT BIGINT)
;

DROP TABLE IF EXISTS ORDERS CASCADE;

CREATE TABLE ORDERS(
O_ORDER_ID BIGINT,
O_USER_ID BIGINT,
O_TMSTMP TIMESTAMP, 
PRIMARY KEY (O_ORDER_ID, O_USER_ID),
FOREIGN KEY (O_USER_ID) REFERENCES users (usr_user_id)

)
;

DROP TABLE IF EXISTS ORDER_DETAILS CASCADE;

CREATE TABLE ORDER_DETAILS(
OD_ORDER_ID BIGINT,
OD_PRODUCT_ID BIGINT,
OD_QUANTITY BIGINT,
PRIMARY KEY (OD_ORDER_ID, OD_PRODUCT_ID)
-- FOREIGN KEY (OD_ORDER_ID) REFERENCES ORDERS (O_ORDER_ID),
-- FOREIGN KEY (OD_PRODUCT_ID) REFERENCES PRODUCT (P_PRODUCT_ID)

)
;
