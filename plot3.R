this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"
if(!file.exists(datafile)){
    # Download/unzip/subset the datafile if it doesn't exist
    print("Running subsetfile.R first to generate data file...")
    source("./subsetfile.R")
}else{

    data = read.table(datafile,header = TRUE,sep = ";")
    data$Date = strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%S")

    filename3 = "figure/plot3.png"
    png(filename = filename3 , width = 480, height = 480,bg = "transparent")
    plot(data$Date,data$Sub_metering_1,type="n",ylab = "Energy sub metering",xlab = "")
    lines(data$Date,data$Sub_metering_1,col = "black")
    lines(data$Date,data$Sub_metering_2,col = "red")
    lines(data$Date,data$Sub_metering_3,col = "blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
    dev.off()
    print(paste("Plot written to: ",paste(getwd(),filename3,sep="/"),sep=""))
}
