SELECT DISTINCT S.instructorId, S.sectionId, S.courseId,C.major, S.semester, S.year
FROM Sections S, CourseOutcomeMapping C, Instructors I
WHERE (C.courseId=S.courseId) AND (S.instructorId=I.instructorId)
AND ((I.password = password('password')) AND (I.email='coyote@utk.edu'))
ORDER BY S.year DESC, S.semester ASC;
