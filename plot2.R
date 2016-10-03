rawdata<-read.csv('household_power_consumption.txt',sep=';',na.strings='?')

#combine first two cols into datetime column
rawdata$Datetime<-strptime(paste(rawdata$Date,rawdata$Time),format='%d/%m/%Y %H:%M:%S')

#convert first col to Date format and filter out unused rows
rawdata[[1]]<-as.Date(rawdata[[1]],format='%d/%m/%Y')
startdate<-as.Date('2007-02-01')
enddate<-as.Date('2007-02-02')
newdata<-subset(rawdata,(Date>=startdate)&(Date<=enddate))

png('plot2.png')
with(newdata, plot(Datetime,Global_active_power,type='n',xlab='',ylab='Global Active Power (kilowatts)'))
with(newdata, lines(Datetime,Global_active_power))
dev.off()