WITH
    SUBJECTS_COUNT_TABLE as (
        SELECT MANAGER_ID, count(*) as SUBJECTS_COUNT
        FROM EMPLOYEES
        WHERE MANAGER_ID is not null
        GROUP BY MANAGER_ID
    ),

    MANAGERS AS (
        SELECT *
        FROM EMPLOYEES E
            join SUBJECTS_COUNT_TABLE S on E.EMPLOYEE_ID = S.MANAGER_ID
    ),

    EUROPEAN_MANAGERS AS (
        SELECT *
        FROM MANAGERS
            join DEPARTMENTS using (DEPARTMENT_ID)
            join LOCATIONS using (LOCATION_ID)
            join COUNTRIES using (COUNTRY_ID)
            join REGIONS using (REGION_ID)
        WHERE REGION_NAME = 'Europe'
    ),

    MAX_SALARY_TABLE AS (
        SELECT max(SALARY) as MAX_SALARY
        FROM EUROPEAN_MANAGERS
        WHERE SUBJECTS_COUNT = (
            SELECT max(SUBJECTS_COUNT) from EUROPEAN_MANAGERS
        )
        GROUP BY SUBJECTS_COUNT
    ),

    AMERICAS_EMPLOYEES AS (
        SELECT *
        FROM EMPLOYEES
            join DEPARTMENTS using (DEPARTMENT_ID)
            join LOCATIONS using (LOCATION_ID)
            join COUNTRIES using (COUNTRY_ID)
            join REGIONS using (REGION_ID)
        WHERE REGION_NAME = 'Americas'
    )

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, MAX_SALARY
FROM AMERICAS_EMPLOYEES, MAX_SALARY_TABLE
WHERE SALARY > MAX_SALARY

