select salary, department_name, job_title
from hr.employees
left join hr.departments ON hr.employees.department_id = hr.departments.department_id
left join hr.jobs ON hr.employees.job_id = hr.jobs.job_id
Where salary is not null