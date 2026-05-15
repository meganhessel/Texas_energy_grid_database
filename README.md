# Texas Energy Grid Database

The purpose of this repository is to create a database and vizualizations answering:

**Do Texas communities optimize their energy generation around local environmental resources, and do socioeconomic and demographic disparities influence how those resources are utilized?**

------------------------------------------------------------------------

**This repository**

1.  Gathers Texas socioeconomic, energy, and environmental data from the Web (details below)

2.  Cleans the raw data sets: `1_data_wrangling.qmd`

3.  Creates a database: `2_initalize_database.sql`

4.  Develops data visualizations to answer the question above: `3_environmental_factors_viz.qmd` and `4_socioEconomic_viz.qmd`

## Data

The data is not located within this repository. The data used in the Texas energy grid database is public, open-sourced on the web. Details and sources are provided below.

+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Data           | Description                                                                                                                                                                                                                                                                                                                                  | Source                                                                                                                                                       |
+================+==============================================================================================================================================================================================================================================================================================================================================+==============================================================================================================================================================+
| Socioeconomic  | Survey that includes detailed information about the nation's people and housing. For this project, I investigated average income and community racial composition from this data.                                                                                                                                                            | [American Census Survey](https://www.census.gov/programs-surveys/acs/) (ACS)                                                                                 |
|                |                                                                                                                                                                                                                                                                                                                                              |                                                                                                                                                              |
|                | Columns used: Average income b19013e1; White b03002e3; Black/African American b03002e4; American Indian and Alaska Native b03002e5; Native Hawaiian and Other Pacific Islander b03002e8; Hispanic/Latino b03002e12; Two or more races b03002e9                                                                                               |                                                                                                                                                              |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Energy         | Form EIA-860 provides generator-level specific information nation wide generators. This data contains multiple sheets. The two used within this database are the Plant and Generator sheets which together contain energy source (`energy_source_1`), energy capacity (`nameplate_capacity_mw`), and latitudes and longitudes of each plant. | [US Energy Information Administration](https://www.eia.gov/electricity/data/eia860/) (EIA)                                                                   |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Wind           | Modeled annual average wind speed for the contiguous United States both onshore and offshore for the period 2007–2013.                                                                                                                                                                                                                       | [National Laboratory of the Rockies](https://www.nlr.gov/grid/wind-toolkit) - Derived from the WIND Toolkit                                                  |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Solar (GHI)    | Multi-year annual average of global horizontal solar irradiance (kWh/m2/year) for the United States.                                                                                                                                                                                                                                         | National Renewable Energy Laboratory: [National Solar Radiation Database](https://nsrdb.nlr.gov/data-sets/us-data) (NSRDB)                                   |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Texas Counties | Shapefile of US counties.                                                                                                                                                                                                                                                                                                                    | US Census Bureau: [2024 TIGER County Shapefiles](https://www.census.gov/cgi-bin/geo/shapefiles/index.php?year=2024&layergroup=Counties+%28and+equivalent%29) |
+----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+

## Repo Structure

All qmds and sql scripts are located in the repository root and labeled in project order.

Cleaning and wrangling the raw data sets are accomplished in `1_data_wrangling.qmd` . Creating the database is done in the `2_initalize_database.sql` . Data visualization to answer the overarching question is within `3_environmental_factors_viz.qmd` and `4_socioEconomic_viz.qmd` . Data visualizations are saved in the `figs` folder, whereas the final infographic is in the `infographic` folder.

```{r}
├── 1_data_wrangling.qmd
├── 2_initalize_database.sql
├── 3_enviromental_factors_viz.qmd
├── 4_socioEconomic_viz.qmd
├── README.md
├── Texas_energy_grid_database.Rproj
├── database_queries.sql
├── figs
│   ├── income_energy_plot.pdf
│   ├── race_energy_plot.pdf
│   ├── solar_texas_linePlot.pdf
│   ├── solar_texas_map.pdf
│   ├── wind100m_texas_lineplot.pdf
│   ├── wind100m_texas_map.pdf
│   ├── wind120m_texas_lineplot.pdf
│   └── wind120m_texas_map.pdf
└── infographic
    └── infographic_v6.png
```

## References 

Draxl, C., Hodge, B. M., Clifton, A., & McCaa, J. (2015). The Wind Integration National Dataset (WIND) Toolkit. *Applied Energy*, *151*, 355–366.

Lieberman-Cribbin, W., Draxl, C., & Clifton, A. (2014). *Guide to using the WIND Toolkit validation code* (Technical Report No. NREL/TP-5000-62595). National Renewable Energy Laboratory.

King, J., Clifton, A., & Hodge, B. M. (2014). *Validation of power output for the WIND Toolkit* (Technical Report No. NREL/TP-5D00-61714). National Renewable Energy Laboratory.

Sengupta, M., Xie, Y., Lopez, A., Habte, A., Maclaurin, G., & Shelby, J. (2018). The national solar radiation data base (NSRDB). *Renewable and Sustainable Energy Reviews*, *89*, 51–60.

U.S. Energy Information Administration. (2025). *Form EIA-860 detailed data with previous form data (EIA-860A/860B)*. <https://www.eia.gov/electricity/data/eia860/>

U.S. Census Bureau. (2019). *American Community Survey 5-year estimates*. <https://www.census.gov/programs-surveys/acs>

U.S. Census Bureau. (2025). *TIGER/Line® shapefiles*. <https://www.census.gov/cgi-bin/geo/shapefiles/index.php>
