/*
This query retrieves job titles, locations, and posted dates from the job_postings_fact table.
and if you want to convert the timezone to EST, you can use the following query:

SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as posted_date

FROM 
    job_postings_fact;
*/

/* 
This query retrieves job titles, locations, and posted dates from the job_postings_fact table.
The job_posted_date is cast to DATE format for easier readability.
casting to date will remove the time component and only show the date when the job was posted.

SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date:: DATE as date
FROM 
    job_postings_fact;
*/

/*
the extract function is used to extract specific parts of a date or timestamp, such as the month or year.
SELECT
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as posted_date,
    EXTRACT(MONTH FROM job_posted_date) as month,
    EXTRACT(YEAR FROM job_posted_date) as year

FROM 
    job_postings_fact;
*/

/*
Research Question: Write a query to find how job postings are trending from month to month and year to year.
*/

SELECT
    COUNT(job_id) as job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) as month

FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;