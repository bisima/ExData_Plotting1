## Project Name: plot1.R
## Author: H Atib
## Title: Exploratory Data Analysis

## The R scripts is for reconstruction of histogram of household global minute-averaged active
## power (in kilowatt).
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
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, xlab = "Global Active Power (kilowatts)", col = "red",
     main = "Global Active Power")
dev.off()