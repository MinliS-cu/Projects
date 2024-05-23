
    SELECT 
        r.zipcode, 
        TO_CHAR(rent_element, '9,999.99') AS avg_rent,
        t.num_trees, 
        c.num_complaints 
    FROM(
        (
            SELECT
                zipcode,
                rents[96] AS rent_element
            FROM NYC_rents r
            WHERE NOT (rents[96] = 'NaN')
            ORDER BY rents[96] 
            LIMIT 5
        ) 
        UNION ALL 
        ( 
            SELECT 
                zipcode,
                rents[96] AS rent_element
            FROM NYC_rents r
            WHERE NOT (rents[96] = 'NaN')
            ORDER BY rents[96] DESC
            LIMIT 5
        )
    )AS r
    JOIN (
        SELECT 
            zipcode, 
            COUNT(*) AS num_trees
        FROM NYC_trees
        GROUP BY zipcode
    ) t ON r.zipcode = t.zipcode
    JOIN (
        SELECT 
            zipcode, 
            COUNT(*) AS num_complaints
        FROM NYC_complaints
        GROUP BY zipcode
    ) c ON r.zipcode = c.zipcode
    ORDER BY avg_rent DESC;
