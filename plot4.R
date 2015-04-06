createChart <- function(data) {
    dateTimes <- paste(data$Date, data$Time)
    times <- strptime(dateTimes, "%e/%m/%Y %T")
    par(mfrow=c(2,2), mar = c(4, 4, 2, 2))

    yAxisLabel <- "Global Active Power"
    plot(times, data$Global_active_power, type = "l", ylab = yAxisLabel, xlab = "")

    xAxisLabel <- "datetime"
    plot(times, data$Voltage, type = "l", xlab = xAxisLabel)

    yAxisLabel <- "Energy sub meeting"
    plot(times, data$Sub_metering_1, type = "l", col = "black", ylab = yAxisLabel, xlab = "")
    lines(times, data$Sub_metering_2, type = "l", col = "red")
    lines(times, data$Sub_metering_3, type = "l", col = "blue")
    legendNames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright", col = c("black", "red", "blue"), legend = legendNames, bty = "n", lwd = 1)

    par(mar=c(4, 4, 2, 2))
    xAxisLabel <- "datetime"
    yAxisLabel <- "Global_reactive_power"
    plot(times, data$Global_reactive_power, type = "l", xlab = xAxisLabel, ylab = yAxisLabel)
}

source("dataLoader.R")
data <- loadData()

png(filename = "plot4.png", width = 480, height = 480)
createChart(data)
dev.off()
