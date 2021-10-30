# --------------------------------------------
# DDL for Table FACULTY
# --------------------------------------------
CREATE TABLE FACULTY
(
    ID            DECIMAL(4) PRIMARY KEY UNIQUE,
    NAME          VARCHAR(255),
    STATUS        CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D')),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table DEPARTMENT
# --------------------------------------------
CREATE TABLE DEPARTMENT
(
    ID            DECIMAL(3) PRIMARY KEY UNIQUE,
    FACULTY_ID    DECIMAL(4),
    NAME          VARCHAR(255),
    STATUS        CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D')),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table LESSON
# --------------------------------------------
CREATE TABLE LESSON
(
    ID                     DECIMAL(5) PRIMARY KEY UNIQUE,
    DEPARTMENT_ID          DECIMAL(3),
    NAME                   VARCHAR(255),
    CLASS                  DECIMAL(1),
    MIDTERM                DECIMAL(1),
    CREDIT                 DECIMAL(2),
    COMPULSORY_OR_ELECTIVE CHAR(1) NOT NULL CHECK (COMPULSORY_OR_ELECTIVE IN ('C', 'E')),
    STATUS                 CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D')),
    CREATED_DATE           TIMESTAMP,
    CREATED_USER           DECIMAL(12),
    MODIFIED_DATE          TIMESTAMP,
    MODIFIED_USER          DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table LESSON_TIME_PERCENT
# --------------------------------------------
CREATE TABLE LESSON_TIME_PERCENT
(
    ID                    BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    LESSON_ID             DECIMAL(5),
    THEORY_TIME           DECIMAL(2),
    THEORY_TIME_PERCENT   DECIMAL(3),
    PRACTICE_TIME         DECIMAL(2),
    PRACTICE_TIME_PERCENT DECIMAL(3),
    TOTAL_TIME            DECIMAL(2),
    CREATED_DATE          TIMESTAMP,
    CREATED_USER          DECIMAL(12),
    MODIFIED_DATE         TIMESTAMP,
    MODIFIED_USER         DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table LESSON_EXAM_PERCENT
# --------------------------------------------
CREATE TABLE LESSON_EXAM_PERCENT
(
    ID                   BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    LESSON_ID            DECIMAL(5),
    MIDTERM_NOTE_PERCENT DECIMAL(3),
    FINAL_NOTE_PERCENT   DECIMAL(3),
    CREATED_DATE         TIMESTAMP,
    CREATED_USER         DECIMAL(12),
    MODIFIED_DATE        TIMESTAMP,
    MODIFIED_USER        DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table LESSON_SCHEDULE
# --------------------------------------------
CREATE TABLE LESSON_SCHEDULE
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    DEPARTMENT_ID DECIMAL(3),
    DOCUMENT      LONGBLOB,
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table EXAM_SCHEDULE
# --------------------------------------------
CREATE TABLE EXAM_SCHEDULE
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    DEPARTMENT_ID DECIMAL(3),
    DOCUMENT      LONGBLOB,
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;


# --------------------------------------------
# CONSTRAINTS - FOREIGN KEYS
# --------------------------------------------
ALTER TABLE DEPARTMENT
    ADD CONSTRAINT DEPARTMENT_FACULTY_ID FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY (ID);

ALTER TABLE LESSON
    ADD CONSTRAINT LESSON_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (ID);

ALTER TABLE LESSON_TIME_PERCENT
    ADD CONSTRAINT LESSON_TIME_PERCENT_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES LESSON (ID);

ALTER TABLE LESSON_EXAM_PERCENT
    ADD CONSTRAINT LESSON_EXAM_PERCENT_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES LESSON (ID);

ALTER TABLE LESSON_SCHEDULE
    ADD CONSTRAINT LESSON_SCHEDULE_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (ID);

ALTER TABLE EXAM_SCHEDULE
    ADD CONSTRAINT EXAM_SCHEDULE_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (ID);
