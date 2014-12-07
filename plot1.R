## Exploratory Data Analysis (exdata-016)
## Course Project 1
## By hiicharles@gmail.com
## plot1.R

## If you want to test, change the filePath.
setwd("~/Development/data/exdata-016/")
filePath <- "~/Development/data/exdata-016/household_power_consumption.txt"

## Read file.
## Replace ? with NA.
## 2075259 obs
data <- read.table(file = filePath, header = TRUE, sep = ";", na.strings = "?")

## Only want data with date "1/2/2007" and "2/2/2007"
## 1/2/2007 - 1440 observations
## 2/2/2007 - 1440 observations
sub_data <- data[ data$Date %in% c("1/2/2007", "2/2/2007"), ]    

## Remove data to free up memory
rm(data)

## Add a column Date1 and Time1
## Date1 - "2007-02-01" of class Date
## Time1 - "2007-02-01 00:00:00" of class POSIXct
sub_data$Date1 <- as.Date(x = sub_data$Date, format = "%d/%m/%Y")
sub_data$Time1 <- as.POSIXct(x = paste(sub_data$Date, sub_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

## Graphic File Device to PNG
png(filename = "plot1.png", 
    width = 480, 
    height = 480, 
    units = "px" )

## Generate histogram
hist(x = sub_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

## Close device
dev.off()

