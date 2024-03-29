-- Part Two --

SELECT
    SUM(
        CAST(
            CASE
                WHEN first_letter IS NULL THEN first_num
                WHEN first_num IS NULL
                    THEN
                        regexp_replace(
                            regexp_replace(
                                regexp_replace(
                                    regexp_replace(
                                        regexp_replace(
                                            regexp_replace(
                                                regexp_replace(
                                                    regexp_replace(
                                                        regexp_replace(
                                                            first_letter,
                                                            'one',
                                                            '1'
                                                        ),
                                                        'two',
                                                        '2'
                                                    ),
                                                    'three',
                                                    '3'
                                                ),
                                                'four',
                                                '4'
                                            ),
                                            'five',
                                            '5'
                                        ),
                                        'six',
                                        '6'
                                    ),
                                    'seven',
                                    '7'
                                ),
                                'eight',
                                '8'
                            ),
                            'nine',
                            '9'
                        )
                WHEN strpos(data, first_letter) < strpos(data, first_num)
                    THEN
                        regexp_replace(
                            regexp_replace(
                                regexp_replace(
                                    regexp_replace(
                                        regexp_replace(
                                            regexp_replace(
                                                regexp_replace(
                                                    regexp_replace(
                                                        regexp_replace(
                                                            first_letter,
                                                            'one',
                                                            '1'
                                                        ),
                                                        'two',
                                                        '2'
                                                    ),
                                                    'three',
                                                    '3'
                                                ),
                                                'four',
                                                '4'
                                            ),
                                            'five',
                                            '5'
                                        ),
                                        'six',
                                        '6'
                                    ),
                                    'seven',
                                    '7'
                                ),
                                'eight',
                                '8'
                            ),
                            'nine',
                            '9'
                        )
                ELSE first_num
            END
            ||
            CASE
                WHEN last_letter IS NULL THEN last_num
                WHEN last_num IS NULL
                    THEN
                        regexp_replace(
                            regexp_replace(
                                regexp_replace(
                                    regexp_replace(
                                        regexp_replace(
                                            regexp_replace(
                                                regexp_replace(
                                                    regexp_replace(
                                                        regexp_replace(
                                                            REVERSE(last_letter),
                                                            'one',
                                                            '1'
                                                        ),
                                                        'two',
                                                        '2'
                                                    ),
                                                    'three',
                                                    '3'
                                                ),
                                                'four',
                                                '4'
                                            ),
                                            'five',
                                            '5'
                                        ),
                                        'six',
                                        '6'
                                    ),
                                    'seven',
                                    '7'
                                ),
                                'eight',
                                '8'
                            ),
                            'nine',
                            '9'
                        )
                WHEN strpos(REVERSE(data), last_letter) < strpos(REVERSE(data), last_num)
                    THEN
                        regexp_replace(
                            regexp_replace(
                                regexp_replace(
                                    regexp_replace(
                                        regexp_replace(
                                            regexp_replace(
                                                regexp_replace(
                                                    regexp_replace(
                                                        regexp_replace(
                                                            REVERSE(last_letter),
                                                            'one',
                                                            '1'
                                                        ),
                                                        'two',
                                                        '2'
                                                    ),
                                                    'three',
                                                    '3'
                                                ),
                                                'four',
                                                '4'
                                            ),
                                            'five',
                                            '5'
                                        ),
                                        'six',
                                        '6'
                                    ),
                                    'seven',
                                    '7'
                                ),
                                'eight',
                                '8'
                            ),
                            'nine',
                            '9'
                        )
                ELSE last_num
            END AS INT
        )
    ) AS answer
FROM (
    SELECT
        substring(data FROM '[0-9]') AS first_num,
        substring(data FROM '(one|two|three|four|five|six|seven|eight|nine)') AS first_letter,
        substring(REVERSE(data) FROM '[0-9]') AS last_num,
        substring(REVERSE(data) FROM '(eno|owt|eerht|ruof|evif|xis|neves|thgie|enin)') AS last_letter,
        data
    FROM day_1
) AS sub_req;
