set.seed(1101)
setwd("../data")
#PartI
data = read.csv("diabetes-dataset.csv")
head(data)
attach(data)
#calculating the correlation of the response variable and the input variables
cor(Diabetes_binary,data[,-Diabetes_binary])
#drop insignificant input variables
data=data[,c("Diabetes_binary",'HighBP',"HighChol","BMI","HeartDiseaseorAttack","GenHlth","DiffWalk",'Age','Income','PhysHlth')]

#PartII
#Naive Bayes model
library(e1071)
#change data types

data$Diabetes_binary=as.factor(data$Diabetes_binary)
n_folds=5
str(data)
#Separating the data into two subsets based on the "Diabetes_binary" variable:

data1=data[Diabetes_binary==0,]
data2=data[Diabetes_binary==1,]

#Generating random fold assignments for two sets of folds, folds_j_1 and folds_j_2:
folds_j_1 <- sample(rep(1:n_folds, length.out = table(Diabetes_binary)[1] ))  
folds_j_2 <- sample(rep(1:n_folds, length.out = table(Diabetes_binary)[1] )) 


#Initializing an empty vector acc to store accuracy values for each fold:
acc=numeric(n_folds)
#Implementing loop for cross-validation:
##The outer loop (indexed by j) iterates over each fold.

for (j in 1:n_folds) {

  test1 <- which(folds_j_1 == j)
  test2 <- which(folds_j_2 == j)

  
  train = rbind(data1[ -test1, ], data2[ -test2, ])
  test = rbind(data1[test1,], data2[test2,] )

M1 <- naiveBayes(Diabetes_binary ~ ., train)
results <- predict(M1,test[,-1],type =  "class")
acc[j]=mean(test[,1] == results)
  }

mean(acc)

#knn model
data<-read.csv("diabetes_5050.csv")
data=data[,c("HighBP","HighChol","BMI","HeartDiseaseorAttack","GenHlth","DiffWalk",'Age','Income','PhysHlth')]
library(class)
n_folds=5
K = 20
#Separating the data into feature matrix X and response variable Y

#Generating random fold assignments for two sets of folds, folds_j_1 and folds_j_2:
folds_j_1 <- sample(rep(1:n_folds, length.out = table(Diabetes_binary)[1] ))  
folds_j_2 <- sample(rep(1:n_folds, length.out = table(Diabetes_binary)[1] )) 

#Separating the data into two subsets based on the "Diabetes_binary" variable:
data1=data[Diabetes_binary==0,]
data2=data[Diabetes_binary==1,]

#Initializing empty vectors store accuracy values for each fold:
acc=numeric(n_folds)
accuracy=numeric(K)
#Implementing nested loops for cross-validation:
###The outermost loop(indexed by i) iterates over each fold.
##The outer loop (indexed by j)  iterates over the sub-folds.
for (i in 1:K){
  for (j in 1:n_folds) {
    test1 <- which(folds_j_1 == j)
    test2 <- which(folds_j_2 == j)
    
    test<-rbind(data1[test1,],data2[test2,])
    train<-rbind(data1[-test1,],data2[-test2,])

    pred <- knn(train=scale(train[,-1]), test=scale(test[,-1]), cl=train[,1], k=i) 
    acc[j]=mean(test[,1] == pred) 
    }
    accuracy[i]=mean(acc) 
}
max(accuracy)
plot(x=1:20,accuracy,xlab="k")
index = which(accuracy == max(accuracy))
abline(v=index,col="red")
index