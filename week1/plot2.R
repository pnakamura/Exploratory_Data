## Getting full dataset
dataset <- "./household_power_consumption.txt"
data <-read.table(dataset, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
head(data)

## Active  device
png("plot2.png", width = 480, height = 480)

##Plot

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Close device
dev.off()