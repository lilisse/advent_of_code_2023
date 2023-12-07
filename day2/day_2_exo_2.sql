-- Part Two --

WITH by_color_by_game(color_red, color_green, color_blue ) AS (
    WITH split_double_dot(double_dot) AS (
        SELECT regexp_split_to_array(data, ':') as double_dot FROM day_2
    )
    SELECT
        replace(array_to_string(color_red, ','), ' red', '') AS color_red,
        replace(array_to_string(color_green, ','), ' green', '') AS color_green,
        replace(array_to_string(color_blue, ','), ' blue', '') AS color_blue
    FROM split_double_dot
    CROSS JOIN LATERAL (
        SELECT
            array_agg(red) AS color_red,
            array_agg(green) AS color_green,
            array_agg(blue) AS color_blue
        FROM (
            SELECT
                (regexp_matches(double_dot[2], '[0-9]+ red', 'g'))[1] AS red,
                (regexp_matches(double_dot[2], '[0-9]+ green', 'g'))[1] AS green,
                (regexp_matches(double_dot[2], '[0-9]+ blue', 'g'))[1] AS blue
        ) AS nb_of_each_color
    ) AS f(color_red, color_green, color_blue)
)
SELECT
    SUM(max_red * max_green * max_blue) AS answer
FROM by_color_by_game
CROSS JOIN LATERAL (
    SELECT
        max(CAST(red AS INT)) AS red,
        max(CAST(green AS INT)) AS green,
        max(CAST(blue AS INT)) AS blue
    FROM (
        SELECT
            unnest(string_to_array(color_red, ',')) AS red,
            unnest(string_to_array(color_green, ',')) AS green,
            unnest(string_to_array(color_blue, ',')) AS blue
    ) AS max_array
) AS f(max_red, max_green, max_blue)
