# Exploratory Data Analysis Course Project 1
# Scrtips to create plot3.png

setwd("C:/WorkSpace/DS/C4W1/ExData_Plotting1")

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download_file = "./household_power_consumption.zip"

if (!file.exists("./household_power_consumption.txt")) {
    download.file(url, destfile = download_file)
    unzip(download_file)
    file.remove(download_file)
}

# load in package dplyr
library(dplyr)

# read in the file
df <- read.table(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")

# select only data for the dates 2007-02-01 and 2007-02-02
df1 <- filter(df, df$Date %in% c("1/2/2007", "2/2/2007"))

# open a png file
png(file = "plot3.png", width = 480, height = 480, units = "px")

# create a plot for Sub_metering_1 vs datetime
plot(strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), df1$Sub_metering_1, type="l", col = "black", xlab="", ylab = "Energy sub metering")

# add points for Sub_metering_2
points(strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), df1$Sub_metering_2, type="l", col = "red", xlab="", ylab = "")

# add points for Sub_metering_3
points(strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S"), df1$Sub_metering_3, type="l", col = "blue", xlab="", ylab = "")

# add legend 
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)

# close the file
dev.off()
              
              
              
              