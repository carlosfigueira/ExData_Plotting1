createChart <- function(data) {
    yAxisLabel <- "Global Active Power (kilowatts)"
    dateTimes <- paste(data$Date, data$Time)
    times <- strptime(dateTimes, "%e/%m/%Y %T")
    par(mar=c(2, 4, 2, 2))
    plot(times, data$Global_active_power, type = "l", ylab = yAxisLabel)
}

source("dataLoader.R")
data <- loadData()

png(filename = "plot2.png", width = 504, height = 504)
createChart(data)
dev.off()
