/* This SQL shows the number of remote postings per skill.
    Focuses on displaying top 5 skill in demand for remote work. 
    include skill_id, name, count of remote postings
    filter for data analytics */


WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS sjd
    INNER JOIN job_postings_fact as jpf
        ON sjd.job_id = jpf.job_id
    WHERE jpf.job_work_from_home = TRUE AND
        jpf.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    skills_dim.skill_id AS skill_id,
    skills_dim.skills AS skill_name,
    rjs.skill_count AS remote_postings_count
FROM remote_job_skills AS rjs
INNER JOIN skills_dim
    ON rjs.skill_id = skills_dim.skill_id
ORDER BY rjs.skill_count DESC
LIMIT 5;
