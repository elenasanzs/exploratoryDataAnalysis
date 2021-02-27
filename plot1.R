setwd("C:/Localdata/CURSOS/BIG DATA/COURSERA/exploratoryDataAnalysis/")
#Establish settings for plot1
png(file="Plot1.png", width=480, height=480, units="px")
#Read file and replace ? by NAs
mainData <- read.table(file="household_power_consumption.txt", header = TRUE, 
                    sep=";", na.strings="?", 
                    colClasses=c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"))
## change columns formats
mainData$Date <- as.Date(mainData$Date, format="%d/%m/%Y")
mainData$Time <- format(mainData$Time, format="%H:%M:%S")
#Filter the dataset for the specified date range
filterData<-subset(mainData, Date == "2007-02-01" | Date =="2007-02-02")
#Creates histogram 15 breaks, title and x and ylabels
hist(filterData$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
