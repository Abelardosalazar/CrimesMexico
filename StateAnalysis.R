#install.packages("tidyverse")
library(tidyverse)
options(digits=3)
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
crime$CrimeComplete<- with(crime, paste0(crime$Bien.jurÃ.dico.afectado,crime$Tipo.de.delito,crime$Subtipo.de.delito, crime$Modalidad))


crime<-na.omit(crime)

x<-data.frame()
x<-as.data.frame(crime$EneroDiciembre,crime$CrimeComplete)
x1<-aggregate(x, list(row.names(x)), sum)
# No hacer promedio, sacar otra cosa


g<-ggplot(x1, aes(x=`crime$EneroDiciembre`, y=Group.1)) + 
  geom_bar(stat="identity", width=1, fill="tomato3") + 
  labs(title="Ordered Bar Chart", 
       caption="source: mpg") + 
  geom_text(aes(label = `crime$EneroDiciembre`),
            hjust = -1,
            color = "black",
            size = 5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
g
ggsave('Topics_categories.png', plot = g,width = 50, height = 40, dpi = 300,limitsize = FALSE)



g<-ggplot(crime, aes(x=EneroDiciembre, y=CrimeComplete)) + 
  geom_bar(stat="identity", width=1, fill="tomato3") + 
  labs(title="Ordered Bar Chart", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") + 
  geom_text(aes(label = EneroDiciembre),
            hjust = 1.5,
            color = "black",
            size = 10) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
g
ggsave('Topics_categories.png', plot = g,width = 50, height = 40, dpi = 300,limitsize = FALSE)





l=unique(crime$CrimeComplete)
view(l)

x<-apply(crime, 2, function(x) length(unique(x)))
table(crime$State)
length(crime$Tipo.de.delito)


ggplot(data = crime) +
  geom_bar(mapping = aes(x =crime$EneroDiciembre))
