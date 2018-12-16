hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
subsethpc <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpc)
hpc_date <- paste(as.Date(subsethpc$Date), subsethpc$Time)
subsethpc$Datetime <- as.POSIXct(hpc_date)
hist(subsethpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="C:/Users/evita/Documents/R/plot1.png", height=480, width=480)
dev.off()