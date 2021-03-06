
#IMPORTED THE DATA AS AB_NYC_2019

datap <- na.omit(AB_NYC_2019)  

#TRANSFORMING ROOM TYPE AND NEIGHBOURHOOD GROUPS TO BINARY VALUES

dataproom <- model.matrix(~room_type-1, data = datap)
datap3 <- cbind(datap[,c(10:12,14:16)],dataproom)

datapneighb_g <- model.matrix(~neighbourhood_group-1, data = datap)
datap4 <- cbind(datap3,datapneighb_g)

ourmodel <- lm(price ~ . ,  data=datap4)
summary(ourmodel)

logmodel <- lm(log10(price+1) ~ . ,  data=datap4)
summary(logmodel)

stepmodel <- step(logmodel, direction="both")

improvedmodel <- lm(log10(price + 1) ~ minimum_nights + number_of_reviews + availability_365 + 
                      `room_typeEntire home/apt` + `room_typePrivate room` + neighbourhood_groupBrooklyn + 
                      neighbourhood_groupManhattan + neighbourhood_groupQueens, data=datap4)

summary(improvedmodel)


#Correlation Matrix for the continuous variables
cor(datap[, c(10:12,14:16)])


