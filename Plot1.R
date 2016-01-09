# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

setwd("C:/Vasu/R_Coursera/Exploratory_data_analysis/Week1/exdata-data-household_power_consumption")

file <- read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=FALSE, dec=".")

# Read columns
colnames(file)

# Date is in format dd/mm/yyyy. Select the data needed. 
desired.data <- file[(file$Date == "1/2/2007" | file$Date == "2/2/2007"),]



# Plot needs data from Global_active_power and Date/Time

class(desired.data$Global_active_power)
# It is "character", So convert it to "numeric"
globalActivePower <- as.numeric(desired.data$Global_active_power)
file$Date <- as.Date(file$Date, format="%d/%m/%Y")


png("C:/Vasu/R_Coursera/Exploratory_data_analysis/Week1/Assignment_1/ExData_Plotting1/plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab = "global Active Power", ylab = "Frequency")
# Close the graphic device
dev.off()
