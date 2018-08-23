## download data, unzip and read the table
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="dataset.zip", mode="wb") 
unzip ("dataset.zip", exdir = "./")
data <- read.table("household_power_consumption 2.txt", header = TRUE, sep = ";")

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
dfA$Voltage <-as.numeric(as.character(dfA$Voltage))
dfA$Global_reactive_power <-as.numeric(as.character(dfA$Global_reactive_power))

## create plots 
par(mfrow=c(2,2))

## plot 1
plot(dfA$nt, dfA$Global_active_power, type = "n", xlab = "", ylab= "Global Active Power (killowatts)")
lines(dfA$nt, dfA$Global_active_power, type=)

## plot 2
plot(dfA$nt, dfA$Voltage, type = "n", xlab = "datetime", ylab= "Voltage")
lines(dfA$nt, dfA$Voltage, type=)

## plot 3 
plot(dfA$nt, dfA$Sub_metering_1, type="n", xlab ="", ylab= "Energy sub metering")
lines(dfA$nt, dfA$Sub_metering_1, type=, col= "black")
lines(dfA$nt, dfA$Sub_metering_2, type=, col= "red")
lines(dfA$nt, dfA$Sub_metering_3, type=, col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), horiz = FALSE, cex = 0.8, lty = 1)

## plot 4
plot(dfA$nt, dfA$Global_reactive_power, type = "n", xlab = "datetime", ylab= "Global-reactive_power")
lines(dfA$nt, dfA$Global_reactive_power, type=)

# create png file and close device
dev.copy(png,'plot4.png')
dev.off()
