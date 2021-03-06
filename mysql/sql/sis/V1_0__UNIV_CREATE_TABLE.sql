# --------------------------------------------
# DDL for Table UNIV_FACULTY
# --------------------------------------------
CREATE TABLE UNIV_FACULTY
(
    FACULTY_ID       NUMERIC(2) PRIMARY KEY UNIQUE,
    NAME             VARCHAR(256),
    STATUS           ENUM ('ACTIVE', 'PASSIVE', 'DELETED') NOT NULL,
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  NUMERIC(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table UNIV_DEPARTMENT
# --------------------------------------------
CREATE TABLE UNIV_DEPARTMENT
(
    DEPARTMENT_ID              NUMERIC(5) PRIMARY KEY UNIQUE,
    FACULTY_ID                 NUMERIC(2),
    NAME                       VARCHAR(256),
    STATUS                     ENUM ('ACTIVE', 'PASSIVE', 'DELETED') NOT NULL,
    TOTAL_CLASS_LEVEL          NUMERIC(1),
    IS_THERE_PREPARATORY_CLASS BOOLEAN,
    CREATED_DATE               TIMESTAMP,
    CREATED_USER_ID            NUMERIC(12),
    MODIFIED_DATE              TIMESTAMP,
    MODIFIED_USER_ID           NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table UNIV_LESSON
# --------------------------------------------
CREATE TABLE UNIV_LESSON
(
    LESSON_ID              NUMERIC(8) PRIMARY KEY UNIQUE,
    DEPARTMENT_ID          NUMERIC(5),
    NAME                   VARCHAR(256)                               NOT NULL,
    SEMESTER               ENUM ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH', 'SIXTH',
        'SEVENTH', 'EIGHTH', 'NINTH', 'TENTH', 'ELEVENTH', 'TWELFTH') NOT NULL,
    CREDIT                 NUMERIC(2)                                 NOT NULL,
    THEORETICAL_HOURS      NUMERIC(2)                                 NOT NULL,
    PRACTICE_HOURS         NUMERIC(2)                                 NOT NULL,
    COMPULSORY_OR_ELECTIVE ENUM ('COMPULSORY', 'ELECTIVE')            NOT NULL,
    STATUS                 ENUM ('ACTIVE', 'PASSIVE', 'DELETED')      NOT NULL,
    CREATED_DATE           TIMESTAMP,
    CREATED_USER_ID        NUMERIC(12),
    MODIFIED_DATE          TIMESTAMP,
    MODIFIED_USER_ID       NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table UNIV_LESSON_SCHEDULE_FILE
# --------------------------------------------
CREATE TABLE UNIV_LESSON_SCHEDULE_FILE
(
    FILE_ID         VARCHAR(36) PRIMARY KEY UNIQUE,
    FACULTY_ID      NUMERIC(2),
    DEPARTMENT_ID   NUMERIC(5) UNIQUE,
    FILE            LONGBLOB,
    FILE_NAME       VARCHAR(256),
    FILE_TYPE       VARCHAR(256),
    FILE_BYTE       LONGBLOB,
    FILE_SIZE       LONG,
    CREATED_DATE    TIMESTAMP,
    CREATED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table UNIV_EXAM_SCHEDULE_FILE
# --------------------------------------------
CREATE TABLE UNIV_EXAM_SCHEDULE_FILE
(
    FILE_ID         VARCHAR(36) PRIMARY KEY UNIQUE,
    FACULTY_ID      NUMERIC(2),
    DEPARTMENT_ID   NUMERIC(5) UNIQUE,
    FILE            LONGBLOB,
    FILE_NAME       VARCHAR(256),
    FILE_TYPE       VARCHAR(256),
    FILE_BYTE       LONGBLOB,
    FILE_SIZE       LONG,
    CREATED_DATE    TIMESTAMP,
    CREATED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table UNIV_FEATURE_TOGGLE
# --------------------------------------------
CREATE TABLE UNIV_FEATURE_TOGGLE
(
    ID               BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME             ENUM ('FIRST_SEMESTER_LESSON_DATE_RANGE', 'SECOND_SEMESTER_LESSON_DATE_RANGE',
        'FIRST_SEMESTER_LESSON_REGISTRATION_OPERATIONS', 'SECOND_SEMESTER_LESSON_REGISTRATION_OPERATIONS',
        'NOTE_OPERATIONS', 'MIDTERM_NOTE_OPERATIONS', 'FINAL_NOTE_OPERATIONS', 'RESIT_NOTE_OPERATIONS') UNIQUE NOT NULL,
    IS_ENABLED       BOOLEAN,
    START_DATE       TIMESTAMP,
    END_DATE         TIMESTAMP,
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  NUMERIC(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;


# --------------------------------------------
# CONSTRAINTS - FOREIGN KEYS
# --------------------------------------------
ALTER TABLE UNIV_DEPARTMENT
    ADD CONSTRAINT UNIV_DEPARTMENT_FACULTY_ID FOREIGN KEY (FACULTY_ID) REFERENCES UNIV_FACULTY (FACULTY_ID);

ALTER TABLE UNIV_LESSON
    ADD CONSTRAINT UNIV_LESSON_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES UNIV_DEPARTMENT (DEPARTMENT_ID);

ALTER TABLE UNIV_LESSON_SCHEDULE_FILE
    ADD CONSTRAINT UNIV_LESSON_SCHEDULE_FILE_FACULTY_ID FOREIGN KEY (FACULTY_ID) REFERENCES UNIV_FACULTY (FACULTY_ID);
ALTER TABLE UNIV_LESSON_SCHEDULE_FILE
    ADD CONSTRAINT UNIV_LESSON_SCHEDULE_FILE_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES UNIV_DEPARTMENT (DEPARTMENT_ID);

ALTER TABLE UNIV_EXAM_SCHEDULE_FILE
    ADD CONSTRAINT UNIV_EXAM_SCHEDULE_FILE_FACULTY_ID FOREIGN KEY (FACULTY_ID) REFERENCES UNIV_FACULTY (FACULTY_ID);
ALTER TABLE UNIV_EXAM_SCHEDULE_FILE
    ADD CONSTRAINT UNIV_EXAM_SCHEDULE_FILE_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES UNIV_DEPARTMENT (DEPARTMENT_ID);
