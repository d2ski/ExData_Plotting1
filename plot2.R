# setting locale for correct days display
Sys.setlocale("LC_TIME","English_United States.1252")

# reading data 2880 rows from 66637 line, which corresponds to the dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?",
                colClasses = c("character", "character", "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric", "numeric"),
                               skip = 66637, nrows = 2880)
names(data) <- c("date", "time", "globalactivepower", "globalreactivepower", "voltage",
                 "globalintensity", "submetering1", "submetering2", "submetering3")

# adding new var datetime, converting chars to time object
data$datetime <- paste(data$date, data$time)
data$date <- as.Date(data$date, format = "%d/%m/%Y")
data$time <- strptime(data$time, "%H:%M:%S")
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

# constructing plot to png file
png(file = "plot2.png")
par(mfrow = c(1,1))

plot(data$datetime, data$globalactivepower, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(data$datetime, data$globalactivepower)

dev.off()