# plot 1, histogram

library(lubridate)

plot1 = function(pwr) {
    pic <- png("plot1.png", width=480, height=480, antialias = "default")
    hist(pwr$Global_active_power, col="red", 
         xlab="Global Active Power (kilowatts)", main="Global Active Power")
    dev.off()
}


source("read_data.R")
pwr <- read_data()
plot1(pwr)
