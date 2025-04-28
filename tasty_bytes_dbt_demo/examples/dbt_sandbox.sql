SHOW TABLES IN DATABASE tasty_bytes_dbt_db;
SHOW VIEWS IN DATABASE tasty_bytes_dbt_db;

SHOW DBT PROJECTS LIKE 'tasty%';


execute dbt project tasty_bytes_dbt_db.dev.tasty_bytes_dbt_dev args='run --select customer_loyalty_metrics';


CREATE OR ALTER TASK tasty_bytes_dbt_db.dev.run_prepped_data_dbt
  SCHEDULE = '24 hours'
AS
    execute dbt project tasty_bytes_dbt_db.dev.tasty_bytes_dbt_dev args='run --select customer_loyalty_metrics';


ALTER TASK tasty_bytes_dbt_db.dev.run_prepped_data_dbt RESUME;

execute task tasty_bytes_dbt_db.dev.run_prepped_data_dbt;


DESCRIBE DBT PROJECT tasty_bytes_dbt_db.dev.tasty_bytes_dbt_dev;

select * from SNOWFLAKE.TELEMETRY.EVENTS order by timestamp desc;