# Plot1

DataFile <- "C:\\Users\\Admin\\Desktop\\PowerConsumption.txt"
Data <- read.table(DataFile,header = T, sep = ";", stringsAsFactors = F, dec = ".")
View(Data)

SubsetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007"), ]
View(SubsetData)

GlobalAcivePower <- as.numeric(SubsetData$Global_active_power)
View(GlobalAcivePower)

png("Plot1.png", width = 500, height = 500)
hist(GlobalAcivePower, col = "purple", main = "Global Active Power", xlab = "Global Active Power (kW)",  )
dev.off()

