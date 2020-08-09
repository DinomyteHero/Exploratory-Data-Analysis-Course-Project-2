#Read the data
thedata <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")

#Created an subset for data that was only from Baltimore and was from a motor vehicle
Baltimoredata2 <- subset(thedata, fips == "24510" & type == "ON-ROAD")
#Summed up all of the Emissions that was caused by cars
motor_sum <- aggregate(Emissions ~ year, data = Baltimoredata2, sum)
#Created a ggplot
motor_plot <- ggplot(data = motor_sum, aes(factor(year), Emissions))

motor_plot + geom_bar(stat = "identity") + labs(x = "Year", y = "Number of Emissions", title  = "Change per year of motor vehicle emissions in Baltimore City")
#Saved the plot as png
ggsave("plot5.png")