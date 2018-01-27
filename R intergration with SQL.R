## R with SQL

library(ROracle)
library(DBI)

# Load the Oracle Database driver. 
# Each of the following commands loads the Oracle Database driver.

driver<- Oracle()
driver <- dbDriver("Oracle")

# Creating the Connection
connection <- dbConnect(driver, username = "system", password = "Oracle_1")

# Checking the list of Tables avaiable in Oracle DB.
dbListTables(connection)

# Importing the data frame ODI from Oracle to R.
ODI = dbReadTable(connection, "ODI")

head(ODI)

library(ggplot2)
library(dplyr)

Runs_Scored = head(ODI %>% group_by(PLAYER) %>% 
                     summarise(Runs = sum(as.numeric(RUNS))) %>% arrange(desc(Runs)),10)

Top_10_Player = ggplot(data = Runs_Scored, aes(PLAYER, Runs)) + geom_bar(stat = "Identity")
Top_10_Player



