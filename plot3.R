setwd("C:/Localdata/CURSOS/BIG DATA/COURSERA/exploratoryDataAnalysis/")
#Establish settings for plot3
png(file="Plot3.png", width=480, height=480, units="px")
#Read file and replace ? by NAs
mainData <- read.table(file="household_power_consumption.txt", header = TRUE, 
                    sep=";", na.strings="?", 
                    colClasses=c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"))

## Create column with date and time together
FullTimeDate <- strptime(paste(mainData$Date, mainData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
mainData <- cbind(mainData, FullTimeDate)
## change columns formats
mainData$Date <- as.Date(mainData$Date, format="%d/%m/%Y")
mainData$Time <- format(mainData$Time, format="%H:%M:%S")
#Filter the dataset for the specified date range
filterData<-subset(mainData, Date == "2007-02-01" | Date =="2007-02-02")
#Creates plot3
with(filterData, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
lines(filterData$FullTimeDate, filterData$Sub_metering_2,type="l", col= "red")
lines(filterData$FullTimeDate, filterData$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()
