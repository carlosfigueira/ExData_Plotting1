loadData <- function() {
    if (!file.exists("data")) {
        dir.create("data")
    }

    rawDataset = "data/household_power_consumption.txt"
    rawDatasetFileName = "household_power_consumption.txt"
    if (!file.exists(rawDataset)) {
        originalDataset <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        localOriginalDataset <- "data/exdata-data-household_power_consumption.zip"
        if (!file.exists(originalDataset)) {
            download.file(originalDataset, localOriginalDataset, mode = "wb")
        }
        
        unzip(localOriginalDataset, files = rawDatasetFileName, exdir = "data")
    }

    numberOfObs <- 2880
    rowOfFirstObs <- 66638
    result <- read.delim(rawDataset, sep = ";", skip = rowOfFirstObs - 1, nrows = numberOfObs, header = FALSE)
    header <- read.delim(rawDataset, sep = ";", nrows = 2, header = TRUE)
    names(result) <- names(header)
    result
}
