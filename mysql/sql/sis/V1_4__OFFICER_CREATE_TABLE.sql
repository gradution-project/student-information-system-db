# --------------------------------------------
# DDL for Table OFFICER_PERSONAL_INFO
# --------------------------------------------
CREATE TABLE OFFICER_PERSONAL_INFO
(
    OFFICER_ID        DECIMAL(5) PRIMARY KEY UNIQUE,
    TC_NO             DECIMAL(11) UNIQUE,
    NAME              VARCHAR(100),
    SURNAME           VARCHAR(100),
    EMAIL             VARCHAR(256) UNIQUE,
    PHONE_NUMBER      DECIMAL(10) UNIQUE,
    STATUS            ENUM ('ACTIVE', 'PASSIVE', 'DELETED') NOT NULL,
    PROFILE_PHOTO     LONGBLOB,
    PROFILE_PHOTO_URL VARCHAR(512),
    BIRTHDAY          TIMESTAMP,
    REGISTRATION_DATE TIMESTAMP,
    ADDRESS           VARCHAR(256),
    CREATED_DATE      TIMESTAMP,
    CREATED_USER_ID   DECIMAL(12),
    MODIFIED_DATE     TIMESTAMP,
    MODIFIED_USER_ID  DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table OFFICER_ACADEMIC_INFO
# --------------------------------------------
CREATE TABLE OFFICER_ACADEMIC_INFO
(
    OFFICER_ID       DECIMAL(5) PRIMARY KEY UNIQUE,
    FACULTY_ID       DECIMAL(2),
    STATUS           ENUM ('ACTIVE', 'PASSIVE', 'DELETED') NOT NULL,
    EMAIL            VARCHAR(256) UNIQUE,
    PHONE_NUMBER     DECIMAL(10) UNIQUE,
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  DECIMAL(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID DECIMAL(12)
) TABLESPACE SIS_TBS;

# --------------------------------------------
# DDL for Table OFFICER_PARAMETER
# --------------------------------------------
CREATE TABLE OFFICER_PARAMETER
(
    ID               BIGINT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    NAME             VARCHAR(100),
    VALUE            VARCHAR(512),
    CREATED_DATE     TIMESTAMP,
    CREATED_USER_ID  DECIMAL(12),
    MODIFIED_DATE    TIMESTAMP,
    MODIFIED_USER_ID DECIMAL(12)
) TABLESPACE SIS_TBS;


# --------------------------------------------
# CONSTRAINTS - FOREIGN KEYS
# --------------------------------------------
ALTER TABLE OFFICER_PERSONAL_INFO
    ADD CONSTRAINT OFFICER_PERSONAL_INFO_OFFICER_ID FOREIGN KEY (OFFICER_ID) REFERENCES OFFICER_ACADEMIC_INFO (OFFICER_ID);

ALTER TABLE OFFICER_ACADEMIC_INFO
    ADD CONSTRAINT OFFICER_ACADEMIC_INFO_FACULTY_ID FOREIGN KEY (FACULTY_ID) REFERENCES UNIV_FACULTY (ID);
