#Assume the household_power_consumption.txt is on the working directory. Otherwise, set the working directory using setwd() accordingly.

#read the data and put it in a data frame called "data". 

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset with the dates in question into a new data2 data frame. ^ and $ serve to point beginning and end of expression, and | helps
#to put more than one expression

data2 <- data[grep("^1/2/2007$|^2/2/2007$", as.character(data$Date)),]

#Format dates and add them to a list

DateTime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Get the Global Active Power

GAP <- as.numeric(data2$Global_active_power)

#create the png
png("plot2.png", width=480, height=480)

#plot the histogram
plot(DateTime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close the device
dev.off()