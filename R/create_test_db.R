# If necessary, install from here.
#devtools::install_github("dataobservatory-eu/indicator")

library(indicators)
require(DBI)
require(dplyr)

if ( ! dir.exists('new_db') ) {
  dir.create("new_db")
}

create_eurostat_database (
  ids = c("ISOC_R_BLT12_I", "isoc_cicce_use", "teicp090", "tin00028"),
  db_path = file.path("new_db", "test_db.db")
)
