
## Source code for Plot1

## Check to see if the user had imported the data before, if not, import it
if (!exists("subdata")) {
  source("Project1Harness.R")
}

## Create the Device context to be rendered (480x480 px)
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## Draw a Histogram with title, with red bars, with specific X Label & added the YLIMIT just to mimic the sample
hist(subdata$Global_active_power, main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)", ylim=c(0,1200))

## Closed the device so the file resource can be released.
dev.off()