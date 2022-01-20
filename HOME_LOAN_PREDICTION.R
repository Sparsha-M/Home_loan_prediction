#import and store the dataset in data
data <- read.csv(file.choose())
data_train <- data #duplicate the dataset
summary(data_train)
install.packages("superml", dependencies=TRUE) # to install all dependencies at once
library(superml)
label <- LabelEncoder$new()
# converting categorical variable into numeric value
data_train$Loan_Status <- label$fit_transform(data_train$Loan_Status)
data_train$Property_Area <- label$fit_transform(data_train$Property_Area)
data_train$Self_Employed <- label$fit_transform(data_train$Self_Employed)
data_train$Education<- label$fit_transform(data_train$Education)
data_train$Dependents<- label$fit_transform(data_train$Dependents)
data_train$Married<- label$fit_transform(data_train$Married)
data_train$Gender<- label$fit_transform(data_train$Gender)
data_train$Loan_ID<- label$fit_transform(data_train$Loan_ID)
pairs(data_train[,1:13])
# checking for correlation between the attributes(no autocorrelation)
cor(data_train)
################################### LINEAR REGRESSION #######################################
lm<-lm(Loan_Status ~ ., data = data_train)
summary(lm)
#loan_status=9.103e-01 + (-1.084e-04)x1 + 3.851e-02x2 + .... linear eq.
#plot
install.packages("ggplot2")
library(ggplot2)
install.packages('caTools')
library(caTools)
split = sample.split(data_train$ApplicantIncome, SplitRatio = 0.7)
trainingset = subset(data_train, split == TRUE)
testset = subset(data_train, split == FALSE)

# Fitting Simple Linear Regression to the Training set
lm.r= lm(formula = ApplicantIncome~LoanAmount,
         data = trainingset)
coef(lm.r)

# Predicting the Test set results
ypred = predict(lm.r, newdata = testset)

# Visualising the Training set results
ggplot() + geom_point(aes(x = trainingset$LoanAmount,
                          y = trainingset$ApplicantIncome), colour = 'red') +
  geom_line(aes(x = trainingset$LoanAmount,
                y = predict(lm.r, newdata = trainingset)), colour = 'blue') +
  
  ggtitle('ApplicantIncome vs LoanAmount(Training set)') +
  xlab('LoanAmount') +
  ylab('ApplicantIncome')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x = testset$LoanAmount, y = testset$ApplicantIncome),
             colour = 'red') +
  geom_line(aes(x = trainingset$LoanAmount,
                y = predict(lm.r, newdata = trainingset)),
            colour = 'blue') +
  ggtitle('ApplicantIncome vs LoanAmount (Test set)') +
  xlab('LoanAmount') +
  ylab('ApplicantIncome')

##################################### KNN CLUSTERING ####################################

install.packages("ClusterR")
install.packages("cluster")

# Loading package
library(ClusterR)
library(cluster)
X<-data_train$Dependents
Y<-data_train$Self_Employed
Z<-cbind(X,Y)
plot(Z)
summary(Z)
# let K=3
results <- kmeans(na.omit(Z),3 ,centers = 3, nstart = 20)#omit NA values
results
#cluster identification for each cluster
results$cluster
# Model Evaluation and visualization
#plot(Z)
#plot(Z, col = results$cluster)
plot(Z, col =results$cluster, 
     main = "K-means with 3 clusters")

## Plotting cluster centers
results$centers
clusplot(na.omit(Z),results$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Dependents VS Self_employed"),
         xlab = 'Dependents',
         ylab = 'Self_employed')
################################ H CLUSTERING ###########################################

# Finding distance matrix
distance <- dist(Z, method = 'euclidean')
distance

# Fitting Hierarchical clustering Model to training dataset
set.seed(5)  # Setting seed
Hierar_cl <- hclust(distance, method = "average")
Hierar_cl

# Plotting dendrogram
plot(Hierar_cl)


# Cutting tree by no. of clusters
#fit <- cutree(Hierar_cl, k = 3 )
#fit
#tapply(data_train$Loan_ID, fit ,mean)
#table(fit)
#rect.hclust(Hierar_cl, k = 3, border = "green")

     