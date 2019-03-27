data <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, stringsAsFactors = FALSE , dec = ".", na.strings="?") 
data$V1 <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") , ]

date <- strptime(paste(data$Date, data$Time ,sep= " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480 , height = 480)
plot(date , data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = " ")
lines(date, data$Sub_metering_2 , type = "l", col = "red")
lines(date, data$Sub_metering_3 , type = "l" , col = "blue")
legend("topright", legend = c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"),
       col = c("Black", "Red" , "Blue"), lty=1, lwd=1)

dev.off()