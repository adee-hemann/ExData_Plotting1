## download data, unzip and read the table
setwd("~/Coursera/Exploratory Data Analysis/Week 1/ExData_Plotting1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "C:\\Users\\axp293\\OneDrive - Sherwin-Williams\\Documents\\Coursera\\Exploratory Data Analysis\\Week 1\\ExData_Plotting1")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## get relevant data for the dates specified
data$Date2 <-as.Date(as.character(data$Date), "%d/%m/%Y")
dat <- subset( data, Date2 == as.Date("2007-02-01" ))
dat2 <- subset( data, Date2 == as.Date("2007-02-02" ))
total <- rbind(dat, dat2)

## combine date and time and format
fulldate<- paste(total$Date2, total$Time)
library(lubridate)
nt<-ymd_hms(fulldate)

## add full date to the total data frame
dfA<-cbind(total, nt)

## convert class of relevant columns to appropriate class
dfA$Sub_metering_3 <-as.numeric(as.character(dfA$Sub_metering_3))
dfA$Sub_metering_2 <-as.numeric(as.character(dfA$Sub_metering_2))
dfA$Sub_metering_1 <-as.numeric(as.character(dfA$Sub_metering_1))

## create plot and png file
plot(dfA$nt, dfA$Sub_metering_1, type="n", xlab ="", ylab= "Energy sub metering")
lines(dfA$nt, dfA$Sub_metering_1, type=, col= "black")
lines(dfA$nt, dfA$Sub_metering_2, type=, col= "red")
lines(dfA$nt, dfA$Sub_metering_3, type=, col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), horiz = FALSE, cex = 0.8, lty = 1)
setwd("C:\\Users\\axp293\\OneDrive - Sherwin-Williams\\Documents\\Coursera\\Exploratory Data Analysis\\Week 1\\assignment\\ExData_Plotting1")
dev.copy(png,'plot3.png', width= 480, height = 480)
dev.off()