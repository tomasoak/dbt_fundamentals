{% macro m_stg_insta(account_data, media_data) -%}

    WITH insta_account AS (
            SELECT
                asset_name,
                CAST(EXTRACT(YEAR from date) as integer) as year,
                SUM(followers_count) as followers_count
            FROM {{ account_data }}
            WHERE asset_name IS NOT NULL
            GROUP BY 1, 2
    ), insta_media AS (
            SELECT
                asset_name,
                CAST(EXTRACT(YEAR from date) as integer) as year,
                SUM(media_like_count) AS media_like_count,
                {{ likes_per_thousands(media_like_count) }} as media_like_per_thousand
            FROM {{ media_data  }}
            WHERE asset_name IS NOT NULL
            GROUP BY 1, 2
        )
    SELECT ROW_NUMBER() OVER() as id, a.asset_name, a.year, a.followers_count, b.media_like_count,
        b.media_like_per_thousand
    FROM insta_account AS a
    JOIN insta_media AS b ON a.asset_name = b.asset_name AND a.year = b.year

{%- endmacro -%}