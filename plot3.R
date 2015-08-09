# Load the data, format it, and subset it
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data$year = format(as.Date(data$Date, "%d/%m/%Y"), format="%Y")
data$month = as.numeric(format(as.Date(data$Date, "%d/%m/%Y"), format="%m"))
data$day = as.numeric(format(as.Date(data$Date, "%d/%m/%Y"), format="%d"))
data$Global_active_power <- as.numeric(data$Global_active_power)
data$gap_kilowatts <- data$Global_active_power
data <- subset(data, year==2007)
data <- subset(data, month==2)
data <- subset(data, day<3)
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Plot and save to png
png(file = "plot3.png")
with(data, plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering", xlab="",main=""))
with(data, points(datetime, Sub_metering_1, type="l"))
with(data, points(datetime, Sub_metering_2, col="red", type="l"))
with(data, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright",  lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()