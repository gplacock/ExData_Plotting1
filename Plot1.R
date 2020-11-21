##
## Coursera JH - Exploratory Data Analysis - Project 1
##
## Paul Lacock - Nov 2021
##
## Plot 1
##

## Read the data and subset the relevant date range
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data_use <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")

## Create and add usable date/time variable
datetime <- strptime(paste(data_use$Date, data_use$Time), format="%d/%m/%Y %H:%M:%S")
plot_data <- cbind(data_use, datetime)

## Open graphics device, create plot and close device
png(file = "plot1.png")
par(cex = 0.9)
hist(data_use$Global_active_power, main="Global Active Power", xlab= "Global Active Power (kilowatts)", col="red")
dev.off()