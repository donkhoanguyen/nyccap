CREATE OR REPLACE TABLE `nyccap.nyccap_tobigquery.pudo_warehouse` AS (
  with cte1 AS (
    select 
      trip_id,
      'pickup' as type,
      tpep_pickup_datetime as datetime,
      pickup_latitude as latitude,
      pickup_longitude as longtitude
    from `nyccap.nyccap_tobigquery.tbl_analytics` 
  ),

  cte2 AS (
    select
      trip_id,
      'dropoff' as type,
      tpep_dropoff_datetime as datetime,
      dropoff_latitude as latitude,
      dropoff_longitude as longtitude
    from `nyccap.nyccap_tobigquery.tbl_analytics` 
  )

  SELECT trip_id, type, datetime, latitude, longtitude FROM cte1
  UNION ALL
  SELECT trip_id, type, datetime, latitude, longtitude FROM cte2
)
;
