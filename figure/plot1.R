setwd("~/Data Science_Coursera/Class 4_Exploratory/Project1")
Sys.setlocale("LC_TIME", "English")

# read in data and prepare
data = read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".",nrows=69517, as.is = TRUE) 

head(data)

datafeb <- data[66638:69517,]

head(datafeb)
tail(datafeb)


#generate plot
hist(as.numeric(datafeb$Global_active_power), col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")

#save plot to png
dev.copy(png,filename="plot1.png", width= 480, height= 480, units="px")
dev.off()


