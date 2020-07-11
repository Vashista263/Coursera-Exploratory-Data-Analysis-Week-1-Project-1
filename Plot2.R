# Plot2

DataFile <- "C:\\Users\\Admin\\Desktop\\PowerConsumption.txt"
Data <- read.table(DataFile,header = T, sep = ";", stringsAsFactors = F, dec = ".")
View(Data)

SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]
View(SubsetData)

DateTime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
View(DataTime)

GlobalAcivePower <- as.numeric(SubsetData$Global_active_power)
View(GlobalAcivePower)

png("Plot2.png", width = 500, height = 500)
plot(DateTime, GlobalAcivePower, type = "l", xlab = " ", ylab = "Global Active Power (kW)", col = "blue")
dev.off()

