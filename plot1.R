## Exploratory Data Analysis (exdata-008)
## Course Project 1
## By hiicharles@gmail.com
## plot1.R

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
png(filename = "plot1.png", 
    width = 480, 
    height = 480, 
    units = "px" )

## Generate histogram
hist(x = hpc_subData$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

## Close device
dev.off()