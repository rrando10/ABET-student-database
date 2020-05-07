SELECT DISTINCT O.outcomeId, O.outcomeDescription  
FROM  Outcomes O, OutcomeResults R 
WHERE (O.major='CS' AND R.sectionId=3);