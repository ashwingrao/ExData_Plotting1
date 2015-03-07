## Source code for Plot2

## Check to see if the user had imported the data before, if not, import it
if (!exists("subdata")) {
  source("Project1Harness.R")
}

## Create the Device context to be rendered (480x480 px)
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")

#subdata$wd <- format(subdata$Date, "%a")

## Find out all "Day" boundaries by getting when Time becomes zero
xIndex <- vector()
xIndexnum <- 1
for (ind in 1:length(subdata$Time)) {
  if(difftime(subdata$Time[ind], strptime("00:00:00","%T"))== 0){
    xIndex[xIndexnum] <- ind # xLabel positions in the plot
    xIndexnum = xIndexnum + 1
  }
}
# myFunc <- function(x) {
#   difftime(x, strptime("00:00:00","%T")) == 0
# }
# 
# sapply(subdata$Time, myFunc)

xIndex[xIndexnum] <- ind # Mark the "Max" value 

## Draw a Plot of Global_active_power over the Days with a YLabel & no XLabel.
plot(x = 1:ind,y = subdata$Global_active_power, type= "l",xaxt = "n", xlab = "", ylab= "Global Active Power (kilowatts)")
xLabel = levels(factor(weekdays(subdata$Date)))

## Modify the Axis to show "Days" at appropriate places
axis(1,at=xIndex,labels = c("Thu", "Fri", "Sat") )

## Closed the device so the file resource can be released.
dev.off()
