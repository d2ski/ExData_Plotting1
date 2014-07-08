data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?",
                colClasses = c("character", "character", "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric", "numeric"),
                               skip = 66637, nrows = 2880)
names(data) <- c("date", "time", "globalactivepower", "globalreactivepower", "voltage",
                 "globalintensity", "submetering1", "submetering2", "submetering3")


data$datetime <- paste(data$date, data$time)
data$date <- as.Date(data$date, format = "%d/%m/%Y")
data$time <- strptime(data$time, "%H:%M:%S")
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

plot(data$datetime, data$globalactivepower, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(data$datetime, data$globalactivepower)

dev.copy(png, file = "plot2.png")
dev.off()