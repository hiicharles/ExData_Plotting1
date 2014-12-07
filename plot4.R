## Exploratory Data Analysis (exdata-016)
## Course Project 1
## By hiicharles@gmail.com
## plot4.R

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
png(filename = "plot4.png", 
    width = 480, 
    height = 480, 
    units = "px" )

## Set 2 rows x 2 cols layout
par(mfrow = c(2, 2))

## Draw 1st plot at row 1, col 1
plot(x = sub_data$Time1, 
     y = sub_data$Global_active_power,
     type="l",  
     col = "black",
     xlab = "",
     ylab = "Global Active Power")

## Draw 2nd plot at row 1, col 2
plot(x = sub_data$Time1, 
     y = sub_data$Voltage,
     type="l",  
     col = "black",
     xlab = "datetime",
     ylab = "Voltage")

## Draw 3rd plot at row 2, col 1
plot(x = sub_data$Time1, 
     y = sub_data$Sub_metering_1,
     type="l",  
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = sub_data$Time1, 
      y = sub_data$Sub_metering_2,
      col = "red")

lines(x = sub_data$Time1, 
      y = sub_data$Sub_metering_3,
      col = "blue")

## Legend without box 
legend("topright", 
       lty = 1,
       box.lwd = 0,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Draw 4th plot at row 2, col 2
plot(x = sub_data$Time1, 
     y = sub_data$Global_reactive_power,
     type="l",  
     col = "black",
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Close device
dev.off()
