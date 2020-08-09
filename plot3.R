#Read the data
thedata <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")
#Created a subset of Baltimore data 
Baltimoredata <- subset(thedata, fips == "24510")
#Summed all of the Emissions by year and type
Balti_sum <- aggregate(Emissions ~ year + type, Baltimoredata, sum)
#Created the ggplot from the data
myplot3 <- ggplot(data = Balti_sum, aes(year, Emissions, color = type))

myplot3 <- myplot3 + geom_point() + geom_line() + labs(x = "Year", y = "Total Emissions", title = "Total Baltimore Emissions by type from 1999 to 2008")

myplot3
#Saved the ggplot as an png file
ggsave("plot3.png")