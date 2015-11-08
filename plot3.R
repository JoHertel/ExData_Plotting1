data <- read.table("household_power_consumption.txt", as.is=TRUE, nrows=100000, header=TRUE,sep=";")
data <- data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"), ]
for (i in 3:9) {data[ ,i] <- as.numeric(data[ ,i])}
data$Time <- strptime(paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time), format="%Y-%m-%d %H:%M:%S")
data <- data[ ,2:9]
png(file="plot3.png")
with(data, plot(x=Time, y=Sub_metering_1, type="l", ylab="Energy sub metering", xlab = " "))
with(data, lines(x=Time, y=Sub_metering_2, col="red"))
with(data, lines(x=Time, y=Sub_metering_3, col="blue"))
legend("topright", lwd=1, legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black", "red", "blue"))
dev.off()