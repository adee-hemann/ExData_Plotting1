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

## convert class of relevant column to appropriate class
dfA$Global_active_power<- as.numeric(as.character(dfA$Global_active_power))

## create plot and png file
plot(dfA$nt, dfA$Global_active_power, type = "n", xlab = "", ylab= "Global Active Power (killowatts)")
lines(dfA$nt, dfA$Global_active_power, type=)
dev.copy(png,'plot2.png')
dev.off()

