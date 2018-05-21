## Plot 3
## import data into   R
dataset<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## format date
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
##Subset Data to date ranges provided
Data_subset<-subset(dataset, dataset$Date>="2007-02-01"& dataset$Date <="2007-02-02")
##Combine Date + Time column
DateTime <- paste(Data_subset$Date, Data_subset$Time)
Data_subset$DateTime <- as.POSIXct(DateTime)
## Create plot 3
with(Data_subset, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()