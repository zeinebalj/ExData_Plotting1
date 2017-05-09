mydata <-read.table(file="C:/Users/zeineb.aljene/Desktop/DOC FOR/household.txt",sep=";", dec=".",header=TRUE,stringsAsFactors=FALSE)
DATA<-subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
DATA$Global_active_power<-as.numeric(DATA$Global_active_power)
datetime <- strptime(paste(DATA$Date, DATA$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
DATA=cbind(DATA,datetime)
# PLOT2
png("C:/Users/zeineb.aljene/Desktop/DOC FOR/plot2.png", width=480, height=480)
plot(y = DATA$Global_active_power,x=datetime,type='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()