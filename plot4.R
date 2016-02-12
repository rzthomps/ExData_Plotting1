###Exploratory Data Project 1 Plot 4

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

##Plot 4
png(filename = "C:/Users/ryathompson/Documents/6. Coursera/ExploreData/Project1/plot4.png",
    width = 480, 
    height = 480)
par(mfrow = c(2,2))

#Plot 1 in Plot 4
plot(as.numeric(final$Global_active_power,final$Date),xaxt = "n",
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

axis(side = 1 , at = c(1,1440,2880),labels = c("Thu","Fri","Sat") )

#Plot 2 in Plot 4
plot(as.numeric(final$Voltage,final$Date),xaxt = "n",
     type = "l",
     main = "",
     xlab = "datetime",
     ylab = "Voltage")
axis(side = 1 , at = c(1,1440,2880),labels = c("Thu","Fri","Sat") )

#Plot 3 in Plot 4
plot(as.numeric(final$Sub_metering_1,final$Date),
     type = "n",
     xaxt = "n",
     xlab = "",
     ylab = "Energy sub metering")
axis(side = 1 , at = c(1,1440,2880),labels = c("Thu","Fri","Sat") )
lines(as.numeric(final$Sub_metering_1,final$Date))
lines(as.numeric(final$Sub_metering_2,final$Date), col = "red")
lines(as.numeric(final$Sub_metering_3,final$Date), col = "blue")

legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       col=c("black","blue","red"),
       bty = "n")
axis(side = 1 , at = c(1,1440,2880),labels = c("Thu","Fri","Sat") )

#Plot 4 in Plot 4
plot(as.numeric(final$Global_reactive_power,final$Date),xaxt = "n",
     type = "l",
     main = "",
     xlab = "datetime",
     ylab = "Global_reactive_power")
axis(side = 1 , at = c(1,1440,2880),labels = c("Thu","Fri","Sat") )
dev.off()