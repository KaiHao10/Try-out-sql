CREATE TABLE job_applied(
    job_id int,
    application_sent_date date,
    custom_resume boolean,
    resume_file_name varchar(255),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(255),
    status varchar(50)
);
insert into job_applied(
    job_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
values(
    1,
    '2025-03-09',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'
),
(
    2,
    '2025-03-10',
    false,
    'resume.pdf',
    false,
    null,
    'rejected'
),
(
    3,
    '2025-03-11',
    true,
    'resume_02.pdf',
    false,
    null,
    'ghosted'
),
(
    4,
    '2025-03-12',
    true,
    'resume.pdf',
    true,
    'cover_letter_02',
    'accepted'
);

SELECT *
FROM job_applied;

ALTER TABLE job_applied
add contact varchar(50);

UPDATE job_applied
set contact = 'Wenjian Xu'
WHERE job_id = 1;

UPDATE job_applied
set contact = 'Baiwei Wu'
WHERE job_id = 2;

UPDATE job_applied
set contact = 'David Tao'
WHERE job_id = 3;

UPDATE job_applied
set contact = 'Leehom Wang'
WHERE job_id = 4;

ALTER TABLE job_applied
rename column contact to contact_name;

ALTER TABLE job_applied
ALTER column contact_name type text;

DROP column contact_name;

DROP TABLE job_applied;