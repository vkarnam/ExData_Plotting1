# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

setwd("C:/Vasu/R_Coursera/Exploratory_data_analysis/Week1/exdata-data-household_power_consumption")

file <- read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=FALSE, dec=".")
# Read column names
colnames(file)

# Date is in format dd/mm/yyyy. Select the data needed. 
desired.data <- file[(file$Date == "1/2/2007" | file$Date == "2/2/2007"),]
desired.data[1:10000, 1:3]


#str(datetime)
#Hint by  Coursera#
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using 
# the strptime()  and as.Date() functions.
## read in date/time info in format 'm/d/y h:m:s'
x <- paste(desired.data$Date, desired.data$Time, sep=" ")
datetime <- strptime(x = x,format = "%d/%m/%Y %H:%M:%S")
#datetime

# Assign class "numeric" to below data
class(globalActivePower)
class(desired.data$Sub_metering_1)

globalActivePower <- as.numeric(desired.data$Global_active_power)
globalReactivePower <- as.numeric(desired.data$Global_reactive_power)
subMetering1 <- as.numeric(desired.data$Sub_metering_1)
subMetering2 <- as.numeric(desired.data$Sub_metering_2)
subMetering3 <- as.numeric(desired.data$Sub_metering_3)
voltage <- as.numeric(desired.data$Voltage)



png("C:/Vasu/R_Coursera/Exploratory_data_analysis/Week1/Assignment_1/ExData_Plotting1/plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the graphic device
dev.off()
