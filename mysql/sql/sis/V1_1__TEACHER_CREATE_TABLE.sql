# --------------------------------------------
# DDL for Table TEACHER_PERSONAL_INFO
# --------------------------------------------
CREATE TABLE TEACHER_PERSONAL_INFO
(
    TEACHER_ID        NUMERIC(8) PRIMARY KEY UNIQUE,
    TC_NO             CHAR(11) UNIQUE,
    NAME              VARCHAR(100),
    SURNAME           VARCHAR(100),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      NUMERIC(10) UNIQUE,
    STATUS            ENUM ('ACTIVE', 'PASSIVE', 'DELETED') NOT NULL,
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
# DDL for Table TEACHER_ACADEMIC_INFO
# --------------------------------------------
CREATE TABLE TEACHER_ACADEMIC_INFO
(
    TEACHER_ID        NUMERIC(8) PRIMARY KEY UNIQUE,
    DEGREE            ENUM ('RESEARCH_ASSOCIATE', 'TEACHING_ASSOCIATE', 'ASSISTANT_PROFESSOR', 'PROFESSOR') NOT NULL,
    ROLE              ENUM ('TEACHER', 'ADVISOR', 'HEAD_OF_DEPARTMENT')                                     NOT NULL,
    DEPARTMENT_ID     NUMERIC(5),
    FIELD_OF_STUDY    VARCHAR(256),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      NUMERIC(10) UNIQUE,
    STATUS            ENUM ('ACTIVE', 'PASSIVE', 'DELETED')                                                 NOT NULL,
    REGISTRATION_DATE TIMESTAMP,
    CREATED_DATE      TIMESTAMP,
    CREATED_USER_ID   NUMERIC(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER_ID  NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table TEACHER_LESSON
# --------------------------------------------
CREATE TABLE TEACHER_LESSON
(
    TEACHER_ID      NUMERIC(8),
    LESSON_ID       NUMERIC(8),
    CREATED_DATE    TIMESTAMP,
    CREATED_USER_ID NUMERIC(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table TEACHER_PARAMETER
# --------------------------------------------
CREATE TABLE TEACHER_PARAMETER
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
ALTER TABLE TEACHER_PERSONAL_INFO
    ADD CONSTRAINT TEACHER_PERSONAL_INFO_TEACHER_ID FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER_ACADEMIC_INFO (TEACHER_ID);

ALTER TABLE TEACHER_ACADEMIC_INFO
    ADD CONSTRAINT TEACHER_ACADEMIC_INFO_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES UNIV_DEPARTMENT (DEPARTMENT_ID);

ALTER TABLE TEACHER_LESSON
    ADD CONSTRAINT TEACHER_LESSON_TEACHER_ID FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER_ACADEMIC_INFO (TEACHER_ID);
ALTER TABLE TEACHER_LESSON
    ADD CONSTRAINT TEACHER_LESSON_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES UNIV_LESSON (LESSON_ID);