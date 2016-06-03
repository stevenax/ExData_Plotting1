plot4 <- function() {
     # This function creates 4 plots using household power consumption data
     
     # read in data 
     table <- read.table("household_power_consumption.txt", sep = ";",
                         stringsAsFactors = FALSE, header = TRUE)
     # subset data into required date range
     table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",]
     
     # convert table columns to numeric and assign to variables
     aPower <- as.numeric(table$Global_active_power)
     rPower <- as.numeric(table$Global_reactive_power)
     sub1 <- as.numeric(table$Sub_metering_1)
     sub2 <- as.numeric(table$Sub_metering_2)
     sub3 <- as.numeric(table$Sub_metering_3)
     voltage <- as.numeric(table$Voltage)
     
     # get dates
     datetime <- strptime(paste(table$Date, table$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")
     
     # create 2x2 grid for plots and open png
     png("plot4.png", width=480, height=480)
     par(mfrow = c(2,2))
     
     # create global active power plot
     plot(datetime, aPower, type = "l", xlab = "", 
          ylab = "Global Active Power (kilowatts)")
     
     # create voltage plot
     plot(datetime, voltage, type = "l", ylab = "Voltage")     
     
     # create energy submetering plot
     plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
     lines(datetime, sub2, col = "red")
     lines(datetime, sub3, col = "blue")
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col=c("black", "red", "blue"), lty=1, lwd=1, bty="n")
     box()
     
     # create global reactive power plot
     plot(datetime, rPower, type = "l", ylab = "Global_reactive_power")
     
     dev.off()
     
}