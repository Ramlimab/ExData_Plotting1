rawdata<-read.csv('household_power_consumption.txt',sep=';',na.strings='?')

#combine first two cols into datetime column
rawdata$Datetime<-strptime(paste(rawdata$Date,rawdata$Time),format='%d/%m/%Y %H:%M:%S')

#convert first col to Date format and filter out unused rows
rawdata[[1]]<-as.Date(rawdata[[1]],format='%d/%m/%Y')
startdate<-as.Date('2007-02-01')
enddate<-as.Date('2007-02-02')
newdata<-subset(rawdata,(Date>=startdate)&(Date<=enddate))

png('plot3.png',width=480,height=480)
with(newdata, plot(Datetime,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering'))
with(newdata, lines(Datetime,Sub_metering_1,col='black'))
with(newdata, lines(Datetime,Sub_metering_2,col='red'))
with(newdata, lines(Datetime,Sub_metering_3,col='blue'))
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1))
dev.off()

