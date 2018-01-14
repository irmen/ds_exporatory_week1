# read the relevant lines from the data file

read_data = function() {
    
    # determine the lines that contain the relevant time period we're interested in
    # (1/2/2007 through 2/2/2007)
    f <- file("household_power_consumption.txt", "r")
    colnames <- strsplit(readLines(f, 1), ';')[[1]]
    
    startline = 1
    repeat {
        line <- readLines(f, 1)
        if (startsWith(line, "1/2/2007;")) break
        startline <- startline + 1
    }
    endline <- startline
    repeat {
        line <- readLines(f, 1)
        if (startsWith(line, "3/2/2007;")) break
        endline <- endline+1
    }
    close(f)
    message("data starts on line ", startline, " and ends on line ", endline)
    
    
    library(data.table)
    pwr <- data.table::fread("household_power_consumption.txt", header=FALSE,
                             col.names = colnames,
                             colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                             na.strings = c("NA", "?"),
                             skip = startline, nrows = endline-startline
                             )
    
    # convert date and time columns
    library(dplyr)
    library(lubridate)
    pwr %>% mutate(Date=dmy(Date), Time=hms(Time))
}
