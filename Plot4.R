##
## Coursera JH - Exploratory Data Analysis - Project 1
##
## Paul Lacock - Nov 2021
##
## Plot 4
##

## Read the data and subset the relevant date range
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data_use <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")

## Create and add usable date/time variable
datetime <- strptime(paste(data_use$Date, data_use$Time), format="%d/%m/%Y %H:%M:%S")
plot_data <- cbind(data_use, datetime)

## Open graphics device, create plot and close device
png(file = "plot4.png")
par(mfcol = c(2,2), cex = 0.8)
## Plot 4.1
plot(plot_data$datetime, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
## Plot 4.2
plot(plot_data$datetime, plot_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plot_data$datetime, plot_data$Sub_metering_2, col="red", type="l", xlab="")
lines(plot_data$datetime, plot_data$Sub_metering_3, col="blue", type="l", xlab="")
legend("topright", bty = "n", col=c("black","red","blue"), cex = 0.9, lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Plot 4.3
with(plot_data, plot(datetime, Voltage, type="l"))
## Plot 4.4
with(plot_data, plot(datetime, Global_reactive_power, type="l"))
dev.off()