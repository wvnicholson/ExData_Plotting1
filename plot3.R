# plot3.R
 
 # Using skip to read from the first 1st February 2007 entry and nrows to ensure we just read until
# the last 2nd February 2007 entry.
# skip also loses the table headings so read those in with the first row before getting the data for
# the reauired dates
dataFileName="exdata-data-household_power_consumption.zip"
colNamesData = read.csv2(unz(dataFileName, "household_power_consumption.txt"), nrows = 1)
data = read.csv2(unz(dataFileName, "household_power_consumption.txt"), skip = 66636, nrows = 2880, col.names = names(colNamesData), as.is = TRUE)

data$datetime = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))