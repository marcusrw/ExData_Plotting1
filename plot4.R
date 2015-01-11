this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"
if(!file.exists(datafile)){
    print("Run subsetfile.R first to generate data file")
}else{

    data = read.table(datafile,header = TRUE,sep = ";")
    data$Date = strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%S")

    filename4 = "figure/plot4.png"
    png(filename = filename4 , width = 480, height = 480,bg = "transparent")
    par(mfrow=c(2,2))
    plot(data$Date,data$Global_active_power,type="n",ylab = "Global Active Power",xlab="")
    lines(data$Date,data$Global_active_power)

    plot(data$Date,data$Voltage,type="n",ylab = "Voltage",xlab="datetime")
    lines(data$Date,data$Voltage)

    plot(data$Date,data$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = "")
    lines(data$Date,data$Sub_metering_1,col = "black")
    lines(data$Date,data$Sub_metering_2,col = "red")
    lines(data$Date,data$Sub_metering_3,col = "blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

    plot(data$Date,data$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
    lines(data$Date,data$Global_reactive_power)

    dev.off()
    print(paste("Plot written to: ",paste(getwd(),filename4,sep="/"),sep=""))
}
