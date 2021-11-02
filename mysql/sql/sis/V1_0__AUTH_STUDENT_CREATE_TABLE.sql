# --------------------------------------------
# DDL for Table STUDENT_SIGN_IN
# --------------------------------------------
CREATE TABLE AUTH_STUDENT_SIGN_IN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID      DECIMAL(12) UNIQUE,
    PASSWORD        VARCHAR(512),
    FAIL_COUNTER    DECIMAL(1),
    LAST_LOGIN_DATE TIMESTAMP
) TABLESPACE SIS_TBS;
