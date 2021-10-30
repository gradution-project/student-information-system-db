# --------------------------------------------
# DDL for Table TEACHER_SIGN_IN
# --------------------------------------------
CREATE TABLE TEACHER_SIGN_IN
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    TEACHER_ID    DECIMAL(11) UNIQUE,
    PASSWORD      VARCHAR(255),
    FAIL_COUNTER  DECIMAL(12),
    LAST_LOGIN_DATE DATE
) TABLESPACE SIS_TBS;