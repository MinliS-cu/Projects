
    SELECT zipcode, COUNT(*) AS num_complaints
    FROM NYC_complaints
    WHERE created_date BETWEEN '2022-10-01' AND '2023-09-30'
    GROUP BY zipcode
    ORDER BY num_complaints DESC;
