#This R script is to show how to query a database and work in R with Github
#Jhansi Leslie
#2015-01-06 



# install and load a new package 
install.packages("RSQLite", dependencies=T)
library(RSQLite)

#locate the database files 
system("ls  *.s")

driver <- dbDriver("SQLite")
con <- dbConnect(driver, dbname="portal_mammals.sqlite")

results <- dbGetQuery(con,"SELECT species, wgt, year 
                      FROM surveys ")
dbDisconnect(con)

plot(results$year, results$wgt)

#because you saved the dataframe results from the database despite the fact that you have disconnected you can still play around with the results and analyze the data 


