NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- c(1999,2002,2005,2008)

emissionsByYear <- lapply(years, function(yearArg) {sum(NEI[NEI$year==yearArg & NEI$fips==24510,]$Emissions)})

plot(years, emissionsByYear, xlab = "Year", ylab = "Emissions per year (tons)", main = expression("PM"[2.5]*" Emission in Baltimore City, MD"))
lines(years, emissionsByYear)
dev.copy(png, file="plot2.png")
dev.off()