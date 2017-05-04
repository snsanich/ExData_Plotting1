# upload file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
unzip('household_power_consumption.zip')

# load and filter data
data <- read.csv('household_power_consumption.txt',na.strings='?',sep=';',stringsAsFactors=FALSE)
february <- with(data, data[Date == '1/2/2007' | Date == '2/2/2007',])

# create graph 1
png(filename = "plot1.png", width=480, height=480)
with(february, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off()
