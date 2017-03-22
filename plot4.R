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
png("plot4.png", width = 480, height = 480)

## Divide our screen in 4 squares by column
par(mfcol = c(2,2))
with(subdata, plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = ""))
with(subdata, plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = ""))
with(subdata, lines(Sub_metering_2 ~ DateTime, col = "Red"))
with(subdata, lines(Sub_metering_3 ~ DateTime, col = "Blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black", "red", "blue"))
with(subdata, plot(Voltage ~ DateTime, xlab = "datetime", ylab = "Voltage", type = "l"))
with(subdata, plot(Global_reactive_power ~ DateTime, xlab = "datetime", type = "l"))

## Closing our device to generate our plot.png
dev.off()