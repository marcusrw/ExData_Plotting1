this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"
if(!file.exists(datafile)){
    print("Run subsetfile.R first to generate data file")
}else{

    data = read.table(datafile,header = TRUE,sep = ";")

    filename1 = "./figure/plot1.png"
    png(filename = filename1 , width = 480, height = 480)
    hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
    dev.off()
    print(paste("Plot written to: ",paste(getwd(),filename1,sep="/"),sep=""))
}
