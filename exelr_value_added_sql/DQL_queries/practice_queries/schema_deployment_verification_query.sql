# Deployment verfication example
SELECT 
    tbl.table_name,
    (SELECT 
            COUNT(*)
        FROM
            information_schema.columns clm
        WHERE
            (clm.table_schema = tbl.table_schema
                AND clm.table_name = tbl.table_name)) num_columns,
    (SELECT 
            COUNT(*)
        FROM
            information_schema.statistics sta
        WHERE
            (sta.table_schema = tbl.table_schema
                AND sta.table_name = tbl.table_name)) num_indexes,
    (SELECT 
            COUNT(*)
        FROM
            information_schema.table_constraints tc
        WHERE
            (tc.table_schema = tbl.table_schema
                AND tc.table_name = tbl.table_name)
                AND tc.constraint_type = 'PRIMARY KEY') num_primary_keys
FROM
    information_schema.tables tbl
WHERE
    table_schema = 'company_db'
        AND tbl.table_type = 'BASE TABLE'
ORDER BY 1;