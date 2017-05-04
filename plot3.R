# upload file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
unzip('household_power_consumption.zip')

# load and filter data
data <- read.csv('household_power_consumption.txt',na.strings='?',sep=';',stringsAsFactors=FALSE)
february <- with(data, data[Date == '1/2/2007' | Date == '2/2/2007',])

# add datetime
february$DateTime <- with(february, strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

# create graph 3
png(filename = "plot3.png", width=480, height=480)
with(february, plot(DateTime, Sub_metering_1, type='n', xlab="", ylab="Energy sub metering"))
with(february, lines(DateTime, Sub_metering_1, col="black"))
with(february, lines(DateTime, Sub_metering_2, col="red"))
with(february, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c('black', 'red', 'blue'))
dev.off()
