# The goal is to create an R script to plot for the EPC using pre-define plots

#Reading and subsetting the electric power consumption (EPC) data from the UCI dataset
EPC <- read.table("household_power_consumption.txt",header = TRUE,sep=";")
#Get only the 2-day period in February, 2007
EPC_subset <- subset(EPC,EPC$Date=="1/2/2007" | EPC$Date =="2/2/2007")

## PLOT 3
# Converting Date and Time variables (characters) to Date/Time classes in R using the strptime()  and as.Date() functions
EPC_subset$Date <- as.Date(EPC_subset$Date, format="%d/%m/%Y")
EPC_subset$Time <- strptime(EPC_subset$Time, format="%H:%M:%S")
EPC_subset[1:1440,"Time"] <- format(EPC_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
EPC_subset[1441:2880,"Time"] <- format(EPC_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plotting and saving to plot3.png
png(filename="plot3.png",width = 480, height = 480, units = "px")
plot(1:nrow(EPC_subset),EPC_subset$Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering")
axis(1,at=c(1,1440,2880), labels = c("Thu", "Fri", "Sat"))
lines(1:nrow(EPC_subset),EPC_subset$Sub_metering_1)
lines(1:nrow(EPC_subset),EPC_subset$Sub_metering_2, col="red")
lines(1:nrow(EPC_subset),EPC_subset$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

