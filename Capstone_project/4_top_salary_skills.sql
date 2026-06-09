/*
rage: Was sind die 25 wichtigsten Fähigkeiten, die mit den höchsten Gehältern verbunden sind? 
Um die 25 besten Fähigkeiten zu finden, die mit den höchsten Gehältern verbunden sind, 
können wir die folgende SQL-Abfrage verwenden. 
Diese Abfrage geht davon aus, dass es zwei Tabellen gibt: job_postings_fact, das Jobinformationen enthält,
 einschließlich Gehalt und skills_job dim", das die für jeden Job erforderlichen Fähigkeiten enthält.
Wir müssen auch der "skills_dim-Tabelle beitreten*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS durchschnittsgehalt
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY    
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;
