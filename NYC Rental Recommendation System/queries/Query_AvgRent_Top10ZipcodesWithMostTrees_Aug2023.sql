
    SELECT r.zipcode, TO_CHAR(rent_element, '9,999.99') AS avg_rent
    FROM (
        SELECT
            r.zipcode,
            r.rents[103] AS rent_element
        FROM
            NYC_rents r

    ) r
    JOIN (
        SELECT zipcode
        FROM NYC_trees
        GROUP BY zipcode
        ORDER BY COUNT(*) DESC
        LIMIT 10
    ) t ON r.zipcode = t.zipcode
    ORDER BY avg_rent DESC;
