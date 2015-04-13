#read the data
file<-"household_power_consumption.txt"
system.time(read.table (file, header=TRUE,sep=";", na.strings="?"))
dataSet<-read.table(file, header=TRUE, sep=";", na.strings="?",as.is=TRUE)

#convert date and time
dataSet$Date<-as.Date(dataSet$Date, format="%d/%m/%Y")
dataSet$TimeNew<-paste(dataSet$Date,dataSet$Time)
dataSet$TimeNew<-c(strptime(dataSet$TimeNew,format="%Y-%m-%d %H:%M:%S"))
dataSet$TimeNew[1]

#select the data corresponding to the dates specified
dataSetSelect1<-dataSet[(dataSet$Date=="2007-02-01"),]
dataSetSelect2<-dataSet[(dataSet$Date=="2007-02-02"),]
dataSetSelect<-rbind(dataSetSelect1, dataSetSelect2)

#generate the plot and copy it to a png file
plot3<-plot(x=dataSetSelect$TimeNew, y=dataSetSelect$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
plot3<-points(x=dataSetSelect$TimeNew, y=dataSetSelect$Sub_metering_2, type="l", col="Red")
plot3<-points(x=dataSetSelect$TimeNew, y=dataSetSelect$Sub_metering_3, type="l", col="Blue")
plot3<-legend("topright", lty = 1, cex = 0.75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
title(main="Plot 3", adj=0)
dev.copy(png,file="plot3.png")

#close the PNG device
dev.off()

