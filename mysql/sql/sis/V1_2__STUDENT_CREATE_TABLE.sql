# --------------------------------------------
# DDL for Table STUDENT_PERSONAL_INFO
# --------------------------------------------
CREATE TABLE STUDENT_PERSONAL_INFO
(
    STUDENT_ID        NUMERIC(12) PRIMARY KEY UNIQUE,
    TC_NO             NUMERIC(11) UNIQUE,
    NAME              VARCHAR(100),
    SURNAME           VARCHAR(100),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      NUMERIC(10) UNIQUE,
    STATUS            ENUM ('ACTIVE', 'PASSIVE', 'DELETED', 'GRADUATED') NOT NULL,
    PROFILE_PHOTO     LONGBLOB,
    PROFILE_PHOTO_URL VARCHAR(512),
    BIRTHDAY          TIMESTAMP,
    ADDRESS           VARCHAR(256),
    CREATED_DATE      TIMESTAMP,
    CREATED_USER_ID   NUMERIC(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER_ID  NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_ACADEMIC_INFO
# --------------------------------------------
CREATE TABLE STUDENT_ACADEMIC_INFO
(
    STUDENT_ID        NUMERIC(12) PRIMARY KEY UNIQUE,
    DEPARTMENT_ID     NUMERIC(5),
    DEGREE            ENUM ('ASSOCIATE', 'UNDERGRADUATE', 'POSTGRADUATE', 'DOCTORAL')                          NOT NULL,
    CLASS_LEVEL       ENUM ('PREPARATORY', 'FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH', 'SIXTH', 'GRADUATE') NOT NULL,
    EMAIL             VARCHAR(256) UNIQUE,
    STATUS            ENUM ('ACTIVE', 'PASSIVE', 'DELETED', 'GRADUATED')                                       NOT NULL,
    REGISTRATION_DATE TIMESTAMP,
    CREATED_DATE      TIMESTAMP,
    CREATED_USER_ID   NUMERIC(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER_ID  NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON
# --------------------------------------------
CREATE TABLE STUDENT_LESSON
(
    STUDENT_ID      NUMERIC(12),
    LESSON_ID       NUMERIC(8),
    CREATED_DATE    TIMESTAMP,
    CREATED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON_REGISTRATION
# --------------------------------------------
CREATE TABLE STUDENT_LESSON_REGISTRATION
(
    REGISTRATION_ID  VARCHAR(36) PRIMARY KEY UNIQUE,
    STUDENT_ID       NUMERIC(12),
    LESSONS_IDS      JSON,
    STATUS           ENUM ('WAITING', 'APPROVED', 'REJECTED') NOT NULL,
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  VARCHAR(25),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID VARCHAR(25)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON_NOTE
# --------------------------------------------
CREATE TABLE STUDENT_LESSON_NOTE
(
    ID                 VARCHAR(36) PRIMARY KEY UNIQUE,
    TEACHER_ID         NUMERIC(8),
    STUDENT_ID         NUMERIC(12),
    LESSON_ID          NUMERIC(8),
    MIDTERM_NOTE       DOUBLE,
    MIDTERM_NOTE_STATE ENUM ('NOT_ENTERED', 'UNCONFIRMED', 'CONFIRMED') NOT NULL,
    FINAL_NOTE         DOUBLE,
    FINAL_NOTE_STATE   ENUM ('NOT_ENTERED', 'UNCONFIRMED', 'CONFIRMED') NOT NULL,
    RESIT_NOTE         DOUBLE,
    RESIT_NOTE_STATE   ENUM ('NOT_ENTERED', 'UNCONFIRMED', 'CONFIRMED') NOT NULL,
    MEAN_OF_NOTE       DOUBLE,
    STATUS             ENUM ('UNFINALISED', 'PASSED', 'FAILED')         NOT NULL,
    CREATED_DATE       TIMESTAMP,
    CREATED_USER_ID    NUMERIC(12),
    MODIFIED_DATE      TIMESTAMP,
    MODIFIED_USER_ID   NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_LESSON_ABSENTEEISM
# --------------------------------------------
CREATE TABLE STUDENT_LESSON_ABSENTEEISM
(
    ID               BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID       NUMERIC(12),
    LESSON_ID        NUMERIC(8),
    THEORY_TIME      NUMERIC(2),
    PRACTICE_TIME    NUMERIC(2),
    STATUS           ENUM ('PASSED', 'FAILED') NOT NULL,
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  NUMERIC(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_INTERN_INFO
# --------------------------------------------
CREATE TABLE STUDENT_INTERN_INFO
(
    ID                BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    STUDENT_ID        NUMERIC(12) UNIQUE,
    COMPANY_NAME      VARCHAR(256),
    INTERN_START_DATE TIMESTAMP,
    INTERN_END_DATE   TIMESTAMP,
    DOCUMENT          LONGBLOB,
    STATUS            ENUM ('WAITING', 'APPROVED', 'REJECTED') NOT NULL,
    CREATED_DATE      TIMESTAMP,
    CREATED_USER_ID   NUMERIC(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER_ID  NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_GRADUATION
# --------------------------------------------
CREATE TABLE STUDENT_GRADUATION
(
    GRADUATION_ID    VARCHAR(36) PRIMARY KEY UNIQUE,
    STUDENT_ID       NUMERIC(12) UNIQUE,
    STATUS           ENUM ('WAITING', 'APPROVED', 'REJECTED', 'CONFIRMED') NOT NULL,
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  NUMERIC(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table STUDENT_PARAMETER
# --------------------------------------------
CREATE TABLE STUDENT_PARAMETER
(
    ID               BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME             VARCHAR(100),
    VALUE            VARCHAR(1024),
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  NUMERIC(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;


# --------------------------------------------
# CONSTRAINTS - FOREIGN KEYS
# --------------------------------------------
ALTER TABLE STUDENT_PERSONAL_INFO
    ADD CONSTRAINT STUDENT_PERSONAL_INFO_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);

ALTER TABLE STUDENT_ACADEMIC_INFO
    ADD CONSTRAINT STUDENT_ACADEMIC_INFO_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES UNIV_DEPARTMENT (DEPARTMENT_ID);

ALTER TABLE STUDENT_LESSON
    ADD CONSTRAINT STUDENT_LESSON_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);
ALTER TABLE STUDENT_LESSON
    ADD CONSTRAINT STUDENT_LESSON_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (LESSON_ID);

ALTER TABLE STUDENT_LESSON_REGISTRATION
    ADD CONSTRAINT STUDENT_LESSON_REGISTRATION_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);

ALTER TABLE STUDENT_LESSON_NOTE
    ADD CONSTRAINT STUDENT_LESSON_NOTE_TEACHER_ID FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER_ACADEMIC_INFO (TEACHER_ID);
ALTER TABLE STUDENT_LESSON_NOTE
    ADD CONSTRAINT STUDENT_LESSON_NOTE_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);
ALTER TABLE STUDENT_LESSON_NOTE
    ADD CONSTRAINT STUDENT_LESSON_NOTE_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (LESSON_ID);

ALTER TABLE STUDENT_LESSON_ABSENTEEISM
    ADD CONSTRAINT STUDENT_LESSON_ABSENTEEISM_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);
ALTER TABLE STUDENT_LESSON_ABSENTEEISM
    ADD CONSTRAINT STUDENT_LESSON_ABSENTEEISM_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (LESSON_ID);

ALTER TABLE STUDENT_INTERN_INFO
    ADD CONSTRAINT STUDENT_INTERN_INFO_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);

ALTER TABLE STUDENT_GRADUATION
    ADD CONSTRAINT STUDENT_GRADUATION_STUDENT_ID FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT_ACADEMIC_INFO (STUDENT_ID);