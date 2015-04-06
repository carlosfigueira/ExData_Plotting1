createChart <- function(data) {
    xAxisLabel <- "Global Active Power (kilowatts)"
    title <- "Global Active Power"
    hist(data$Global_active_power, col = "red", xlab = xAxisLabel, main = title)
}

source("dataLoader.R")
data <- loadData()

png(filename = "plot1.png", width = 504, height = 504)
createChart(data)
dev.off()
