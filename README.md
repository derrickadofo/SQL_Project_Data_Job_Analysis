# Einführung

Erkunden Sie den Datenarbeitsmarkt! Dieses Projekt konzentriert sich auf Rollen von Datenanalysten und untersucht bestbezahlte Jobs, gefragte Fähigkeiten und wo hohe Nachfrage auf hohe Gehälter in der Datenanalyse trifft. 

SQL-Abfragen zur Analyse finden Sie sie sich hier an: [Capstone_project](/Capstone_project/)

# Hintergrund der Analyse

Das Ziel Dieses Projekt ist um arbeitsuchende zu helfen. Die informationen von heraus wäre eine hilfsmittel auf Der Suche nach einer effektiveren Navigation auf dem Arbeitsmarkt für Datenanalysten. Das ergibnisse die hier ausgegeben werde enthalten sowohl bestbezahlte job_titels als auch die haufigsten gefragte Fähigkeiten zu ermitteln und andere zu rationalisieren, um optimale Jobs zu finden.

Die Daten finden Sie vom [SQL Course](/https://Lukebarousse.com/sql). Es ist vollgepackt mit Einblicken in Berufsbezeichnungen, Gehälter, Standorte und wichtige Fähigkeiten.

 - Die folgende fragen wurde mit SQL abfragen beantwortet;
 1. Was sind die bestbezahlten Jobs als Datenanalytiker? 
 2. Welche Fähigkeiten sind für diese bestbezahlten Jobs erforderlich? 
 3. Welche Fähigkeiten sind bei Datenanalysten am gefragtesten
 4. Welche Fähigkeiten sind mit höheren Gehältern verbunden? 
 5. Was sind die optimalen Fähigkeiten, die man erlernen kann?

# Software
**SQL:** Zur Datenbank abzufragen und kritische Erkenntnisse aufzudecken. 

**PostgreSQL**: Das gewählte Datenbankverwaltungssystem, ideal für den Umgang mit den Stellenausschreibungsdaten. 

**Visual Studio Code:** Mein Einstieg in die Datenbankverwaltung und die Ausführung von SQL-Abfragen. 

**Git & GitHub:** Unverzichtbar für die Versionskontrolle und das Teilen meiner SQL-Skripte und -Analyse, um die Zusammenarbeit und Projektverfolgung zu gewährleisten.

# Analyse

### 1. Was sind die bestbezahlten Jobs als Datenanalytiker? 

```sql
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
```
(later include findings )


### 2. Welche Fähigkeiten sind für diese bestbezahlten Jobs erforderlich? 

```sql

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
```
### 3. Welche Fähigkeiten sind bei Datenanalysten am gefragtesten

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;

```
### 4. Welche Fähigkeiten sind mit höheren Gehältern verbunden? 

```sql 
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS durchschnittsgehalt
FROM job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY    
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25;
```
### 5. Was sind die optimalen Fähigkeiten, die man erlernen kann?

```sql
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
),  
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY    
        skills_job_dim.skill_id
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary
    ON skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;
```
# Zusammenfassung
Ich 