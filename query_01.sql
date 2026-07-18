
-- Query 1: Salário por Departamento e Cargo
-- Conexões: EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID e EMPLOYEES.JOB_ID = JOBS.JOB_ID

SELECT salary, department_name, job_title
FROM hr.employees
LEFT JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
LEFT JOIN hr.jobs ON hr.employees.job_id = hr.jobs.job_id
WHERE salary IS NOT NULL