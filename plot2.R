this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"
if(!file.exists(datafile)){
    print("Run subsetfile.R first to generate data file")
}else{

    data = read.table(datafile,header = TRUE,sep = ";")
    data$Date = strptime(paste(data$Date,data$Time),format = "%Y-%m-%d %H:%M:%S")

    filename2 = "./figure/plot2.png"
    png(filename = filename2 , width = 480, height = 480,bg = "transparent")
    plot(data$Date,data$Global_active_power,type="n",ylab = "Global Active Power (kilowatts)",xlab="")
    lines(data$Date,data$Global_active_power)
    dev.off()
    print(paste("Plot written to: ",paste(getwd(),filename2,sep="/"),sep=""))
}
