/*UNIONS

SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs

UNION ALL

SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs;
*/

/* This Sql gets the skill and skill type for each job posting in q1
  it includes those without any skills too
  look at the skills and skill type for each job in q1 with salary
  above 70000*/

SELECT
    jpf.job_id,
    jpf.job_posted_date, 
    sd.skills,
    sd.type
FROM job_postings_fact jpf
LEFT JOIN skills_job_dim sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim sd
    ON sjd.skill_id = sd.skill_id
WHERE EXTRACT(QUARTER FROM jpf.job_posted_date) = 1
AND jpf.salary_year_avg > 70000
ORDER BY jpf.job_posted_date;