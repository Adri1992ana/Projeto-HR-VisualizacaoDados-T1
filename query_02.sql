-- Voltando para a Query 2 — pensando no diagrama do schema HR: qual é a sequência de conexão entre 
DEPARTMENTS → LOCATIONS → COUNTRIES → REGIONS? Qual coluna liga cada uma com a próxima?

- DEPARTMENTS → LOCATIONS: `LOCATION_ID`
- LOCATIONS → COUNTRIES: `COUNTRY_ID`
- COUNTRIES → REGIONS: `REGION_ID`



-- Query 2: Funcionários por Região (com localização)
-- Conexões: EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
--           DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
--           LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID
--           COUNTRIES.REGION_ID = REGIONS.REGION_ID

SELECT first_name, region_name, city, country_name
FROM hr.employees
LEFT JOIN hr.departments ON hr.employees.department_id = hr.departments.department_id
LEFT JOIN hr.locations ON hr.departments.location_id = hr.locations.location_id
LEFT JOIN hr.countries ON hr.locations.country_id = hr.countries.country_id
LEFT JOIN hr.regions ON hr.countries.region_id = hr.regions.region_id
WHERE region_name IS NOT NULL

