-- JANUARY
CREATE TABLE january_jobs AS
    SELECT *

    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ;

-- FEBRUARY
CREATE TABLE february_jobs AS
    SELECT *

    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2
    ;

--MARCH
CREATE TABLE march_jobs AS
    SELECT *

    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3
    ;

SELECT *
FROM january_jobs
LIMIT 10;