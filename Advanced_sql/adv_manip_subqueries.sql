/*
SELECT 
    job_title_short,
    salary_year_avg,
    CASE 
        WHEN salary_year_avg IS NULL THEN 'N/A'
        WHEN salary_year_avg >= 350000 THEN 'High Salary'
        WHEN salary_year_avg >= 200000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;   


/*
SELECT 
    job_title_short,
    MAX(salary_year_avg) AS max_salary,
    MIN(salary_year_avg) AS min_salary,
    AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY job_title_short;
*/