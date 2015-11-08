data <- read.table("household_power_consumption.txt", as.is=TRUE, nrows=100000, header=TRUE,sep=";")
data <- data[(data$Date=="1/2/2007")|(data$Date=="2/2/2007"), ]
for (i in 3:9) {data[ ,i] <- as.numeric(data[ ,i])}
data$Time <- strptime(paste(as.Date(data$Date, format="%d/%m/%Y"),data$Time), format="%Y-%m-%d %H:%M:%S")
data <- data[ ,2:9]
png(file="plot2.png")
with(data, plot(x=Time, y=Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = " "))
dev.off()