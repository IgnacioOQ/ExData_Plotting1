#Assume the household_power_consumption.txt is on the working directory. Otherwise, set the working directory using setwd() accordingly.

#read the data and put it in a data frame called "data". 

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset with the dates in question into a new data2 data frame. ^ and $ serve to point beginning and end of expression, and | helps
#to put more than one expression

data2 <- data[grep("^1/2/2007$|^2/2/2007$", as.character(data$Date)),]

#Format dates and add them to a list

DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Get the Global Active Power and the sub metering 1-3

GAP <- as.numeric(data2$Global_active_power)
SM1 <- as.numeric(data2$Sub_metering_1)
SM2 <- as.numeric(data2$Sub_metering_2)
SM3 <- as.numeric(data2$Sub_metering_3)

#create the png
png("plot3.png", width=480, height=480)

#plot the first sub metering
plot(DateTime, SM1, type="l", ylab="Energy Submetering", xlab="")

#add the other submetering as lines
lines(DateTime, SM2, type="l", col="red")
lines(DateTime, SM3, type="l", col="blue")

#add legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#close device
dev.off()