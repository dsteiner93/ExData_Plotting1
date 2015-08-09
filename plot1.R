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

# Plot and save to png
png(file = "plot1.png")
hist(data$gap_kilowatts, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()