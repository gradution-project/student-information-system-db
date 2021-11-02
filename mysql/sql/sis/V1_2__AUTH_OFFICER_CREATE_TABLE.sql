# --------------------------------------------
# DDL for Table OFFICER_SIGN_IN
# --------------------------------------------
CREATE TABLE AUTH_OFFICER_SIGN_IN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    OFFICER_ID      DECIMAL(7) UNIQUE,
    PASSWORD        VARCHAR(512),
    FAIL_COUNTER    DECIMAL(1),
    LAST_LOGIN_DATE TIMESTAMP
) TABLESPACE SIS_TBS;