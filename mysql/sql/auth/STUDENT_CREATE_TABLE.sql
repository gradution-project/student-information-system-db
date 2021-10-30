# --------------------------------------------
# DDL for Table STUDENT_SIGN_IN
# --------------------------------------------
CREATE TABLE STUDENT_SIGN_IN
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID    DECIMAL(12) UNIQUE,
    PASSWORD      VARCHAR(255),
    FAIL_COUNTER  DECIMAL(12),
    LAST_LOGIN_DATE DATE
) TABLESPACE SIS_TBS;