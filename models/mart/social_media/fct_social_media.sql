WITH insta AS (
  SELECT *
  FROM {{ ref ('stg_insta') }}
),

facebook AS (
  SELECT * 
  FROM 
  {{ ref ('stg_facebook') }}
)

SELECT a.year, a.asset_name, a.followers_count as insta_followers,
  a.media_like_count as insta_likes, 
  b.sum_likes as fb_likes
FROM insta AS a
JOIN facebook AS b ON a.asset_name = b.asset_name AND a.year = b.year