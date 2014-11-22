library('dplyr')
library('ggplot2')
NEI <- readRDS("summarySCC_PM25.rds")
strSCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI %>%
        filter(fips == 24510) %>%
        group_by(year,type) %>%
        summarize(Emissions = sum(Emissions))

plot <- ggplot(baltimore, aes(x=year,y=Emissions, colour = type)) + xlab("Year") + ylab("Emissions (tons)") +
        geom_line() + ggtitle(expression("PM"[2.5]*" Emission by Type in Baltimore City (MD)"))
print(plot)
dev.copy(png, file="plot3.png")
dev.off()