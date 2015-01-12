this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"
if(!file.exists(datafile)){
    # Download/unzip/subset the datafile if it doesn't exist
    print("Running subsetfile.R first to generate data file...")
    source("./subsetfile.R")
}else{

    data = read.table(datafile,header = TRUE,sep = ";")

    filename1 = "figure/plot1.png"
    png(filename = filename1 , width = 480, height = 480,bg = "transparent")
    hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
    dev.off()
    print(paste("Plot written to: ",paste(getwd(),filename1,sep="/"),sep=""))
}
