library('dplyr')
library('ggplot2')
#NEI <- readRDS("summarySCC_PM25.rds")
#strSCC <- readRDS("Source_Classification_Code.rds")

strSCC_Coal <- strSCC[grep("Coal", strSCC$EI.Sector), ]

NEI_SCC_Coal <- merge(NEI, strSCC_Coal)

Coal_sources <- NEI_SCC_Coal %>%
        group_by(year) %>%
        summarize(Emissions = sum(Emissions))


plot <- ggplot(Coal_sources, aes(x=year,y=Emissions)) + xlab("Year") + ylab("Emissions (tons)") +
        geom_line() + ggtitle(expression("PM"[2.5]*" Emission from Coal Combustion across the United States"))
print(plot)
dev.copy(png, file="plot4.png")
dev.off()