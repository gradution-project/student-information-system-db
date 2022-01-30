# --------------------------------------------
# Insert SQL for Table UNIV_FACULTY
# --------------------------------------------
INSERT INTO sis.UNIV_FACULTY (FACULTY_ID, NAME, STATUS, CREATED_DATE, CREATED_USER_ID)
VALUES (10, 'TIP FAKÜLTESİ', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_FACULTY (FACULTY_ID, NAME, STATUS, CREATED_DATE, CREATED_USER_ID)
VALUES (11, 'MÜHENDİSLİK MİMARLIK FAKÜLTESİ', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_FACULTY (FACULTY_ID, NAME, STATUS, CREATED_DATE, CREATED_USER_ID)
VALUES (12, 'HUKUK FAKÜLTESİ', 'ACTIVE', '2021-12-15 20:13:45', 1);


# --------------------------------------------
# Insert SQL for Table UNIV_DEPARTMENT
# --------------------------------------------
INSERT INTO sis.UNIV_DEPARTMENT (DEPARTMENT_ID, FACULTY_ID, NAME, STATUS, TOTAL_CLASS_LEVEL, IS_THERE_PREPARATORY_CLASS,
                                 CREATED_DATE, CREATED_USER_ID)
VALUES (11011, 11, 'Elektrik Elektronik Mühendisliği', 'ACTIVE', 4, 0, '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_DEPARTMENT (DEPARTMENT_ID, FACULTY_ID, NAME, STATUS, TOTAL_CLASS_LEVEL, IS_THERE_PREPARATORY_CLASS,
                                 CREATED_DATE, CREATED_USER_ID)
VALUES (11012, 11, 'Bilgisayar Mühendisliği', 'ACTIVE', 4, 0, '2021-12-15 20:13:45', 1);


# --------------------------------------------
# Insert SQL for Table UNIV_LESSON
# --------------------------------------------
INSERT INTO sis.UNIV_LESSON (LESSON_ID, DEPARTMENT_ID, NAME, SEMESTER, CREDIT, COMPULSORY_OR_ELECTIVE, STATUS,
                             CREATED_DATE, CREATED_USER_ID)
VALUES (11012001, 11012, 'Bilgisayar Mühendisliğine Giriş', 1, 2, 'COMPULSORY', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_LESSON (LESSON_ID, DEPARTMENT_ID, NAME, SEMESTER, CREDIT, COMPULSORY_OR_ELECTIVE, STATUS,
                             CREATED_DATE, CREATED_USER_ID)
VALUES (11012002, 11012, 'Fizik I', 1, 3, 'COMPULSORY', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_LESSON (LESSON_ID, DEPARTMENT_ID, NAME, SEMESTER, CREDIT, COMPULSORY_OR_ELECTIVE, STATUS,
                             CREATED_DATE, CREATED_USER_ID)
VALUES (11012003, 11012, 'Matematik I', 1, 4, 'COMPULSORY', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_LESSON (LESSON_ID, DEPARTMENT_ID, NAME, SEMESTER, CREDIT, COMPULSORY_OR_ELECTIVE, STATUS,
                             CREATED_DATE, CREATED_USER_ID)
VALUES (11012004, 11012, 'Fizik II', 2, 3, 'COMPULSORY', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_LESSON (LESSON_ID, DEPARTMENT_ID, NAME, SEMESTER, CREDIT, COMPULSORY_OR_ELECTIVE, STATUS,
                             CREATED_DATE, CREATED_USER_ID)
VALUES (11012005, 11012, 'Matematik II', 2, 4, 'COMPULSORY', 'ACTIVE', '2021-12-15 20:13:45', 1);

INSERT INTO sis.UNIV_LESSON (LESSON_ID, DEPARTMENT_ID, NAME, SEMESTER, CREDIT, COMPULSORY_OR_ELECTIVE, STATUS,
                             CREATED_DATE, CREATED_USER_ID)
VALUES (11012006, 11012, 'Veri Yapıları', 3, 4, 'COMPULSORY', 'ACTIVE', '2021-12-15 20:13:45', 1);
