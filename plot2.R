# plot 2, power during the day

library(lubridate)

plot2 = function(pwr) {
    pic <- png("plot2.png", width=480, height=480, antialias = "default")
    plot(pwr$Date + pwr$Time, pwr$Global_active_power, type="l",
         xlab = "", ylab="Global Active Power (kilowatts)")
    dev.off()
}

source("read_data.R")
pwr <- read_data()
plot2(pwr)
