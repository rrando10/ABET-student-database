SELECT A.sectionId, I.email, A.outcomeId, A.major, SUM(A.weight) AS weightTotal
FROM Assessments A, Instructors I, Sections S 
WHERE (S.sectionId = A.sectionId AND S.instructorId = I.instructorId) 
GROUP BY A.outcomeId, A.major HAVING weightTotal != 100 
ORDER BY I.email ASC, A.major ASC, A.outcomeId ASC;