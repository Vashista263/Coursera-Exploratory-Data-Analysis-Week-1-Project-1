# Plot4

DataFile <- "C:\\Users\\Admin\\Desktop\\PowerConsumption.txt"
Data <- read.table(DataFile,header = T, sep = ";", stringsAsFactors = F, dec = ".")
View(Data)

SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]
View(SubsetData)

DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 

GlobalAcivePower <- as.numeric(SubsetData$Global_active_power)
View(GlobalAcivePower)

GlobalReactivePower <- as.numeric(SubsetData$Global_reactive_power)
View(GlobalReactivePower)

Voltage <- as.numeric(SubsetData$Voltage)
View(Voltage)

SubMetering1 <- as.numeric(SubsetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubsetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubsetData$Sub_metering_3)

png("Plot4.png", width = 500, height = 500)
par(mfrow = c(2, 2))

plot(DateTime, GlobalAcivePower, type = "l", xlab = " ", ylab = "Global Active Power", cex = 0.2)

plot(DateTime, Voltage, type = "l", xlab = "Date&Time", ylab = "Voltage")

plot(DateTime, SubMetering1, type = "l", xlab = " ", ylab = "Energy SubMetering")
lines(DateTime, SubMetering2, type = "l", col = "red")
lines(DateTime, SubMetering3, type = "l", col = "blue")
legend("topright", c("SubMetering1", "SubMetering2", "SubMetering3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(DateTime, GlobalReactivePower, type = "l", xlab= "Date&Time", ylab = "Global Reactive Power")

dev.off()