plot2 <- function() {
     # This function plots a line plot of global active power using household
     # power consumption data
     
     # read in data 
     table <- read.table("household_power_consumption.txt", sep = ";",
                         stringsAsFactors = FALSE, header = TRUE)
     # subset data into required date range
     table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",]
     
     # plot line plot of global active power and send to png
     
     png("plot2.png", width=480, height=480) 
     power <- as.numeric(table$Global_active_power)
     
     # get dates for xaxis
     datetime <- strptime(paste(table$Date, table$Time, sep=" "), 
                      "%d/%m/%Y %H:%M:%S")
     
     plot(datetime, power, type = "l", xlab = "", 
          ylab = "Global Active Power (kilowatts)")
     
     # draw box around plot
     box()
     
     dev.off()
}