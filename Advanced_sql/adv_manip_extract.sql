SELECT job_schedule_type,
        AVG(salary_year_avg) AS avg_salary_year_avg,
        AVG(salary_hour_avg) AS avg_salary_hour_avg

FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type



/*THIS SQL IS TO COUNT THE NUMBER OF JOB POSTINGS FOR EACH MONTH 
IN 2023 ADJUSTING THE JON POSTED DATE TO BE IN AMERICAN NY TIME ZONEBEFORE EXTRACTING THE MONTH. 
ASSUME TZHE JOB POSTED VDATE IS STORFED IN UTC. GROUP BY AND ORDER BY MONTH.*/

SELECT count(job_id) as job_count,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS month

FROM job_postings_fact
WHERE job_posted_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY month
ORDER BY month;

/*This SQL is to find companies that have posted jobs offfering
health insurance. the postings were made in the second quarter of 2023.
use date extraction to filter by quarter.*/

SELECT cd.company_id,
    cd.name AS company_name,
    EXTRACT(MONTH FROM jpf.job_posted_date) AS month
    

FROM company_dim as cd
JOIN job_postings_fact as jpf
ON cd.company_id = jpf.company_id

WHERE jpf.job_health_insurance = 'TRUE'
    AND EXTRACT(QUARTER FROM jpf.job_posted_date) = 2
    ORDER BY month ASC;