## Source code for Plot3

## Check to see if the user had imported the data before, if not, import it
if (!exists("subdata")) {
  source("Project1Harness.R")
}

## Create the Device context to be rendered (480x480 px)
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

## Find out all "Day" boundaries by getting when Time becomes zero
xIndex <- vector()
xIndexnum <- 1
for (ind in 1:length(subdata$Time)) {
  if(difftime(subdata$Time[ind], strptime("00:00:00","%T"))== 0){
    xIndex[xIndexnum] <- ind # xLabel positions in the plot
    xIndexnum = xIndexnum + 1
  }
}

xIndex[xIndexnum] <- ind # Mark the "Max" value 

## Draw a Plot of the three Energy sub meterings.
plot(1:length(subdata$Time),subdata$Sub_metering_1, type= "l",xaxt = "n", xlab = "", ylab= "Energy sub metering")
lines(1:length(subdata$Time),subdata$Sub_metering_2, col="red")
lines(1:length(subdata$Time),subdata$Sub_metering_3, col="blue")

## Modify the Axis to show "Days" at appropriate places
axis(1,at=xIndex,labels = c("Thu", "Fri", "Sat") )

## Create the legend!
legend("topright", lty= "solid",col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Closed the device so the file resource can be released.
dev.off()
