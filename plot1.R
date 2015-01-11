this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)

datafile = "./data/household_power_consumption_subset.txt"

data = read.table(datafile,header = TRUE,sep = ";")

filename1 = "./plot1.png"
png(filename = filename1 , width = 480, height = 480)
hist(data$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col = "red")
dev.off()