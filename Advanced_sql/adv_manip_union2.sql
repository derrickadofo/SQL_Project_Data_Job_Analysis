/* Find job postings from the first quarter that have salaries greater than 70k,
-combine job tables from first quarter
get job postings from the first quarter
filter for salaries greater than 70k*/

SELECT 
    first_quarter_jobs.job_title_short,
    first_quarter_jobs.job_via,
    first_quarter_jobs.job_posted_date::DATE,
    first_quarter_jobs.salary_year_avg  
FROM(
    SELECT *
    FROM january_jobs
    UNION ALL

    SELECT *
    FROM february_jobs
    UNION ALL

    SELECT *
    FROM march_jobs
) AS first_quarter_jobs
WHERE 
    first_quarter_jobs.salary_year_avg > 70000
    AND first_quarter_jobs.job_title_short = 'Data Analyst'
ORDER BY first_quarter_jobs.salary_year_avg DESC;
   