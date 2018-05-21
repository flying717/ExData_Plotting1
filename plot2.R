## Plot 2
## import data into   R
dataset<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## format date
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
##Subset Data to date ranges provided
Data_subset<-subset(dataset, dataset$Date>="2007-02-01"& dataset$Date <="2007-02-02")
##Combine Date + Time column
DateTime <- paste(Data_subset$Date, Data_subset$Time)
Data_subset$DateTime <- as.POSIXct(DateTime)
## Plot the image
plot(Data_subset$Global_active_power~Data_subset$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()