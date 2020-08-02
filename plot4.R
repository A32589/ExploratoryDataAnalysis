
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

#plot4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(d, plot(TimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(d, plot(TimeDate, Voltage, type = "l", xlab="Datetime", ylab="Voltage"))
with(d, plot(TimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(d$TimeDate, d$Sub_metering_2,type="l", col= "red")
lines(d$TimeDate, d$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(d, plot(TimeDate, Global_reactive_power, type="l", xlab="Datetime", ylab="Global_reactive_power"))
dev.off()