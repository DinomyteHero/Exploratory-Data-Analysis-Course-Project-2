#Read the data
thedata <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")
#Created a sum of the total emissions per year
yearly_total <- aggregate(Emissions ~ year, data = thedata, FUN = sum)
#Saved the plot as an png file
png("plot1.png")
barplot(height = yearly_total$Emissions/100, names.arg = yearly_total$year, xlab = "Years", ylab = "Number of Emissions", main = "Overall Emissions by Year", col = c("Black", "Purple", "Blue", "Green"))
dev.off()
