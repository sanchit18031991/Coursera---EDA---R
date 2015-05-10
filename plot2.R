## Read main datasetma
main_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
main_data$Date <- as.Date(main_data$Date, format="%d/%m/%Y")

## Subsetby date range
data <- subset(main_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(main_data)

## date format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot graph
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()