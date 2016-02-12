###Exploratory Data Project 1 Plot 2

##Set Working Directory
setwd("C:/Users/ryathompson/Documents/6. Coursera/ExploreData/Project1")

##Download data & unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="p1.zip")
unzip("p2.zip")

##Read data into R
x <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
y <- x

##Load packages
library("lubridate")
library("dplyr")

##Add DataForm column and subset to 2 day span

DateForm <- as.Date(y$Date, "%d/%m/%Y")
xy <- cbind(DateForm,y)
final <- filter(xy, DateForm <= "2007-02-02" & DateForm >= "2007-02-01")

datetime <- strptime(paste(final$Date, final$Time), format = "%d/%m/%Y %H:%M:%S")
final <- cbind(final,datetime)

##Plot 2
png(filename = "C:/Users/ryathompson/Documents/6. Coursera/ExploreData/Project1/plot2.png",
    width = 480, 
    height = 480)
plot(final$datetime,final$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
