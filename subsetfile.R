this.directory <- dirname(parent.frame(2)$ofile)
setwd(this.directory)
print(getwd())

## check if the files already exist, and download/unzip them if not
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfilepath = "./data/exdata_data_household_power_consumption.zip"
unzipfilepath = "./household_power_consumption.txt"
textfilepath = "./data/household_power_consumption.txt"
subsetfilepath = "./data/household_power_consumption_subset.txt"

if (file.exists(subsetfilepath)){
    print("Data File already exists!")
}else{
    if (!file.exists(textfilepath)){
        if (!file.exists("./data")){
            dir.create("./data")
        }
        if (!file.exists(zipfilepath)){
            download.file(fileUrl,destfile = zipfilepath,method = "curl")
        }
        unzip(zipfilepath)
        file.rename(unzipfilepath,textfilepath)
    }

    data = read.table(textfilepath,header = TRUE,sep = ";")

    ## Convert the first column to a date so we can subset
    data$Date = as.Date(data$Date,format = "%d/%m/%Y")
    data.subset = data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

    ## put the date and time in one variable for simplicity
    data.subset$Date = strptime(paste(data.subset$Date,data.subset$Time),format = "%Y-%m-%d %H:%M:%S")

    ## write the subsetted data to a smaller file
    write.table(data.subset,file = subsetfilepath,sep= ";",row.names = FALSE)
}
