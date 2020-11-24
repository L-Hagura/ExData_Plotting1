data <- read.csv("household_power_consumption.txt", sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

desiredData <- data[which(data$Date >= as.Date("2007-02-01", 
                                               format = "%Y-%m-%d")),]
desiredData <- desiredData[which(
  desiredData$Date <= as.Date("2007-02-02", format = "%Y-%m-%d")),]

for (i in 1:nrow(desiredData)) {
  desiredData$Time[i] = paste(
    strftime(desiredData$Date[i], format = "%Y-%m-%d"), 
    desiredData$Time[i],
    sep = " "
  )
}

desiredData$Time <- strptime(desiredData$Time)


