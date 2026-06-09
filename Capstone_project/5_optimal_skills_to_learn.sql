/*Frage: Was sind die optimalen Fähigkeiten, die man erlernen kann (auch bekannt als, dass es sehr gefragt ist und eine hochbezahlte Fähigkeit)?
- Identifizieren Sie Fähigkeiten bei hoher Nachfrage und im Zusammenhang mit hohen Durchschnittswerten für Datenanalystenrollen
- Konzentriert sich auf Remote-Positionen mit bestimmten Gehältern (null ignorieren)
- Warum? Zielt auf Fähigkeiten, die Arbeitsplatzsicherheit (hohe Nachfrage) und finanzielle
Leistungen (hohe Gehälter), die strategische Einblicke in die Karriereentwicklung in der Datenanalyse bieten.
Wir können einen Common Table Expression (CTE) verwenden, um zuerst das Durchschnittsgehalt für jede
Fertigkeit zu berechnen und dann Filter für diejenigen, die sehr gefragt sind. So können Sie die SQL-Abfrage strukturieren:
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),  
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY    
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;
