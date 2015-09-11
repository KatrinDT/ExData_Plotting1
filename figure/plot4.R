setwd("~/Data Science_Coursera/Class 4_Exploratory/Project1")

# read in data and prepare
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", nrows=69517, as.is = TRUE) 

datafeb <- data[66638:69517,]

head(datafeb)
tail(datafeb)

datecomb <- paste(datafeb$Date, datafeb$Time, sep =" ")
date<-strptime(datecomb, "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

#generate plot
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))
with(datafeb, {
  
  plot(date,as.numeric(datafeb$Global_active_power), type="l",xlab="", ylab="Global Active Power (kilowatts)")
    
  plot(date,as.numeric(datafeb$Voltage), type="l",xlab="datetime", ylab="Voltage")
  
  plot(date,as.numeric(datafeb$Sub_metering_1), type="l",plot.type="single",xlab="", ylab="Energy sub metering", ylim=c(0, 35),  yaxp=c(0,30,3) )
  lines(date,as.numeric(datafeb$Sub_metering_2),col="red")
  lines(date,as.numeric(datafeb$Sub_metering_3),col="blue")
  legend("topright",lty=c(1,1), col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(date,as.numeric(datafeb$Global_reactive_power), type="l",xlab="datetime", ylab="Global_reactive_power")
                })



#save plot to png
dev.copy(png,filename="plot4.png", width= 480, height= 480, units="px")
dev.off()
