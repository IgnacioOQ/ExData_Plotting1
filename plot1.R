#Assume the household_power_consumption.txt is on the working directory. Otherwise, set the working directory using setwd() accordingly.

#read the data and put it in a data frame called "data". 

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset with the dates in question into a new data2 data frame. ^ and $ serve to point beginning and end of expression, and | helps
#to put more than one expression

data2 <- data[grep("^1/2/2007$|^2/2/2007$", as.character(data$Date)),]

#Put the relevant data in a numeric list

GAP <- as.numeric(data2$Global_active_power)

#create the png
png("plot1.png", width=480, height=480)

#plot the histogram
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the device
dev.off()