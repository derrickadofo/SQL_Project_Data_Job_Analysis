/*
Frage: Was sind die bestbezahlten Data Analyst-Jobs in Deutschland?
- Identifizieren Sie die Top 10 bestbezahlten Data Analyst-Rollen tr 
- Konzentriert sich auf Stellenausschreibungen mit bestimmten Gehältern 
dadurch werden alle arbeitsuchende in diesem bereich die richtige informationen erhalten.
*/

SELECT 
    job_id,
     job_title AS titel,
     job_location AS standort,
     job_schedule_type AS arbeitszeitmodell,
     Salary_year_avg AS durchschnitt_jahresgehalt,
     job_posted_date AS veröffentlichungsdatum,
     name AS Firma
FROM
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst' 
    AND job_country = 'Germany'
ORDER BY
    Salary_year_avg DESC
    LIMIT 10;


