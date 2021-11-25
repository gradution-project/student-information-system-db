# --------------------------------------------
# DDL for Table AUTH_STUDENT_LOGIN
# --------------------------------------------
CREATE TABLE AUTH_STUDENT_LOGIN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID      DECIMAL(12) UNIQUE,
    PASSWORD        VARCHAR(512),
    FAIL_COUNTER    DECIMAL(1),
    LAST_LOGIN_DATE TIMESTAMP
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table AUTH_TEACHER_LOGIN
# --------------------------------------------
CREATE TABLE AUTH_TEACHER_LOGIN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    TEACHER_ID      DECIMAL(10) UNIQUE,
    PASSWORD        VARCHAR(512),
    FAIL_COUNTER    DECIMAL(1),
    LAST_LOGIN_DATE TIMESTAMP
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table AUTH_OFFICER_LOGIN
# --------------------------------------------
CREATE TABLE AUTH_OFFICER_LOGIN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    OFFICER_ID      DECIMAL(7) UNIQUE,
    PASSWORD        VARCHAR(512),
    FAIL_COUNTER    DECIMAL(1),
    LAST_LOGIN_DATE TIMESTAMP
) TABLESPACE SIS_TBS;
