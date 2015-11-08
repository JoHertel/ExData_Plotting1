data <- read.table("household_power_consumption.txt", as.is=TRUE, nrows=100000, header=TRUE,sep=";")
data <- data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"), ]
for (i in 3:9) {data[ ,i] <- as.numeric(data[ ,i])}
data$Time <- strptime(paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time), format="%Y-%m-%d %H:%M:%S")
data <- data[ ,2:9]
png(file="plot1.png")
with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
