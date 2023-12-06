-- Part One --

SELECT
    SUM(
        CAST(
            substr(
                data,
                LEAST(
                    index_1_least,
                    index_2_least,
                    index_3_least,
                    index_4_least,
                    index_5_least,
                    index_6_least,
                    index_7_least,
                    index_8_least,
                    index_9_least
                ),
                1
            )
            ||
            substr(
                REVERSE(data),
                LEAST(
                    index_1_greater,
                    index_2_greater,
                    index_3_greater,
                    index_4_greater,
                    index_5_greater,
                    index_6_greater,
                    index_7_greater,
                    index_8_greater,
                    index_9_greater
                ),
                1
            ) AS INT
        )
    ) AS answer
FROM (
    SELECT
        -- FIRST
        CASE
            WHEN position('1' in data) = 0 THEN NULL
            ELSE position('1' in data)
        END AS index_1_least,
        CASE
            WHEN position('2' in data) = 0 THEN NULL
            ELSE position('2' in data)
        END AS index_2_least,
        CASE
            WHEN position('3' in data) = 0 THEN NULL
            ELSE position('3' in data)
        END AS index_3_least,
        CASE
            WHEN position('4' in data) = 0 THEN NULL
            ELSE position('4' in data)
        END AS index_4_least,
        CASE
            WHEN position('5' in data) = 0 THEN NULL
            ELSE position('5' in data)
        END AS index_5_least,
        CASE
            WHEN position('6' in data) = 0 THEN NULL
            ELSE position('6' in data)
        END AS index_6_least,
        CASE
            WHEN position('7' in data) = 0 THEN NULL
            ELSE position('7' in data)
        END AS index_7_least,
        CASE
            WHEN position('8' in data) = 0 THEN NULL
            ELSE position('8' in data)
        END AS index_8_least,
        CASE
            WHEN position('9' in data) = 0 THEN NULL
            ELSE position('9' in data)
        END AS index_9_least,
        -- LAST
        CASE
            WHEN position('1' in REVERSE(data)) = 0 THEN NULL
            ELSE position('1' in REVERSE(data))
        END AS index_1_greater,
        CASE
            WHEN position('2' in REVERSE(data)) = 0 THEN NULL
            ELSE position('2' in REVERSE(data))
        END AS index_2_greater,
        CASE
            WHEN position('3' in REVERSE(data)) = 0 THEN NULL
            ELSE position('3' in REVERSE(data))
        END AS index_3_greater,
        CASE
            WHEN position('4' in REVERSE(data)) = 0 THEN NULL
            ELSE position('4' in REVERSE(data))
        END AS index_4_greater,
        CASE
            WHEN position('5' in REVERSE(data)) = 0 THEN NULL
            ELSE position('5' in REVERSE(data))
        END AS index_5_greater,
        CASE
            WHEN position('6' in REVERSE(data)) = 0 THEN NULL
            ELSE position('6' in REVERSE(data))
        END AS index_6_greater,
        CASE
            WHEN position('7' in REVERSE(data)) = 0 THEN NULL
            ELSE position('7' in REVERSE(data))
        END AS index_7_greater,
        CASE
            WHEN position('8' in REVERSE(data)) = 0 THEN NULL
            ELSE position('8' in REVERSE(data))
        END AS index_8_greater,
        CASE
            WHEN position('9' in REVERSE(data)) = 0 THEN NULL
            ELSE position('9' in REVERSE(data))
        END AS index_9_greater,
        -- DATA
        data
    FROM day_1
) AS indexes;

-- EASY Soltuion with regex

-- SELECT
--     SUM(
--         CAST(
--             substring(data FROM '[0-9]')
--             ||
--             substring(REVERSE(data) FROM '[0-9]')
--             AS INT
--         )
--     ) AS answer
-- FROM day_1;
