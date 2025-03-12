# Introduction
📊Dive into the data job and check out the top paid jobs💰 in the states, along with the skills you need to handle. You can start your exploration here! 🚀

For the sql code, check this: [project_sql folder](/project_sql/)
# Background
The data is from the Luke guy on Youtube, he made a elaborate sql course💻 and shared these data. 

This link will lead you to the course. [The course](https://youtu.be/7mz73uXD9DA?si=e7Qy6qF9z7U_DYD0)
# Tools I Used
Those tools below are harnessed in this project:
- **sql**
- **postgresql**
- **vs code**
- **github**
# The Analysis
I just wanna try how to quote my code here. Let's do it!
```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    salary_year_avg,
    name as company_name
FROM
    job_postings_fact
left join company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Machine Learning Engineer' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_hour_avg DESC
LIMIT 10
```