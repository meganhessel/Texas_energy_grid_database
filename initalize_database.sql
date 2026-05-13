
-- Load libraries 
LOAD spatial;

-- Socioeconomic data 
CREATE TABLE income_texas AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/Texas_energy_grid_database/data/processed/income_texas.parquet');

CREATE TABLE race_texas AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/Texas_energy_grid_database/data/processed/race_texas.parquet');

-- Energy Data 

CREATE TABLE generator_texas AS 
    SELECT * FROM read_parquet('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/Texas_energy_grid_database/data/processed/generator_texas.parquet');


CREATE TABLE plant_texas AS 
    SELECT * FROM st_read('/Users/meganhessel/Documents/MEDS/eds213_databases/final_database_proj/Texas_energy_grid_database/data/processed/plant_texas_sf.parquet');