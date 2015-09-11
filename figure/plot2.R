setwd("~/Data Science_Coursera/Class 4_Exploratory/Project1")

# read in data and prepare
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", nrows=69517, as.is = TRUE) 

head(data)

datafeb <- data[66638:69517,]

head(datafeb)
tail(datafeb)

datecomb <- paste(datafeb$Date, datafeb$Time, sep =" ")
date<-strptime(datecomb, "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

#generate plot
plot(date,as.numeric(datafeb$Global_active_power), type="l",xlab="", ylab="Global Active Power (kilowatts)")

#save plot to png
dev.copy(png,filename="plot2.png", width= 480, height= 480, units="px")
dev.off()


