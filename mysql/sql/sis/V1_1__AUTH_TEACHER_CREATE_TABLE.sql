# --------------------------------------------
# DDL for Table TEACHER_SIGN_IN
# --------------------------------------------
CREATE TABLE AUTH_TEACHER_SIGN_IN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    TEACHER_ID      DECIMAL(10) UNIQUE,
    PASSWORD        VARCHAR(512),
    FAIL_COUNTER    DECIMAL(1),
    LAST_LOGIN_DATE TIMESTAMP
) TABLESPACE SIS_TBS;
