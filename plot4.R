#Read the data
thedata <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")
#Grouped the data about the coal emissions
coal_cases <- classification[grepl("Coal",classification$Short.Name),] 
coal_data <- thedata[ thedata$SCC %in% coal_cases$SCC,] 
#Summed the Coal Emissions up by year and then divided it by 100 to make y axis more easily understood
coal_sum_data <- aggregate(Emissions ~ year, data = coal_data, FUN = sum)
coal_sum_data$Emissions <- coal_sum_data$Emissions/100
#Created the plot using ggplot
coal_plot <- ggplot(data = coal_sum_data, aes(year, Emissions))
coal_plot + geom_point(size = 3.5) + geom_line(color = "blue", size = 0.5)
coal_plot <- coal_plot + geom_point(size = 3.5) + geom_line(color = "blue", size = 0.5)

coal_plot
#Saved the ggplot as an png
ggsave("plot4.png")