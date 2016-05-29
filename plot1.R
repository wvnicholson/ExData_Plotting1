# plot1.R

# For plot1.R (and the other R scripts) to work, you need to have the data file in the current
# directory.  I've not uploaded the data file onto github because of it's large size and
# general availability on the course.

# Using skip to read from the first 1st February 2007 entry and nrows to ensure we just read until
# the last 2nd February 2007 entry.
# skip also loses the table headings so read those in with the first row before getting the data for
# the reauired dates
dataFileName="exdata-data-household_power_consumption.zip"
colNamesData = read.csv2(unz(dataFileName, "household_power_consumption.txt"), nrows = 1)
data = read.csv2(unz(dataFileName, "household_power_consumption.txt"), skip = 66636, nrows = 2880, col.names = names(colNamesData), as.is = TRUE)


# skip to first 1st February 2007 entry which is this in the "full data frame":
#           Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2
#66637 1/2/2007 00:00:00               0.326                 0.128 243.150            1.400          0.000          0.000
      Sub_metering_3
#66637          0.000

# In full data frame first 3/2/2007 entry is 69517
# So there are 2880 rows
# The last 2/2/2007 entry is this:
#           Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2
# 69516 2/2/2007 23:59:00               3.680                 0.224 240.370           15.200          0.000          2.000
      Sub_metering_3
# 69516         18.000



data$Global_active_power = as.numeric(data$Global_active_power)

png(file = "plot1.png")

# Messing about with "cex" needed to match ticks on the model version of this plot.
# (Apparently "ylim" and "cex.lab", etc not needed.)
par(cex = .9)
hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#dev.copy(png, file = "plot1.png")
dev.off()