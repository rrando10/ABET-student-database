SELECT DISTINCT P.description, R.numberOfStudents
FROM PerformanceLevels P, OutcomeResults R
WHERE (P.performanceLevel=R.performanceLevel)
AND (R.outcomeId=2) AND (R.sectionId=3)
ORDER BY P.performanceLevel;