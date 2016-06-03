plot3 <- function() {
     # This function plots a line plot of energy read from 3 submeters using
     # household power consumption data
     
     # read in data 
     table <- read.table("household_power_consumption.txt", sep = ";",
                         stringsAsFactors = FALSE, header = TRUE)
     # subset data into required date range
     table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",]
     
     # plot line plot of energy submetering and send to png
     
     png("plot3.png", width=480, height=480) 
     sub1 <- as.numeric(table$Sub_metering_1)
     sub2 <- as.numeric(table$Sub_metering_2)
     sub3 <- as.numeric(table$Sub_metering_3)
     
     # get dates for xaxis
     datetime <- strptime(paste(table$Date, table$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")
     
     plot(datetime, sub1, type = "l", xlab = "", ylab = "Energy sub metering")
     lines(datetime, sub2, col = "red")
     lines(datetime, sub3, col = "blue")
     
     #draw legend
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col=c("black", "red", "blue"), lty=1, lwd=1)
     
     # draw box around plot
     box()
     
     dev.off()

}