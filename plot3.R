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

png("plot3.png")
plot(desiredData$Time, 
     desiredData$Sub_metering_1, 
     type = "l", 
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(desiredData$Time, 
      desiredData$Sub_metering_2, 
      col = "red")
lines(desiredData$Time, 
      desiredData$Sub_metering_3, 
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       lwd = c(2,2,2),
       col = c("black", "red", "blue")
)
dev.off()
