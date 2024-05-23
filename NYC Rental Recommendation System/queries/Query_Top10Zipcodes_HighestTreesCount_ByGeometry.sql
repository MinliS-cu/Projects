
    SELECT
        z.zipcode,
        COUNT(t.id) AS num_trees
    FROM NYC_zipcodes z
    JOIN
        NYC_trees t ON ST_Within(t.location, z.geometry)
    GROUP BY z.zipcode
    ORDER BY num_trees DESC
    LIMIT 10;
