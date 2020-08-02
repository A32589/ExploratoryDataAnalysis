
#setwd("c:/Users/32/Documents/Learning R/testing")

#Reading the text file 
a <- read.table("household_power_consumption.txt",sep=";",header = TRUE,stringsAsFactors = FALSE)

#Converting date time to proper format and subsetting 
a$Date <- as.Date(a$Date,format="%d/%m/%Y")
a$Time <- format(a$Time,format="%H:%M:%S")
d <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")

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

#plot 1
png("plot1.png", width=480, height=480)
hist(d$Global_active_power,col="red",ylab = "Frequency",xlab="Global Active Power (kilowatts)",main="Global Active power")
dev.off()