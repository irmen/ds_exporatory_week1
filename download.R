# download and unzip the raw data 

if(!file.exists("powerconsumption.zip")) {
    message("downloading data...")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "powerconsumption.zip")
} else {
    message("already downloaded")
}

if(!file.exists("household_power_consumption.txt")) {
    message("unzipping datafile...")
    unzip("powerconsumption.zip", exdir = ".")
} else {
    message("already unzipped")
}
