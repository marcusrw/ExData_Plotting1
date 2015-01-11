this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"

data = read.table(datafile,header = TRUE,sep = ";")

data$Date = strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%S")

filename4 = "./plot4.png"
png(filename = filename4 , width = 480, height = 480)
plot(data$Date,data$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = "")
lines(data$Date,data$Sub_metering_1,col = "black")
lines(data$Date,data$Sub_metering_2,col = "red")
lines(data$Date,data$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
