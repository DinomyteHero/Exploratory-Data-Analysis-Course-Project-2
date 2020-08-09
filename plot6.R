#Read the data
thedata <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")

#Created an subset for data that was from LA County and Baltimore and was from a motor vehicle
LA_BT <- subset(thedata , fips == "06037" | fips == "24510" & type == "ON-ROAD")
#Summed up all of the Emissions that was caused by cars in LA County
LABT_sum <- aggregate(Emissions ~ year + fips, data = LA_BT, sum)
#Tidyed up the fips column and changed it's name to "City
LABT_sum$fips[LABT_sum$fips=="06037"] <- "Los Angeles County, CA"

LABT_sum$fips[LABT_sum$fips=="24510"] <- "Baltimore City, MD"

colnames(LABT_sum) = c("Year", "City", "Emissions")
#Created a ggplot
LABT_plot <- ggplot(data = LABT_sum, aes(Year, Emissions, color = City))
LABT_plot <- LABT_plot + geom_line(size = 1.4) + geom_point(size = 2.3) + labs(title = "Baltimore and LA County by Car Emissions")
LABT_plot
#Saved the plot as an png file
ggsave("plot6.png")