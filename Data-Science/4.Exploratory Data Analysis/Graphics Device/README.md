Exploratory Data Analysis
========================================================

Purpose 
-----------------

Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.


Requirements
-----------------
For each plot you should:

Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

Name each of the plot files as plot1.png, plot2.png, etc.

Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)


Dataset
-----------------
This assignment uses data from the UC Irvine Machine Learning Repository(http://archive.ics.uci.edu/ml/), a popular repository for machine learning datasets. 
In particular, we will be using the “Individual household electric power consumption Data Set”(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip).

## Description
Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
The dataset has 2,075,259 rows and 9 columns. We will only be using data from the dates 2007-02-01 and 2007-02-02.

## Variable Descriptions

| Variable | Description
-----------|-------------
| Date | Date in format dd/mm/yyyy
| Time | time in format hh:mm:ss
| Global_active_power | household global minute-averaged active power (in kilowatt)
| Global_reactive_power | household global minute-averaged reactive power (in kilowatt)
| Voltage | minute-averaged voltage (in volt)
| Global_intensity | household global minute-averaged current intensity (in ampere)
| Sub_metering_1 | energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
| Sub_metering_2 | energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
| Sub_metering_3 | energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.