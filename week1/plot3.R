## Getting full dataset
dataset <- "./household_power_consumption.txt"
data <-read.table(dataset, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subsetting the data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Active  device
png("plot3.png", width = 480, height = 480)

##Plot
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close device

dev.off()