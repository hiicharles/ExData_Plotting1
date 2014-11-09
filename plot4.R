## Exploratory Data Analysis (exdata-008)
## Course Project 1
## By hiicharles@gmail.com
## plot4.R

## Change datadir to point to your data file location
datadir <- "~/Development/data"
setwd(dir = datadir)

## filePath
fileName <- "household_power_consumption.txt"
filePath <- paste(datadir, fileName, sep="/")

## Read file - All the data
hpc_data <- read.table(file=filePath, header = TRUE, sep = ";", na.strings = "?")

## Time must be in Date and Time
hpc_data$Time <- paste(hpc_data$Date, hpc_data$Time, sep = " ")

## Convert Time 
## hpc_data$Time example "16/12/2006 17:24:00"
hpc_data$Time <- as.POSIXct(x = hpc_data$Time, format = "%d/%m/%Y %H:%M:%S")

## Convert Date
hpc_data$Date <- as.Date(hpc_data$Date, format="%d/%m/%Y")

## Subset data between 2007-02-01 to 2007-02-02
## 2880 observations (1 minute = 1 sample)
hpc_subData <- hpc_data[hpc_data$Date == as.Date("2007-02-01") | hpc_data$Date == as.Date("2007-02-02"), ]

## Graphic File Device to PNG
png(filename = "plot4.png", 
    width = 480, 
    height = 480, 
    units = "px" )

## Set 2 rows x 2 cols layout
par(mfrow = c(2, 2))

## Draw 1st plot at row 1, col 1
plot(x = hpc_subData$Time, 
     y = hpc_subData$Global_active_power,
     type="l",  
     col = "black",
     xlab = "",
     ylab = "Global Active Power")

## Draw 2nd plot at row 1, col 2
plot(x = hpc_subData$Time, 
     y = hpc_subData$Voltage,
     type="l",  
     col = "black",
     xlab = "datetime",
     ylab = "Voltage")

## Draw 3rd plot at row 2, col 1
plot(x = hpc_subData$Time, 
     y = hpc_subData$Sub_metering_1,
     type="l",  
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = hpc_subData$Time, 
      y = hpc_subData$Sub_metering_2,
      col = "red")

lines(x = hpc_subData$Time, 
      y = hpc_subData$Sub_metering_3,
      col = "blue")

## Legend without box 
legend("topright", 
       lty = 1,
       box.lwd = 0,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Draw 4th plot at row 2, col 2
plot(x = hpc_subData$Time, 
     y = hpc_subData$Global_reactive_power,
     type="l",  
     col = "black",
     xlab = "datetime",
     ylab = "Global_reactive_power")

## Close device
dev.off()