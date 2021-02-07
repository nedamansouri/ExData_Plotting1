
###set work directory-----------------------------------------------------------
setwd("c:/users/asus/desktop/data r code/john hop")


###import file------------------------------------------------------------------
data <- read.delim("household_power_consumption.txt", sep =";" ,header = T )



###Data prepration--------------------------------------------------------------
###format date & time class
summary(data)
data1 <- subset(data,data$Date =="2/2/2007" | data$Date == "1/2/2007")
data1$datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sum(is.na(data1))


###format numeric class
data1$Global_active_power    <- as.numeric(data1$Global_active_power)
data1$Global_reactive_power  <- as.numeric(data1$Global_reactive_power)
data1$Voltage                <- as.numeric(data1$Voltage)
data1$Global_intensity       <- as.numeric(data1$Global_intensity)
data1$Sub_metering_1         <- as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2         <- as.numeric(data1$Sub_metering_2)
summary(data1)


###png--------------------------------------------------------------------------
png(filename = "plot3.png", width = 480, height = 480)


###Visualization----------------------------------------------------------------
plot3 <- with(data1, plot(datetime, data1$Sub_metering_1,type = "l",
                          ylab = "Energy Sub metering", xlab = ""))
lines(data1$datetime, data1$Sub_metering_2, type = "l", col = "red")
lines(data1$datetime, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))


###close dev--------------------------------------------------------------------
dev.off() 


********************************************************************************