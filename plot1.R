NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

years <- c(1999,2002,2005,2008)

emissionsByYear <- lapply(years, function(yearArg) {sum(NEI[NEI$year==yearArg,]$Emissions)})

plot(years, emissionsByYear, xlab = "Year", ylab = "Emissions per year")
lines(years, emissionsByYear)
dev.copy(png, file="plot1.png")
dev.off()