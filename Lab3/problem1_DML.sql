/* Employee Insertions */
SET
    FOREIGN_KEY_CHECKS = 0;

INSERT INTO
    `employee`(
        `ssn`,
        `fname`,
        `lname`,
        `bdate`,
        `address`,
        `gender`,
        `salary`,
        `Don`
    )
VALUES
    (
        '6773',
        'Seif ELdin',
        'Mahmoud',
        '2000-15-12',
        'ABC street',
        'Male',
        '7000',
        '1'
    );

INSERT INTO
    `employee`(
        `ssn`,
        `fname`,
        `lname`,
        `bdate`,
        `address`,
        `gender`,
        `salary`,
        `Don`
    )
VALUES
    (
        '673',
        'Yamen',
        'Mahmoud',
        '2000-15-12',
        'ABC street',
        'Male',
        '7000',
        '2'
    );

INSERT INTO
    `employee`(
        `ssn`,
        `fname`,
        `lname`,
        `bdate`,
        `address`,
        `gender`,
        `salary`,
        `Don`
    )
VALUES
    (
        '67',
        'Karma',
        'Mahmoud',
        '2000-15-12',
        'ABC street',
        'Female',
        '7000',
        '2'
    );

SET
    FOREIGN_KEY_CHECKS = 1;

/* Department Insertions */
INSERT INTO
    `department` (`Dnumber`, `Dname`, `mgr_ssn`, `mgr_start_date`)
VALUES
    ('1', 'Acconting', '6773', '2022-11-02');

INSERT INTO
    `department` (`Dnumber`, `Dname`, `mgr_ssn`, `mgr_start_date`)
VALUES
    ('2', 'Exports', '67', '2021-11-02');

INSERT INTO
    `department` (`Dnumber`, `Dname`, `mgr_ssn`, `mgr_start_date`)
VALUES
    ('3', 'Imports', '67', '2021-11-02');

/* Project Insertions */
INSERT INTO
    `project`(`Pnumber`, `Pname`, `Plocation`, `Dno`)
VALUES
    ('1', 'Construction', 'Alexandria', '1');

INSERT INTO
    `project`(`Pnumber`, `Pname`, `Plocation`, `Dno`)
VALUES
    ('2', 'Army', 'Alexandria', '2');

INSERT INTO
    `project`(`Pnumber`, `Pname`, `Plocation`, `Dno`)
VALUES
    ('3', 'Construction 2', 'Alexandria', '2');