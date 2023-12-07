-- Part One --

SELECT
    SUM(CAST(game_id AS INT)) AS answer
FROM (
    SELECT
        substring(double_dot[1] FROM '[0-9]+') AS game_id,
        (SELECT regexp_matches(double_dot[2], '(?:[1-9][0-9]{2,}|[2-9][0-9]|1[3-9]) red')) AS red,
        (SELECT regexp_matches(double_dot[2], '(?:[1-9][0-9]{2,}|[2-9][0-9]|1[4-9]) green')) AS green,
        (SELECT regexp_matches(double_dot[2], '(?:[1-9][0-9]{2,}|[2-9][0-9]|1[5-9]) blue')) AS blue
    FROM (
        SELECT regexp_split_to_array(data, ':') as double_dot FROM day_2
    ) AS split_double_dot
) AS max_colors
WHERE red is NULL
AND green IS NULL
AND blue IS NULL
