getwd()
#Tiene que ser a fuerzas entre""
setwd("C:/Users/j_abe/Documents/DataScienceProyects/CrimesMexico/Resources")
crime<-read.csv(file="Crime_Mexico.csv",sep="\t")
head(crime)

#Primero ver una generalización de los datos 
unique(crime$State)
unique(crime$Tipo.de.delito)
unique(crime$Year)
crime$December<-as.numeric(crime$December)

crime$EneroDiciembre<-(crime$January+crime$February+crime$March+crime$April+crime$May+crime$June+crime$July+crime$August+crime$September+crime$October+crime$November+crime$December)

x<-apply(crime, 2, function(x) length(unique(x)))
table(crime$State)
length(crime$Tipo.de.delito)


ggplot(data = crime) +
  geom_bar(mapping = aes(x =crime$Tipo.de.delito))+
  theme(axis.text.x = element_text(angle = 90, size = 10))
