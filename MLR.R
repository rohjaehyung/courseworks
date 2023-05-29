toyota.df <- read.csv("ToyotaCorolla.csv")
View(toyota.df)

cor(toyota.df$KM, toyota.df$Price)
cor(toyota.df$Doors, toyota.df$Price)


selected.var <- c(3, 4, 7, 8, 9, 10, 12, 13, 14, 17, 18)
car.df <- toyota.df[,selected.var]

set.seed(1)
sample(1:10, 5)

train.index <- sample(1:nrow(car.df), nrow(car.df)*0.7)

train.index

train.df <- car.df[train.index, ]
valid.df <- car.df[-train.index, ]

car.lm <- lm(Price~., data = train.df)
options(scipen = 999)
summary(car.lm)

car.lm.pred <- predict(car.lm, valid.df)
car.lm.pred


library(forecast)
accuracy(car.lm.pred, valid.df$Price)

