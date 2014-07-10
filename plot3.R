Sys.setlocale("LC_TIME","English_United States.1252")


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

png(file = "plot3.png")
par(mfrow = c(1,1))

plot(data$datetime, data$submetering1, ylab = "Energy sub metering", xlab = "", type = "n")
lines(data$datetime, data$submetering1, col = "black")
lines(data$datetime, data$submetering2, col = "red")
lines(data$datetime, data$submetering3, col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()