
#setwd("c:/Users/32/Documents/Learning R/testing")

#Reading the text file 
a <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)

TimeDate <- strptime(paste(a$Date, a$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
a <- cbind(a, TimeDate)

#Converting date time to proper format and subsetting 
a$Date <- as.Date(a$Date,format="%d/%m/%Y")
a$Time <- format(a$Time,format="%H:%M:%S")
d <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")

## Create column in table with date and time merged together


#removing the original data from memory
rm(a)

#converting the other variables to proper format 
d$Global_active_power <- as.numeric(d$Global_active_power)
d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
d$Voltage <- as.numeric(d$Voltage)
d$Global_intensity <- as.numeric(d$Global_intensity)
d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)

## plot2 -- Two possible approaches easier one displayed other is variable conversion to appropriate class
png("plot2.png",height = 480,width = 480)
with(d, plot(TimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
