#load data base
cousera1 <- read.csv("household_power_consumption.txt", na.strings = "?", header = TRUE)
#subseting both dates using "|" and changing from character to date
newsub <- subset(cousera1, cousera1$Date == "1/2/2007" | cousera1$Date == "2/2/2007", )
as.Date(newsub$Date, format = "%d/%m/%Y")
#making graph info as numerical
globalactivepower <- as.numeric(newsub$Global_active_power)
#creation of graph
png("plot1.2.png", width = 480, height = 480)
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
