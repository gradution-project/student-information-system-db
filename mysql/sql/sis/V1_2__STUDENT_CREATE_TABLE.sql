# --------------------------------------------
# DDL for Table STUDENT_PERSONAL_INFO
# --------------------------------------------
CREATE TABLE STUDENT_PERSONAL_INFO
(
    STUDENT_ID        DECIMAL(12) PRIMARY KEY UNIQUE,
    TC_NO             DECIMAL(11) UNIQUE,
    NAME              VARCHAR(100),
    SURNAME           VARCHAR(100),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      DECIMAL(10) UNIQUE,
    STATUS            CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D', 'G')),
    PROFILE_PHOTO     LONGBLOB,
    PROFILE_PHOTO_URL VARCHAR(512),
    BIRTHDAY          TIMESTAMP,
    ADDRESS           VARCHAR(256),
    CREATED_DATE      TIMESTAMP,
    CREATED_USER      DECIMAL(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER     DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_ACADEMIC_INFO
# --------------------------------------------
CREATE TABLE STUDENT_ACADEMIC_INFO
(
    STUDENT_ID        DECIMAL(12) PRIMARY KEY UNIQUE,
    DEPARTMENT_ID     DECIMAL(3) UNIQUE,
    DEGREE_ID         DECIMAL(1) UNIQUE,
    CLASS             VARCHAR(20),
    EMAIL             VARCHAR(256) UNIQUE,
    STATUS            CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D', 'G')),
    REGISTRATION_DATE TIMESTAMP,
    CREATED_DATE      TIMESTAMP,
    CREATED_USER      DECIMAL(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER     DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_DEGREE
# --------------------------------------------
CREATE TABLE STUDENT_DEGREE
(
    ID            DECIMAL(1) PRIMARY KEY UNIQUE,
    NAME          VARCHAR(256),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON_REGISTRATION
# --------------------------------------------
CREATE TABLE STUDENT_LESSON_REGISTRATION
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID    DECIMAL(12) UNIQUE,
    LESSON_ID     DECIMAL(5) UNIQUE,
    STATUS        CHAR(1) NOT NULL CHECK (STATUS IN ('W', 'A', 'R')),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  VARCHAR(25),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER VARCHAR(25)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON_NOTE
# --------------------------------------------
CREATE TABLE STUDENT_LESSON_NOTE
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID    DECIMAL(12) UNIQUE,
    LESSON_ID     DECIMAL(5) UNIQUE,
    MIDTERM_NOTE  FLOAT(4),
    FINAL_NOTE    FLOAT(4),
    RESIT_NOTE    FLOAT(4),
    MEAN_OF_NOTE  FLOAT(4),
    NOTE_STATUS   CHAR(1) NOT NULL CHECK (NOTE_STATUS IN ('P', 'F')),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON_ABSENTEEISM
# --------------------------------------------
CREATE TABLE STUDENT_LESSON_ABSENTEEISM
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID    DECIMAL(12) UNIQUE,
    LESSON_ID     DECIMAL(5) UNIQUE,
    THEORY_TIME   DECIMAL(2),
    PRACTICE_TIME DECIMAL(2),
    STATUS        CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D')),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_INTERN_INFO
# --------------------------------------------
CREATE TABLE STUDENT_INTERN_INFO
(
    ID                BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID        DECIMAL(12) UNIQUE,
    COMPANY_NAME      VARCHAR(256),
    INTERN_START_DATE TIMESTAMP,
    INTERN_END_DATE   TIMESTAMP,
    DOCUMENT          LONGBLOB,
    STATUS            CHAR(1) NOT NULL CHECK (STATUS IN ('W', 'A', 'R')),
    CREATED_DATE      TIMESTAMP,
    CREATED_USER      DECIMAL(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER     DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_GRADUATION
# --------------------------------------------
CREATE TABLE STUDENT_GRADUATION
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID    DECIMAL(12) UNIQUE,
    STATUS        CHAR(1) NOT NULL CHECK (STATUS IN ('W', 'A', 'R', 'C')),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_PARAMETER
# --------------------------------------------
CREATE TABLE STUDENT_PARAMETER
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME          VARCHAR(100),
    VALUE         VARCHAR(512),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;


# --------------------------------------------
# CONSTRAINTS - FOREIGN KEYS
# --------------------------------------------
ALTER TABLE STUDENT_PERSONAL_INFO
    ADD CONSTRAINT STUDENT_PERSONAL_INFO_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);

ALTER TABLE STUDENT_ACADEMIC_INFO
    ADD CONSTRAINT STUDENT_ACADEMIC_INFO_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES UNIV_DEPARTMENT (ID);
ALTER TABLE STUDENT_ACADEMIC_INFO
    ADD CONSTRAINT STUDENT_ACADEMIC_INFO_DEGREE_ID FOREIGN KEY (DEGREE_ID) REFERENCES STUDENT_DEGREE (ID);

ALTER TABLE STUDENT_LESSON_REGISTRATION
    ADD CONSTRAINT STUDENT_LESSON_REGISTRATION_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);
ALTER TABLE STUDENT_LESSON_REGISTRATION
    ADD CONSTRAINT STUDENT_LESSON_REGISTRATION_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (ID);

ALTER TABLE STUDENT_LESSON_NOTE
    ADD CONSTRAINT STUDENT_LESSON_NOTE_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);
ALTER TABLE STUDENT_LESSON_NOTE
    ADD CONSTRAINT STUDENT_LESSON_NOTE_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (ID);

ALTER TABLE STUDENT_LESSON_ABSENTEEISM
    ADD CONSTRAINT STUDENT_LESSON_ABSENTEEISM_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);
ALTER TABLE STUDENT_LESSON_ABSENTEEISM
    ADD CONSTRAINT STUDENT_LESSON_ABSENTEEISM_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (ID);

ALTER TABLE STUDENT_INTERN_INFO
    ADD CONSTRAINT STUDENT_INTERN_INFO_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);

ALTER TABLE STUDENT_GRADUATION
    ADD CONSTRAINT STUDENT_GRADUATION_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);