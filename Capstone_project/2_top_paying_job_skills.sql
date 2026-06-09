/* * Frage: Welche Fähigkeiten sind für die bestbezahlten Data Analyst Jobs erforderlich?
 Verwenden Sie die Top 10 der bestbezahlten Data Analyst Jobs aus der ersten Abfrage 
 Fügen Sie die spezifischen Fähigkeiten hinzu, die für diese Rollen erforderlich sind 
 Diese informationen bieten einen detaillierten Blick darauf, was hochbezahlte Jobs erfordern, 
 um Arbeitssuchenden zu helfen, zu verstehen, welche Fähigkeiten sie entwickeln können, um ihre Chancen 
 auf diese Positionen zu erhöhen. Queries sollten die Fähigkeiten mit den Job-IDs der Top 10 bestbezahlten Data Analyst Jobs verknüpfen,
*/

WITH top_paying_data_analyst_jobs AS (
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
    LIMIT 10

)
SELECT 
    top_paying_data_analyst_jobs.*,
    skills
FROM
    top_paying_data_analyst_jobs
INNER JOIN skills_job_dim
    ON top_paying_data_analyst_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    durchschnitt_jahresgehalt DESC
    ;



/*

Apache Spark appears as the highest-paying skill, associated with 
Bosch research engineering positions paying close to €200k.
GitHub also ranks highly, but this is likely because it appears in the same 
high-paying research roles. Modern data-platform skills such as BigQuery, 
Redshift, Kafka, Terraform, and Looker are concentrated in senior leadership 
positions (Head of Data Analytics), pushing their salary levels above €166k.
Python appears across both senior and mid-level roles, 
which lowers its average salary despite being one of the most demanded skills.
Power BI and Tableau remain valuable skills, especially when combined with leadership, 
cloud, and data architecture responsibilities.
*/

/*
[
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "sql"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "python"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "t-sql"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "azure"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "databricks"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "spark"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "pyspark"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "tableau"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "power bi"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "alteryx"
  },
  {
    "job_id": 389576,
    "titel": "Cloud Data Analyst - Azure Data Lake / Azure Data Factory (w m d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-03 17:42:28",
    "firma": "bridgingIT GmbH",
    "skills": "github"
  },
  {
    "job_id": 442758,
    "titel": "Analyst/Associate - Impact Data and Analysis (m/f/d)",
    "standort": "Frankfurt, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-26 17:09:03",
    "firma": "Global Impact Investing Network",
    "skills": "excel"
  },
  {
    "job_id": 442758,
    "titel": "Analyst/Associate - Impact Data and Analysis (m/f/d)",
    "standort": "Frankfurt, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-02-26 17:09:03",
    "firma": "Global Impact Investing Network",
    "skills": "power bi"
  },
  {
    "job_id": 456613,
    "titel": "Transportation Analyst-#230988",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-06-24 17:16:30",
    "firma": "Deutsche Bahn",
    "skills": "excel"
  },
  {
    "job_id": 456613,
    "titel": "Transportation Analyst-#230988",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-06-24 17:16:30",
    "firma": "Deutsche Bahn",
    "skills": "sap"
  },
  {
    "job_id": 456613,
    "titel": "Transportation Analyst-#230988",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-06-24 17:16:30",
    "firma": "Deutsche Bahn",
    "skills": "flow"
  },
  {
    "job_id": 466228,
    "titel": "IT / Data Analyst (m/w/d) Vollzeit",
    "standort": "Frankfurt, Germany",
    "arbeitszeitmodell": "Full-time and Part-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-11-20 17:17:08",
    "firma": "Union Investment",
    "skills": "sql"
  },
  {
    "job_id": 466228,
    "titel": "IT / Data Analyst (m/w/d) Vollzeit",
    "standort": "Frankfurt, Germany",
    "arbeitszeitmodell": "Full-time and Part-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-11-20 17:17:08",
    "firma": "Union Investment",
    "skills": "python"
  },
  {
    "job_id": 466228,
    "titel": "IT / Data Analyst (m/w/d) Vollzeit",
    "standort": "Frankfurt, Germany",
    "arbeitszeitmodell": "Full-time and Part-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-11-20 17:17:08",
    "firma": "Union Investment",
    "skills": "r"
  },
  {
    "job_id": 469679,
    "titel": "Analyst (m/w/d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-11-20 17:17:18",
    "firma": "IQVIA Argentina",
    "skills": "excel"
  },
  {
    "job_id": 469679,
    "titel": "Analyst (m/w/d)",
    "standort": "Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-11-20 17:17:18",
    "firma": "IQVIA Argentina",
    "skills": "powerpoint"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "sql"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "python"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "databricks"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "bigquery"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "airflow"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "tableau"
  },
  {
    "job_id": 470883,
    "titel": "Digital Marketing Data Analyst - Editorial Content Experience (all...",
    "standort": "Berlin, Germany",
    "arbeitszeitmodell": "Full-time",
    "durchschnitt_jahresgehalt": null,
    "veröffentlichungsdatum": "2023-05-09 17:53:38",
    "firma": "Zalando SE",
    "skills": "github"
  }
]

*/
  