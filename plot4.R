## Project Name: plot4.R
## Author: H Atib
## Title: Exploratory Data Analysis

## The R scripts to plot of household within two days
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
subMmetering1 <- as.numeric(extData$Sub_metering_1)
subMmetering2 <- as.numeric(extData$Sub_metering_2)
subMmetering3 <- as.numeric(extData$Sub_metering_3)
voltage <- as.numeric(extData$Voltage)
globalReactivePower <- as.numeric(extData$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(dateData, globalActivePower, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
plot(dateData, voltage, type = "l", xlab ="datetime", ylab = "Voltage")
plot(dateData, subMmetering1, type = "l", xlab ="", ylab = "Energy sub metering")
lines(dateData, subMmetering2, col="red")
lines(dateData, subMmetering3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty='n')
plot(dateData, globalReactivePower, type = "l", xlab ="datetime", ylab = "Global_reactive_power")
dev.off()