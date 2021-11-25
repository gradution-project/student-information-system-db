# --------------------------------------------
# DDL for Table AUTH_STUDENT_LOGIN
# --------------------------------------------
CREATE TABLE AUTH_STUDENT_LOGIN
(
    ID              BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID      NUMERIC(12) UNIQUE,
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


# --------------------------------------------
# CONSTRAINTS - FOREIGN KEYS
# --------------------------------------------
ALTER TABLE AUTH_STUDENT_LOGIN
    ADD CONSTRAINT AUTH_STUDENT_LOGIN_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);

ALTER TABLE AUTH_TEACHER_LOGIN
    ADD CONSTRAINT AUTH_TEACHER_LOGIN_STUDENT_ID FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER_ACADEMIC_INFO (TEACHER_ID);

ALTER TABLE AUTH_OFFICER_LOGIN
    ADD CONSTRAINT AUTH_OFFICER_LOGIN_STUDENT_ID FOREIGN KEY (OFFICER_ID) REFERENCES OFFICER_ACADEMIC_INFO (OFFICER_ID);
