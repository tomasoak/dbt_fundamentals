WITH facebook AS (
  SELECT 
    asset_name,
    CAST(EXTRACT(YEAR from date) as integer) as year,  
    SUM(likes) as sum_likes
  FROM {{ source('facebook_insights', 'FBPAGE_POST_REP_TABLE' )}}
  WHERE asset_name IS NOT NULL AND date IS NOT NULL
  GROUP BY 1, 2
  ORDER BY 1
)
SELECT * FROM facebook