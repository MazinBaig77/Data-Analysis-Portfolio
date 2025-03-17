-- Joining skills to LinkedIn --

SELECT * FROM skills
SELECT * FROM job_skills

ALTER TABLE linkedin
ADD skill_abr nvarchar(50)

ALTER TABLE linkedin
ADD skill nvarchar(50)

UPDATE l
SET l.skill_abr = js.skill_abr
FROM linkedin l
LEFT JOIN job_skills js ON l.Job_ID = js.job_id

UPDATE l
SET l.skill = s.skill_name
FROM linkedin l
LEFT JOIN skills s ON l.skill_abr =  s.skill_abr

ALTER TABLE linkedin
DROP COLUMN skill_abr

 -- Joining industries to LinkedIn --

SELECT * FROM industries
SELECT * FROM job_industries

ALTER TABLE linkedin
ADD industry_id nvarchar(100)

ALTER TABLE linkedin
ADD industry_name nvarchar(100)

UPDATE l
SET l.industry_id = ji.industry_id
FROM linkedin l
LEFT JOIN job_industries ji ON l.Job_ID = ji.job_id

UPDATE l
SET l.industry_name = i.industry_name
FROM linkedin l
LEFT JOIN industries i ON l.industry_id = i.industry_id

ALTER TABLE linkedin
DROP COLUMN industry_id