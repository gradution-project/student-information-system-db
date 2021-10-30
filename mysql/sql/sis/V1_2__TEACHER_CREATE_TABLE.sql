# --------------------------------------------
# DDL for Table TEACHER_PERSONAL
# --------------------------------------------
CREATE TABLE TEACHER_PERSONAL
(
    TEACHER_ID        DECIMAL(10) PRIMARY KEY UNIQUE,
    TC_NO             CHAR(11) UNIQUE,
    NAME              VARCHAR(100),
    SURNAME           VARCHAR(100),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      DECIMAL(10) UNIQUE,
    STATUS            CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D')),
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
# DDL for Table TEACHER_ACADEMIC
# --------------------------------------------
CREATE TABLE TEACHER_ACADEMIC
(
    TEACHER_ID        DECIMAL(10) PRIMARY KEY UNIQUE,
    GROUP_ID          DECIMAL(8) UNIQUE,
    ROLE_ID           DECIMAL(8) UNIQUE,
    DEPARTMENT_ID     DECIMAL(3) UNIQUE,
    FIELD_OF_STUDY    VARCHAR(256),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      DECIMAL(10) UNIQUE,
    STATUS            CHAR(1) NOT NULL CHECK (STATUS IN ('A', 'P', 'D')),
    REGISTRATION_DATE TIMESTAMP,
    CREATED_DATE      TIMESTAMP,
    CREATED_USER      DECIMAL(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER     DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table TEACHER_GROUP
# --------------------------------------------
CREATE TABLE TEACHER_GROUP
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME          VARCHAR(256),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table TEACHER_ROLE
# --------------------------------------------
CREATE TABLE TEACHER_ROLE
(
    ID            BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME          VARCHAR(256),
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table TEACHER_LESSON
# --------------------------------------------
CREATE TABLE TEACHER_LESSON
(
    ID            DECIMAL(5),
    TEACHER_ID    DECIMAL(11) UNIQUE,
    LESSON_ID     DECIMAL(10) UNIQUE,
    CREATED_DATE  TIMESTAMP,
    CREATED_USER  DECIMAL(12),
    MODIFIED_DATE TIMESTAMP,
    MODIFIED_USER DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table TEACHER_PARAMETER
# --------------------------------------------
CREATE TABLE TEACHER_PARAMETER
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
ALTER TABLE TEACHER_PERSONAL
    ADD CONSTRAINT TEACHER_PERSONAL_TEACHER_ID FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER_ACADEMIC (TEACHER_ID);

ALTER TABLE TEACHER_ACADEMIC
    ADD CONSTRAINT TEACHER_ACADEMIC_GROUP_ID FOREIGN KEY (GROUP_ID) REFERENCES TEACHER_GROUP (ID);
ALTER TABLE TEACHER_ACADEMIC
    ADD CONSTRAINT TEACHER_ACADEMIC_ROLE_ID FOREIGN KEY (ROLE_ID) REFERENCES TEACHER_ROLE (ID);
ALTER TABLE TEACHER_ACADEMIC
    ADD CONSTRAINT TEACHER_ACADEMIC_DEPARTMENT_ID FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (ID);

ALTER TABLE TEACHER_LESSON
    ADD CONSTRAINT TEACHER_LESSON_TEACHER_ID FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER_ACADEMIC (TEACHER_ID);
ALTER TABLE TEACHER_LESSON
    ADD CONSTRAINT TEACHER_LESSON_LESSON_ID FOREIGN KEY (LESSON_ID) REFERENCES LESSON (ID);
