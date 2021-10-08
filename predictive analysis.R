#import data set 
df <- read.csv("~/R FILES/predictive analysis/breast-cancer-wisconsin.data", header=FALSE)

#display the structure of dataset
str(df)

#label the data set 
names(df)<- c("id","Clump Thickness","Uniformity_of_Cell_Size","Uniformity_of_cell_Shape","Marginal_Adhesion","Single_Epithelial_Cell_Size","Bare_Nuclei","Bland_Chromatin","Normal_Nucleoli","Mitoses","Class")

str(df)

#data preparation
df$id<- NULL
str(df)

#converting data into numaric format 
df$Bare_Nuclei<- as.numeric(df$Bare_Nuclei)
str(df)

#rows without missing values
df <- df[complete.cases(df),]
str(df)

#transfer classes of 2 and 4 into benign and malignant
df$Class<- factor(ifelse(df$Class ==2 , "benign" , "malignant"))
str(df)

#building the model 
#data spliting 
traindata = df[1:480 , 1:9]
testdata = df[481:683 , 1:9]

# testing data set 
training_data_outcome = df[1:480 , 10]
test_data_outcome = df[481:683 , 10]

#apply KNN algorithm to traing dataset
library(class)
prediction = knn(train = traindata , cl = training_data_outcome , k = 21 , test = testdata)

#display predictions
prediction

#model evaluation
table(test_data_outcome , prediction)

#findong the accuracy 
acutal_prediction = data.frame(cbind(actuals = test_data_outcome , predicted = prediction))
correlation_accurascy = cor(acutal_prediction)
head(acutal_prediction)
