# plot 4, combined

library(lubridate)

plot4 = function(pwr) {
    pic <- png("plot4.png", width=480, height=480, antialias = "default")
    
    par(mfrow=c(2,2))
    
    plot(pwr$Date + pwr$Time, pwr$Global_active_power, type="l",
         xlab = "", ylab="Global Active Power (kilowatts)")
    
    plot(pwr$Date + pwr$Time, pwr$Voltage, type="l", col = "black",
         xlab = "datetime", ylab="Voltage")
    
    plot(pwr$Date + pwr$Time, pwr$Sub_metering_1, type="l", col = "black",
         xlab = "", ylab="Enegery Sub Metering")
    lines(pwr$Date + pwr$Time, pwr$Sub_metering_2, type="l", col = "red")
    lines(pwr$Date + pwr$Time, pwr$Sub_metering_3, type="l", col = "blue")
    
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1, lwd=2.5, bty="n", col=c("black", "red", "blue"))
    
    plot(pwr$Date + pwr$Time, pwr$Global_reactive_power, type="l", col = "black",
         xlab = "datetime", ylab="Global_reactive_power")
    
    dev.off()
}

source("read_data.R")
pwr <- read_data()
plot4(pwr)
