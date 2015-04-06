createChart <- function(data) {
    dateTimes <- paste(data$Date, data$Time)
    times <- strptime(dateTimes, "%e/%m/%Y %T")
    par(mar=c(2, 4, 2, 2))
    yAxisLabel <- "Energy sub metering"
    plot(times, data$Sub_metering_1, type = "l", col = "black", ylab = yAxisLabel)
    lines(times, data$Sub_metering_2, type = "l", col = "red")
    lines(times, data$Sub_metering_3, type = "l", col = "blue")
    legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", col = c("black", "red", "blue"), legend = legendNames, lwd = 1)
}

source("dataLoader.R")
data <- loadData()

png(filename = "plot3.png", width = 504, height = 504)
createChart(data)
dev.off()
