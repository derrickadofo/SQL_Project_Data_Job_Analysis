/*
Frage: Was sind die gefragtesten Fähigkeiten für Datenanalysten? 
Stellenausschreibungen der inneren Beitrittstabelle ähnlich wie Abfrage 2 beifügen 
Identifizieren Sie die 5 wichtigsten gefragten Fähigkeiten für einen Datenanalysten. 
Konzentrieren Sie sich auf alle Stellenausschreibungen. 
wir Rundern die Top 5 Fähigkeiten mit der höchsten Nachfrage in der arbeitsmarkt für Datenanalysten in Deutschland, um Arbeitssuchenden zu helfen, die gefragtesten Fähigkeiten zu verstehen und sich entsprechend weiterzubilden.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;


/*
hier ist die zusammenfasung der Abfrage:
Diese SQL-Abfrage identifiziert die 5 gefragtesten Fähigkeiten für Datenanalysten in Deutschland. 

[
  {
    "skills": "sql",
    "demand_count": "92628"
  },
  {
    "skills": "excel",
    "demand_count": "67031"
  },
  {
    "skills": "python",
    "demand_count": "57326"
  },
  {
    "skills": "tableau",
    "demand_count": "46554"
  },
  {
    "skills": "power bi",
    "demand_count": "39468"
  }
]
*/