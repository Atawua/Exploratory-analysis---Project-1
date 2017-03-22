## Reading my data
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows= 2075260, stringsAsFactors = FALSE, na.strings= "?")

## Subsetting my data according to the desired Dates
subdata <- mydata[mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007",]

## Converting to Date format
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")

## Opening .png device and creating our histogram 
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## Closing our device to generate our plot.png
dev.off()