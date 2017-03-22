## Reading my data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows= 2075260, stringsAsFactors = FALSE, na.strings= "?")

## Subsetting my data according to the desired Dates
subdata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

## Converting to Date format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

## Create our new DateTime variable containing the combined Date and time to the appropriate format
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$DateTime <- as.POSIXct(subdata$DateTime)

## Opening .png device and creating our plots
png("plot3.png", width = 480, height = 480)
with(subdata, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(subdata, lines(Sub_metering_2 ~ DateTime, col = "Red"))
with(subdata, lines(Sub_metering_3 ~ DateTime, col = "Blue"))

## Putting our labels
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))

## Closing our device to generate our plot.png
dev.off()