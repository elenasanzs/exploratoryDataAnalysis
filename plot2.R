setwd("C:/Localdata/CURSOS/BIG DATA/COURSERA/exploratoryDataAnalysis/")
#Establish settings for plot2
png(file="Plot2.png", width=480, height=480, units="px")
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
#Creates plot2 with x and ylabels
with(filterData, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()
