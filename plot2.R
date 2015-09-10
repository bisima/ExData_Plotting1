## Project Name: plot2.R
## Author: H Atib
## Title: Exploratory Data Analysis

## The R scripts is for reconstructing plot of household global minute-averaged active
## power (in kilowatt) within two days
###################################################################################################
## Load libraries needed by this program 
library(data.table)
library(dplyr)

setwd("~/exDataAna")
sourcefile <- "household_power_consumption.txt"
## Read data from source file
epcDataset <- read.table(sourcefile, header = TRUE, sep=";", stringsAsFactors = FALSE, dec = ".")

## Extract required data from the dates 2007-02-01 and 2007-02-02.
extData <- filter(epcDataset, epcDataset$Date =="1/2/2007" | epcDataset$Date =="2/2/2007")

globalActivePower <- as.numeric(extData$Global_active_power)
dateData <- paste(extData$Date, extData$Time, sep = " ")
dateData <- strptime(dateData, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(dateData, globalActivePower, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()