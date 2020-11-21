##
## Coursera JH - Exploratory Data Analysis - Project 1
##
## Paul Lacock - Nov 2021
##
## Plot 2
##

## Read the data and subset the relevant date range
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data_use <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")

## Create and add usable date/time variable
datetime <- strptime(paste(data_use$Date, data_use$Time), format="%d/%m/%Y %H:%M:%S")
plot_data <- cbind(data_use, datetime)

## Open graphics device, create plot and close device
png(file = "plot2.png")
par(cex = 0.9)
plot(plot_data$datetime, plot_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()