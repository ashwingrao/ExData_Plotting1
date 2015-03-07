## Source code for Plot4

## Check to see if the user had imported the data before, if not, import it
if (!exists("subdata")) {
  source("Project1Harness.R")
}

## Create the Device context to be rendered (480x480 px)
png(filename = "plot4.png",
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

draw_plot2 <- function() {
  ## Draw a Plot of Global_active_power over the Days with a YLabel & no XLabel.
  plot(x = 1:ind,y = subdata$Global_active_power, type= "l",xaxt = "n", xlab = "", ylab= "Global Active Power")
  xLabel = levels(factor(weekdays(subdata$Date)))
  
  ## Modify the Axis to show "Days" at appropriate places
  axis(1,at=xIndex,labels = c("Thu", "Fri", "Sat") )
}

draw_plot3 <- function() {
  ## Draw a Plot of the three Energy sub meterings.
  plot(1:length(subdata$Time),subdata$Sub_metering_1, type= "l",xaxt = "n", xlab = "", ylab= "Energy sub metering")
  lines(1:length(subdata$Time),subdata$Sub_metering_2, col="red")
  lines(1:length(subdata$Time),subdata$Sub_metering_3, col="blue")
  
  ## Modify the Axis to show "Days" at appropriate places
  axis(1,at=xIndex,labels = c("Thu", "Fri", "Sat") )
  ## Create the legend!
  legend("topright", lty= "solid",col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
}
draw_plot_Global_reactive_power <- function() {
  ## Draw a Plot of Global_active_power over the Days with a YLabel & no XLabel.
  plot(x = 1:ind,y = subdata$Global_reactive_power, type= "l",xaxt = "n", xlab = "datetime", ylab= "Global_reactive_power")
  xLabel = levels(factor(weekdays(subdata$Date)))
  
  ## Modify the Axis to show "Days" at appropriate places
  axis(1,at=xIndex,labels = c("Thu", "Fri", "Sat") )
}

draw_plot_voltage <- function() {
  ## Draw a Plot of Global_active_power over the Days with a YLabel & no XLabel.
  plot(x = 1:ind,y = subdata$Voltage, type= "l",xaxt = "n", xlab = "datetime", ylab= "Voltage")
  xLabel = levels(factor(weekdays(subdata$Date)))
  
  ## Modify the Axis to show "Days" at appropriate places
  axis(1,at=xIndex,labels = c("Thu", "Fri", "Sat") )
}

par(mfrow=c(2,2))

## First Row
draw_plot2()
draw_plot_voltage()

## Second Row
draw_plot3()
draw_plot_Global_reactive_power()

## Closed the device so the file resource can be released.
dev.off()
