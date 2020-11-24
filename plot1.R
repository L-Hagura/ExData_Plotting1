data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

desiredData <- data[which(data$Date >= as.Date("2007-02-01", 
                                               format = "%Y-%m-%d")),]
desiredData <- desiredData[which(
  desiredData$Date <= as.Date("2007-02-02", format = "%Y-%m-%d")),]

png(file = "plot1.png")
hist(as.numeric(desiredData$Global_active_power), 
     col = "Red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()