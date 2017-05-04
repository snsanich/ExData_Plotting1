# upload file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
unzip('household_power_consumption.zip')

# load and filter data
data <- read.csv('household_power_consumption.txt',na.strings='?',sep=';',stringsAsFactors=FALSE)
february <- with(data, data[Date == '1/2/2007' | Date == '2/2/2007',])

# add datetime
february$DateTime <- with(february, strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

# create graph 2
png(filename = "plot2.png", width=480, height=480)
with(february, plot(DateTime, Global_active_power, type='n', xlab="", ylab="Global Active Power (kilowatts)"))
with(february, lines(DateTime, Global_active_power))
dev.off()
