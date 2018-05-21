## Plot 1
## import data into   R
dataset<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## format date
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
##Subset Data to date ranges provided
Data_subset<-subset(dataset, dataset$Date>="2007-02-01"& dataset$Date <="2007-02-02")
## histogram the image
hist(Data_subset$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
