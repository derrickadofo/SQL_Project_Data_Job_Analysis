/* This sql identifies the top 5 most frequently mentioned skills in job postings. 
we will use a subquery to find the skill id with the highest counts in the skill id dim table 
and then join the results with the skills dim table for the corresponding names

SELECT 
    skills AS skill_name,
    skill_id
FROM skills_dim
WHERE skill_id IN (
    SELECT
        skill_id
    FROM 
        skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(skill_id) DESC
    LIMIT 5
);

*/

/*This sql determines size category for each company based on the number
of job postings. we will use a subquery to calculate the number of 
job postings for each company and then use a CASE statement to categorize 
them into small, medium, or large.


SELECT 
    company_id,
    COUNT(job_id),
    CASE
        WHEN count(job_id) > 50 THEN 'large'
        WHEN count(job_id) BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Small'
    END AS company_size_category
FROM 
    job_postings_fact
GROUP BY company_id
ORDER BY count(job_id) DESC;
*/

SELECT 
    company_id,
    COUNT(job_id) AS job_posting_count,
    CASE
        WHEN COUNT(job_id) > 50 THEN 'Large'
        WHEN COUNT(job_id) BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Small'
    END AS company_size_category
FROM 
    job_postings_fact
GROUP BY company_id
ORDER BY job_posting_count DESC;    