plot1 <- function() {
     # This function plots a histogram of global active power using household
     # power consumption data
          
     # read in data 
     table <- read.table("household_power_consumption.txt", sep = ";",
                         stringsAsFactors = FALSE, header = TRUE)
     # subset data into required date range
     table <- table[table$Date == "1/2/2007" | table$Date == "2/2/2007",]

     # plot histogram of global active power and send to png
     png("plot1.png", width=480, height=480) 
     power <- as.numeric(table$Global_active_power)
     hist(power, col = "red", main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)")
     dev.off()
}