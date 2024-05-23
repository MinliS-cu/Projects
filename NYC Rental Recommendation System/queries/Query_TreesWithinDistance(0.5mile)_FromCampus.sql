
    SELECT
        id,
        species,
        health,
        status,
        ST_AsText(location) AS coordinate
    FROM
        NYC_trees
    WHERE
        ST_DWithin(
            location,
            ST_MakePoint(-73.96253174434912, 40.80737875669467)::geography,
            804.671  -- 0.5 mile in meters
        );

