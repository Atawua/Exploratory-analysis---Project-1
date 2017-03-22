## Reading my data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows= 2075260, stringsAsFactors = FALSE, na.strings= "?")

## Subsetting my data according to the desired Dates
subdata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

## Converting to Date format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

## Create our new DateTime variable containing the combined Date and time to the appropriate format
subdata$DateTime <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$DateTime <- as.POSIXct(subdata$DateTime)

## Opening .png device and plot 
png("plot2.png", width = 480, height = 480)
with(subdata, plot(Global_active_power ~ DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

## Closing our device to generate our plot.png
dev.off()