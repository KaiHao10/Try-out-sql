SELECT
    skills,
    round(avg(salary_year_avg),0) as salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Machine Learning Engineer' AND
    salary_year_avg IS NOT NULL
    -- AND job_work_from_home = True
GROUP BY
    skills
ORDER BY
    salary_avg DESC
LIMIT 25