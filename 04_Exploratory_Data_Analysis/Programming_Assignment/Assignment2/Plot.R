# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/25/2018

#Plot 1

#Get Data
setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


total_emission <- tapply(NEI$Emissions, NEI$year, sum)
plot(c(1999,2002,2005,2008), total_emission, 
     type='l',
     ylab = "Total PM2.5 Emissions (10^6 Tons)",
     xlab = "Year",
     main = "Total PM2.5 Emissions From All US Sources"
     )

dev.copy(png,'../Programming_Assignment/Assignment2/Plot1.png', height=480, width=480)
dev.off()


#Plot 2
#Get Data
setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total_emission.baltimore <- with(NEI, tapply(Emissions[fips == "24510"], year[fips == "24510"], sum))
plot(c(1999,2002,2005,2008), total_emission.baltimore,
     type='l',
     ylab = "Total PM2.5 Emissions (10^6 Tons)",
     xlab = "Year",
     main = "Total PM2.5 Emissions From All Baltimore City Sources"
)
dev.copy(png,'../Programming_Assignment/Assignment2/Plot2.png', height=480, width=480)
dev.off()

#Plot 3
#Get Data
setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

baltimore.dat <- with(NEI[NEI$fips == "24510",], tapply(Emissions, list(year, type), sum))
plot_dat <- melt(baltimore.dat, id.vars="year")
colnames(plot_dat)[2] <- "EmissionType"
ggplot(plot_dat, aes(Var1,value, col=EmissionType)) + 
  geom_point() + 
  stat_smooth() +
  labs(title = "Emissions, Baltimore City 1999-2008 by Source Type") +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)"))

dev.copy(png,'../Programming_Assignment/Assignment2/Plot3.png', height=480, width=480)
dev.off()

#Plot 4
#Get Data
setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
total_emission.coal <- tapply(NEI$Emissions[NEI$SCC == "10100101"], NEI$year[NEI$SCC == "10100101"], sum)
plot(c(1999,2002,2005,2008), total_emission.coal,
  type='l',
  ylab = "Total PM2.5 Emissions (10^6 Tons)",
  xlab = "Year",
  main = "Total US PM2.5 Coal Emissions from 1999-2008"
)
dev.copy(png,'../Programming_Assignment/Assignment2/Plot4.png', height=480, width=480)
dev.off()

#Plot 5
#Get Data
setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCmotor <- SCC[motor,]$SCC
NEImotor <- NEI[NEI$SCC %in% SCCmotor,]
total_emission.baltimore <- with(NEImotor[NEImotor$fips == "24510",], tapply(Emissions, year, sum))
plot(c(1999,2002,2005,2008), total_emission.baltimore,
     type='l',
     ylab = "Total PM2.5 Emissions (10^6 Tons)",
     xlab = "Year",
     main = "Total Baltimore PM2.5 Motor Emissions from 1999-2008"
) 
dev.copy(png,'../Programming_Assignment/Assignment2/Plot5.png', height=480, width=480)
dev.off()

#Plot6
#Get Data
setwd("C:/git/datasciencecoursera/04_Exploratory-Data-Analysis/Dataset")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCmotor <- SCC[motor,]$SCC
NEImotor <- NEI[NEI$SCC %in% SCCmotor,]
total_emission.comparison <- with(NEImotor[NEImotor$fips == "24510" | NEImotor$fips == "06037",], tapply(Emissions, list(year,fips), sum))
plot_dat <- melt(total_emission.comparison, id.vars="years")
City <- ifelse(plot_dat$Var2==6037,"Baltimore","Los Angeles County")
plot_dat <- cbind(city, plot_dat)
ggplot(plot_dat, aes(Var1,value, col=city)) + 
  geom_point() + 
  stat_smooth() +
  labs(title = "Total Baltimore & LA PM2.5 Motor Emissions from 1999-2008") +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)"))
dev.copy(png,'../Programming_Assignment/Assignment2/Plot6.png', height=480, width=480)
dev.off()


