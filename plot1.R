# The goal is to create an R script to plot for the EPC using pre-define plots

#Reading and subsetting the electric power consumption (EPC) data from the UCI dataset
EPC <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
#Get only the 2-day period in February, 2007
EPC_subset <- subset(EPC,EPC$Date=="1/2/2007" | EPC$Date =="2/2/2007")

## PLOT 1
#First Plot Histogram of Global Active Power(kilowatts)
png(filename="plot1.png",width = 480, height = 480, units = "px")
hist(as.numeric(as.character(EPC_subset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()

