# plot 3, sub metering

library(lubridate)

plot3 = function(pwr) {
    pic <- png("plot3.png", width=480, height=480, antialias = "default")
    plot(pwr$Date + pwr$Time, pwr$Sub_metering_1, type="l", col = "black",
         xlab = "", ylab="Enegery Sub Metering")
    lines(pwr$Date + pwr$Time, pwr$Sub_metering_2, type="l", col = "red")
    lines(pwr$Date + pwr$Time, pwr$Sub_metering_3, type="l", col = "blue")
    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1, lwd=2.5, col=c("black", "red", "blue"))
    dev.off()
}

source("read_data.R")
pwr <- read_data()
plot3(pwr)
