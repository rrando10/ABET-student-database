SELECT weight, assessmentDescription FROM Assessments 
WHERE (outcomeId = 2 AND sectionId = 3) 
ORDER BY weight DESC, assessmentDescription ASC;