# plot2.R
 
 # Using skip to read from the first 1st February 2007 entry and nrows to ensure we just read until
# the last 2nd February 2007 entry.
# skip also loses the table headings so read those in with the first row before getting the data for
# the reauired dates
dataFileName="exdata-data-household_power_consumption.zip"
colNamesData = read.csv2(unz(dataFileName, "household_power_consumption.txt"), nrows = 1)
data = read.csv2(unz(dataFileName, "household_power_consumption.txt"), skip = 66636, nrows = 2880, col.names = names(colNamesData), as.is = TRUE)


data$Global_active_power = as.numeric(data$Global_active_power)
#data$Date = as.Date(data$Date)
#data$Time = as.Time(data$Time)

#data$datetime = strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
data$datetime = strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab = .8, cex.axis = .8)