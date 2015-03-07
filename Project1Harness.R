## Source File for Project 1 of Exploratory Data Analysis

## Clean up before starting
## Remove all environmental data rm(list=ls())
## Set directory context setwd("~/Documents/DropBox-AGR//Dropbox/Git//coursera//Exploratory//Project1/ExData_Plotting1/")
## Verify your workign directory
getwd()

## Download the necessary file if necessary
if (!file.exists("Project1.zip")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, destfile="Project1.zip", method="curl")
  ## Verify that the file exists
  #list.files()
  
  ## Unzip the file
  unzip(zipfile = "Project1.zip")
  
  ## Verify that the unzipped file exists
 # list.files()
}



## Read the data file. We know that there is a header, with separator of ";", and that NA is represented as a "?"
data <- read.table(file= "household_power_consumption.txt",sep = ";",header = TRUE, na.strings = "?")

## Convert Date and Time using as.Date() and strptime() functions
data$Date <- as.Date(data$Date, "%d/%m/%Y");
data$Time <- strptime(data$Time, "%T");

## Make sure that the data made it 
# str(data)

## Take a subset of the 2 dates as per instructions
subdata <- subset(x = data, subset = ((data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02"))))

