mydata <-read.table(file="C:/Users/zeineb.aljene/Desktop/DOC FOR/household.txt",sep=";", dec=".",header=TRUE,stringsAsFactors=FALSE)
DATA<-subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
#PLOT 1
DATA$Global_active_power<-as.numeric(DATA$Global_active_power)
png("C:/Users/zeineb.aljene/Desktop/DOC FOR/plot1.png", width=480, height=480)
hist(DATA$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
