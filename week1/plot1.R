# to examine how household energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.


dataset <- "./household_power_consumption.txt"
data <-read.table(dataset, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png("plot1.png", width = 480, height = 480)

hist(globalActivePower, col = "red", main = "Global Active Power", xlab =
             "Global Active Power (kilowatts)")
dev.off()
