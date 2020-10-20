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


## convert class of relevant column to appropriate class
total$Global_active_power<- as.numeric(as.character(total$Global_active_power))

## create plot and png file
hist(total$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

setwd("C:\\Users\\axp293\\OneDrive - Sherwin-Williams\\Documents\\Coursera\\Exploratory Data Analysis\\Week 1\\assignment\\ExData_Plotting1")
dev.copy(png,'plot1.png', width= 480, height = 480)
dev.off()


