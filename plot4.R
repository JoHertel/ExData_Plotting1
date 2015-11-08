data <- read.table("household_power_consumption.txt", as.is=TRUE, nrows=100000, header=TRUE,sep=";")
data <- data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"), ]
for (i in 3:9) {data[ ,i] <- as.numeric(data[ ,i])}
data$Time <- strptime(paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time), format="%Y-%m-%d %H:%M:%S")
data <- data[ ,2:9]
png(file="plot4.png")
par(mfrow=c(2,2))
with(data, {
        plot(x=Time, y=Global_active_power, type="l", ylab="Global Active Power", xlab = " ")
        plot(x=Time, y=Voltage, type="l", ylab="Voltage", xlab = "datetime")
        plot(x=Time, y=Sub_metering_1, type="l", ylab="Energy sub metering", xlab = " ")
        lines(x=Time, y=Sub_metering_2, col="red")
        lines(x=Time, y=Sub_metering_3, col="blue")
        legend("topright", lwd=1, legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("black", "red", "blue"))
        plot(x=Time, y=Global_reactive_power, type="l", ylab="Global Reactive Power", xlab = "datetime")
})
dev.off()