-- drop tables if exist 
DROP TABLE IF EXISTS CourseOutcomeMapping;
DROP TABLE IF EXISTS Narratives;
DROP TABLE IF EXISTS Assessments;
DROP TABLE IF EXISTS OutcomeResults;
DROP TABLE IF EXISTS Outcomes;
DROP TABLE IF EXISTS PerformanceLevels;
DROP TABLE IF EXISTS Sections;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Instructors;

-- create new tables
CREATE TABLE Instructors
(
    instructorId CHAR(4) NOT NULL,
    firstname VARCHAR(114) NOT NULL,
    lastname VARCHAR(114) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PASSWORD VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (instructorId)
);

CREATE TABLE Courses
(
    courseId VARCHAR(8) NOT NULL,
    courseTitle VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (courseId)
);

CREATE TABLE Sections
(
    sectionId CHAR(4) NOT NULL,
    courseId VARCHAR(8) NOT NULL,
    instructorId CHAR(4) NOT NULL,
    semester VARCHAR(8) NOT NULL CHECK (semester IN ('spring','fall')),
    year YEAR NOT NULL,

    PRIMARY KEY (sectionId),
    FOREIGN KEY (courseId) REFERENCES Courses(courseId),
    FOREIGN KEY (instructorId) REFERENCES Instructors(instructorId)
);

CREATE TABLE Outcomes
(
    outcomeId CHAR(4) NOT NULL,
    outcomeDescription VARCHAR(255),
    major ENUM ('CS', 'CpE', 'EE'),

    PRIMARY KEY (outcomeId, major)
);

CREATE TABLE PerformanceLevels
(
    performanceLevel ENUM ('1', '2', '3') NOT NULL,
    description VARCHAR(255) NOT NULL CHECK (description 
        IN ('Not Meets Expectations', 'Meets Expectations', 'Exceeds Expectations')),

    PRIMARY KEY (performanceLevel)
);

CREATE TABLE OutcomeResults
(
    sectionId CHAR(4) NOT NULL,
    outcomeId CHAR(4) NOT NULL,
    major ENUM ('CS','CpE','EE') NOT NULL,
    performanceLevel ENUM ('1', '2', '3') NOT NULL,
    numberOfStudents INT NOT NULL,
    
    FOREIGN KEY (sectionId) REFERENCES Sections(sectionId),
    FOREIGN KEY (outcomeId, major) REFERENCES Outcomes(outcomeId, major),
    FOREIGN KEY (performanceLevel) REFERENCES PerformanceLevels(performanceLevel)
);

CREATE TABLE Assessments
(
    assessmentId INT NOT NULL AUTO_INCREMENT,
    sectionId CHAR(4) NOT NULL,
    assessmentDescription VARCHAR(255),
    weight INT NOT NULL,
    outcomeId CHAR(4) NOT NULL,
    major ENUM ('CS','CpE','EE') NOT NULL,

    PRIMARY KEY (assessmentId),
    FOREIGN KEY (sectionId) REFERENCES Sections(sectionId),
    FOREIGN KEY (outcomeId, major) REFERENCES Outcomes(outcomeId, major)
);

CREATE TABLE Narratives
(
    sectionId CHAR(4) NOT NULL,
    major ENUM ('CS','CpE','EE') NOT NULL,
    outcomeId CHAR(4) NOT NULL,
    strengths TEXT,
    weaknesses TEXT,
    actions VARCHAR(255),

    FOREIGN KEY (sectionId) REFERENCES Sections(sectionId),
    FOREIGN KEY (outcomeId, major) REFERENCES Outcomes(outcomeId, major)
);

CREATE TABLE CourseOutcomeMapping
(
    courseId VARCHAR(8) NOT NULL,
    outcomeId CHAR(4) NOT NULL,
    major ENUM ('CS','CpE','EE') NOT NULL,
    semester VARCHAR(8) NOT NULL CHECK (semester IN ('spring','fall')),
    year YEAR NOT NULL,

    FOREIGN KEY (courseId) REFERENCES Courses(courseId),
    FOREIGN KEY (outcomeId, major) REFERENCES Outcomes(outcomeId, major)
);
