
    SELECT zipcode, COUNT(*) AS num_trees
    FROM NYC_trees
    GROUP BY zipcode
    ORDER BY num_trees DESC
    LIMIT 10;
