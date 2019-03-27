data <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, stringsAsFactors = FALSE , dec = ".", na.strings="?") 
data$V1 <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]

globalActivePower <- as.numeric(data$Global_active_power)
date <- strptime(paste(data$Date, data$Time ,sep= " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480 , height = 480)
plot(date, globalActivePower, ylab = "Global Active Power (kilowatts)", type = "l", xlab = " "  )

dev.off()

