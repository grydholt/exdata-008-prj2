library('dplyr')
library('ggplot2')
#NEI <- readRDS("summarySCC_PM25.rds")
#strSCC <- readRDS("Source_Classification_Code.rds")

strSCC_Vehicle <- strSCC[grep("vehicle", strSCC$Short.Name, ignore.case = T),]

NEI_SCC_Vehicle <- merge(NEI, strSCC_Vehicle)

Vehicle_sources <- NEI_SCC_Vehicle %>%
        group_by(year) %>%
        summarize(Emissions = sum(Emissions))

plot <- ggplot(Vehicle_sources, aes(x=year,y=Emissions)) + xlab("Year") + ylab("Emissions (tons)") +
        geom_line() + ggtitle(expression("PM"[2.5]*" Emission from Motor Vehicles across the United States"))

print(plot)
dev.copy(png, file="plot5.png")
dev.off()