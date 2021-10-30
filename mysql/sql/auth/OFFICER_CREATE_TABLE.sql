# --------------------------------------------
# DDL for Table OFFICER_SIGN_IN
# --------------------------------------------
CREATE TABLE OFFICER_SIGN_IN
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    OFFICER_ID    DECIMAL(7) UNIQUE,
    PASSWORD      VARCHAR(255),
    FAIL_COUNTER  DECIMAL(12),
    LAST_LOGIN_DATE DATE
) TABLESPACE SIS_TBS;