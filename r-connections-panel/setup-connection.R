# Install the required packages
install.packages(c("RSQLite", "connections"))

# Load the packages
library(connections)
library(RSQLite)

# Open a new connection
con <- connection_open(RSQLite::SQLite(), "local.sqlite")

# Write a table into the database
dbWriteTable(con, "mtcars", mtcars, overwrite = TRUE)

# Alternatively, copy using dplyr: 

# dplyr::copy_to(con, mtcars, temporary = FALSE, overwrite = TRUE)
