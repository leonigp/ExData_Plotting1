#read the data
file<-"household_power_consumption.txt"
system.time(read.table (file, header=TRUE,sep=";", na.strings="?"))
dataSet<-read.table(file, header=TRUE, sep=";", na.strings="?")
dataSet$Date<-as.Date(dataSet[,1], "%d/%m/%Y")
dataSet$Time<-strptime(dataSet[,2], format="")

#select the data corresponding to the dates specified
dataSetSelect1<-subset(dataSet, Date=="2007-02-01")
dataSetSelect2<-subset(dataSet, Date=="2007-02-02")
dataSetSelect<-rbind(dataSetSelect1, dataSetSelect2)

#generate the plot and copy it to a png file
plot1<-hist(dataSetSelect$Global_active_power, col="red", main="", xlab="Global Active Power (kilowatts)")
title(main="Plot 1", adj=0)
mtext("Global Active Power")
dev.copy(png,file="plot1.png")

#close the PNG device
dev.off()
