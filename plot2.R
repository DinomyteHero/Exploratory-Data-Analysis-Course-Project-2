#Read the data
thedata <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")
#Created an subset for data that was only from Baltimore
Baltimoredata <- subset(thedata, fips == "24510")
#Used sum on the data extracted from only Baltimore
decreasedata <- aggregate(Emissions ~ year, Baltimoredata, sum)
#Saved the plot as png
png("plot2.png")
barplot(decreasedata$Emissions, names.arg =  decreasedata$year, xlab = "Year", ylab = "Number of Emissions", main = "Number of Emissions per year", col = c("Maroon", "Orange", "Light Blue", "Light Green"))
dev.off()