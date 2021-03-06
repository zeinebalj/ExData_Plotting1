mydata <-read.table(file="C:/Users/zeineb.aljene/Desktop/DOC FOR/household.txt",sep=";", dec=".",header=TRUE,stringsAsFactors=FALSE)
DATA<-subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
DATA$Sub_metering_1=as.numeric(DATA$Sub_metering_1)
DATA$Sub_metering_2=as.numeric(DATA$Sub_metering_2)
DATA$Sub_metering_3=as.numeric(DATA$Sub_metering_3)
datetime <- strptime(paste(DATA$Date, DATA$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
DATA=cbind(DATA,datetime)
# PLOT3
png("C:/Users/zeineb.aljene/Desktop/DOC FOR/plot3.png", width=480, height=480)
plot(x=DATA$datetime,y = DATA$Sub_metering_1,type='l',ylab="Energy Sub meeting",xlab="",col="Black")
lines(x=DATA$datetime,y=DATA$Sub_metering_2,type="l",col="red")
lines(x=DATA$datetime,y=DATA$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
dev.off()
