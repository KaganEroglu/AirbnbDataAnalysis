install.packages('ggplot2')
library(ggplot2)
sum(is.na(NAdata))
datap <- na.omit(datap)  

install.packages('ggplot2')
library(ggplot2)

datap <- na.omit(AB_NYC_2019)  


#ONE VARIABLE PRICE  ~ ROOM TYPE

qplot(x=price, data=datap,
      xlab="Price in Dollars", 
      ylab="Number of Houses",
      geom="histogram",
      binwidth=10,
      fill=I("pink"), 
      col=I("black")) +
  scale_x_continuous(limits=c(0,500),breaks= seq(0,500,50)) +
  scale_y_continuous(breaks=seq(0,3000,100)) +
  facet_wrap(~room_type)


#ONE VARIABLE NUMBER OF REVIEWS

qplot(x=number_of_reviews, data=datap,
      xlab="Number Of Reviews", 
      ylab="Number of Houses",
      geom="histogram",
      binwidth=10,
      fill=I("green"), 
      col=I("black")) +
  scale_x_continuous(limits=c(0,300),breaks= seq(0,300,50))


#ONE VARIABLE MINIMUM NIGHT

qplot(x=minimum_nights, data=datap,
      xlab="min night", 
      ylab="Number of Houses",
      geom="histogram",
      binwidth=1,
      fill=I("blue"), 
      col=I("black")) + 
  scale_x_continuous(limits=c(0,75))


#TWO VARIABLE - NEIGHBOURHOOD GROUP / PRICE

qplot(x=neighbourhood_group,y=price, data = datap) +
  geom_boxplot(fill="gold") +
  coord_cartesian(ylim = c(0,284))


#TWO VARIABLE - REVIEWS PER MONTH / PRICE

qplot(x=price, y=reviews_per_month,data=datap) +
  geom_jitter(alpha=1/100,color='pink') +
  scale_x_continuous(limits=c(0,1500),breaks=seq(0,1500,50))+
  scale_y_continuous(limits = c(0,25))


#TWO VARIABLE - NUMBER OF REVIEWS / MINIMUM NIGHT

qplot(x=minimum_nights, y=number_of_reviews,data=datap)+
  geom_jitter(alpha=1/20,color='orange')+
  scale_x_continuous(limits=c(0,500))