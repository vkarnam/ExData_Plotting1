
setwd("C:/Vasu/R_Coursera/Exploratory_data_analysis/Week1/exdata-data-household_power_consumption")

# Read a file and assig n to a variable
file <- read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=FALSE, dec=".")

# Read columns
colnames(file)


# subset the desired data
desired.data <- file[(file$Date == "1/2/2007" | file$Date == "2/2/2007"),]
desired.data[1:10000, 1:3]


# Plot needs dats from Global_active_power vs days. To get the days

class(desired.data$Global_active_power)
# It is "character", So convert it to "numeric"
globalActivePower <- as.numeric(desired.data$Global_active_power)
class(globalActivePower)


#Hint by  Coursera#
#You may find it useful to convert the Date and Time variables to Date/Time classes in R using 
# the strptime()  and as.Date() functions.
## read in date/time info in format 'm/d/y h:m:s'
x <- paste(desired.data$Date, desired.data$Time, sep=" ")
desired.data_1 <- strptime(x = x,format = "%d/%m/%Y %H:%M:%S")
#desired.data_1


# Plot Global_active_power vs desired days.
plot(desired.data_1, globalActivePower, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)


# Close the PNG device
dev.off()
