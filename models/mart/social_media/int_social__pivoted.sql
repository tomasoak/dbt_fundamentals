with insta as (
  select * from {{ ref('stg_insta') }}
),

pivoted as (
    select * from insta
)

select * from pivoted