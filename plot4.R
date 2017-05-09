mydata <-read.table(file="C:/Users/zeineb.aljene/Desktop/DOC FOR/household.txt",sep=";", dec=".",header=TRUE,stringsAsFactors=FALSE)
DATA<-subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
DATA$Sub_metering_1=as.numeric(DATA$Sub_metering_1)
DATA$Sub_metering_2=as.numeric(DATA$Sub_metering_2)
DATA$Sub_metering_3=as.numeric(DATA$Sub_metering_3)
DATA$Global_active_power<-as.numeric(DATA$Global_active_power)
DATA$Voltage<-as.numeric(DATA$Voltage)
DATA$Global_reactive_power<-as.numeric(DATA$Global_reactive_power)
datetime <- strptime(paste(DATA$Date, DATA$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
DATA=cbind(DATA,datetime)
# PLOT4

png("C:/Users/zeineb.aljene/Desktop/DOC FOR/plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(y = DATA$Global_active_power,x=datetime,type='l', ylab="Global Active Power", xlab="")

plot(y = DATA$Voltage,x=datetime,type='l', ylab="Voltage", xlab="")

plot(x=DATA$datetime,y = DATA$Sub_metering_1,type='l',ylab="Energy Submeeting",xlab="",col="Black")
lines(x=DATA$datetime,y=DATA$Sub_metering_2,type="l",col="red")
lines(x=DATA$datetime,y=DATA$Sub_metering_3,type="l",col="blue")
legend("topright",inset=0.01, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), box.lty=0,lty=1, lwd=1)

plot(y = DATA$Global_reactive_power,x=datetime,type='l', ylab="Global_reactive_power", xlab="")

dev.off()