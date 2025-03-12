WITH skills_demand as (
SELECT
    skills_dim.skills,
    skills_dim.skill_id,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Machine Learning Engineer' 
    AND salary_year_avg IS NOT NULL
    and job_work_from_home = True
GROUP BY
    skills_dim.skill_id
), average_salary as (
    SELECT
    skills_dim.skills,
    skills_dim.skill_id,
    round(avg(salary_year_avg),0) as salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Machine Learning Engineer' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    salary_avg
FROM
    skills_demand
INNER join average_salary on skills_demand.skill_id = average_salary.skill_id
ORDER BY
    demand_count DESC,
    average_salary DESC
LIMIT 25

-- more concisely --
SELECT
    skills_dim.skills,
    skills_dim.skill_id,
    count(skills_job_dim.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg),0) as salary_avg
FROM
    job_postings_fact
INNER join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Machine Learning Engineer'
    and salary_year_avg IS NOT NULL
    and job_work_from_home = True
GROUP BY
    skills_dim.skill_id
having 
    count(skills_job_dim.job_id) > 10
ORDER BY
    demand_count DESC,
    salary_avg DESC
LIMIT 25