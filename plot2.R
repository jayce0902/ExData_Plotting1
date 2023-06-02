# The goal is to create an R script to plot for the EPC using pre-define plots

#Reading and subsetting the electric power consumption (EPC) data from the UCI dataset
EPC <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
#Get only the 2-day period in February, 2007
EPC_subset <- subset(EPC,EPC$Date=="1/2/2007" | EPC$Date =="2/2/2007")

## PLOT 2
# Converting Date and Time variables (characters) to Date/Time classes in R using the strptime()  and as.Date() functions
EPC_subset$Date <- as.Date(EPC_subset$Date, format="%d/%m/%Y")
EPC_subset$Time <- strptime(EPC_subset$Time, format="%H:%M:%S")
EPC_subset[1:1440,"Time"] <- format(EPC_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
EPC_subset[1441:2880,"Time"] <- format(EPC_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plotting and saving to plot2.png
png(filename="plot2.png",width = 480, height = 480, units = "px")
plot(1:nrow(EPC_subset),as.numeric(as.character(EPC_subset$Global_active_power)),type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)") 
axis(1,at=c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
dev.off()
