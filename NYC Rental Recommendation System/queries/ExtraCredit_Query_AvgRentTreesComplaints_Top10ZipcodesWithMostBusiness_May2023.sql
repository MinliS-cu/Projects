
    SELECT r.zipcode, TO_CHAR(rent_element, '9,999.99') AS avg_rent, b.num_business, num_trees, num_complaints
    FROM (
        SELECT
            r.zipcode,
            r.rents[100] AS rent_element
        FROM
            NYC_rents r
    ) r
    JOIN (
        SELECT 
            zipcode, COUNT(license_nbr) AS num_business
        FROM 
            NYC_business
        GROUP BY 
            zipcode
        ORDER BY 
            num_business DESC
        LIMIT 
            10
    ) b ON r.zipcode = b.zipcode
    JOIN (
        SELECT 
            zipcode, 
            COUNT(*) AS num_trees
        FROM 
            NYC_trees
        GROUP 
            BY zipcode
    ) t ON r.zipcode = t.zipcode
    JOIN (
        SELECT 
            zipcode, 
            COUNT(*) AS num_complaints
        FROM 
            NYC_complaints
        GROUP 
            BY zipcode
    ) c ON r.zipcode = c.zipcode
    ORDER BY avg_rent DESC;
