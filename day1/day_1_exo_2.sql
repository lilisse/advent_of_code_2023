SELECT
    data,
    -- index_1_least AS i_1_l,
    -- index_2_least AS i_2_l,
    -- index_3_least AS i_3_l,
    -- index_4_least AS i_4_l,
    -- index_5_least AS i_5_l,
    -- index_6_least AS i_6_l,
    -- index_7_least AS i_7_l,
    -- index_8_least AS i_8_l,
    -- index_9_least AS i_9_l,
    -- index_1_greater AS i_1_g,
    -- index_2_greater AS i_2_g,
    -- index_3_greater AS i_3_g,
    -- index_4_greater AS i_4_g,
    -- index_5_greater AS i_5_g,
    -- index_6_greater AS i_6_g,
    -- index_7_greater AS i_7_g,
    -- index_8_greater AS i_8_g,
    -- index_9_greater AS i_9_g
    substr(
        data,
        LEAST(
            index_1_least[1],
            index_2_least[1],
            index_3_least[1],
            index_4_least[1],
            index_5_least[1],
            index_6_least[1],
            index_7_least[1],
            index_8_least[1],
            index_9_least[1]
        ),
        1
    )
    ||
    substr(
        REVERSE(data),
        LEAST(
            index_1_greater[1],
            index_2_greater[1],
            index_3_greater[1],
            index_4_greater[1],
            index_5_greater[1],
            index_6_greater[1],
            index_7_greater[1],
            index_8_greater[1],
            index_9_greater[1]
        ),
        1
    ) AS answer
FROM (
    SELECT
        -- FIRST
        LEAST(
            CASE    
                WHEN position('1' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('1' in data), 1]
            END,
            CASE    
                WHEN position('one' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('one' in data), 3]
            END
        ) AS index_1_least,
        LEAST(
            CASE    
                WHEN position('2' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('2' in data), 1]
            END,
            CASE    
                WHEN position('two' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('two' in data), 3]
            END
        ) AS index_2_least,
        LEAST(
            CASE    
                WHEN position('3' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('3' in data), 1]
            END,
            CASE    
                WHEN position('three' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('three' in data), 5]
            END
        ) AS index_3_least,
        LEAST(
            CASE    
                WHEN position('4' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('4' in data), 1]
            END,
            CASE    
                WHEN position('four' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('four' in data), 4]
            END
        ) AS index_4_least,
        LEAST(
            CASE    
                WHEN position('5' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('5' in data), 1]
            END,
            CASE    
                WHEN position('five' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('five' in data), 4]
            END
        ) AS index_5_least,
        LEAST(
            CASE    
                WHEN position('6' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('6' in data), 1]
            END,
            CASE    
                WHEN position('six' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('six' in data), 3]
            END
        ) AS index_6_least,
        LEAST(
            CASE    
                WHEN position('7' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('7' in data), 1]
            END,
            CASE    
                WHEN position('seven' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('seven' in data), 5]
            END
        ) AS index_7_least,
        LEAST(
            CASE    
                WHEN position('8' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('8' in data), 1]
            END,
            CASE    
                WHEN position('eight' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('eight' in data), 5]
            END
        ) AS index_8_least,
        LEAST(
            CASE    
                WHEN position('9' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('9' in data), 1]
            END,
            CASE    
                WHEN position('nine' in data) = 0 
                THEN NULL
                ELSE ARRAY[position('nine' in data), 4]
            END
        ) AS index_9_least,
        -- LAST
        LEAST(
            CASE    
                WHEN position('1' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('1' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('eno' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('eno' in REVERSE(data)), 3]
            END
        ) AS index_1_greater,
        LEAST(
            CASE    
                WHEN position('2' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('2' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('owt' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('owt' in REVERSE(data)), 3]
            END
        ) AS index_2_greater,
        LEAST(
            CASE    
                WHEN position('3' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('3' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('eerht' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('eerht' in REVERSE(data)), 5]
            END
        ) AS index_3_greater,
        LEAST(
            CASE    
                WHEN position('4' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('4' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('ruof' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('ruof' in REVERSE(data)), 4]
            END
        ) AS index_4_greater,
        LEAST(
            CASE    
                WHEN position('5' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('5' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('evif' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('evif' in REVERSE(data)), 4]
            END
        ) AS index_5_greater,
        LEAST(
            CASE    
                WHEN position('6' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('6' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('xis' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('xis' in REVERSE(data)), 3]
            END
        ) AS index_6_greater,
        LEAST(
            CASE    
                WHEN position('7' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('7' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('neves' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('neves' in REVERSE(data)), 5]
            END
        ) AS index_7_greater,
        LEAST(
            CASE    
                WHEN position('8' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('8' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('thgie' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('thgie' in REVERSE(data)), 5]
            END
        ) AS index_8_greater,
        LEAST(
            CASE    
                WHEN position('9' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('9' in REVERSE(data)), 1]
            END,
            CASE    
                WHEN position('enin' in REVERSE(data)) = 0 
                THEN NULL
                ELSE ARRAY[position('enin' in REVERSE(data)), 4]
            END
        ) AS index_9_greater,
        -- DATA
        data
    FROM day_1
) AS indexes;