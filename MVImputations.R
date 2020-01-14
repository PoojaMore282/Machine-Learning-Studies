library(imputeTS)

# Create a short example time series with missing values
x <- ts(c(1, 2, 3, 4, 5, 5, 7, 8, NA, NA, 11, 12,4,6,8))

# Impute the missing values with na\_mean
round(na_mean(x),2)

# Impute the missing values with na\_mean using option median
na_mean(x, option="median")

# Impute the missing values with na\_mean using option mode
na_mean(x, option="mode")

# Impute the missing values with linear interpolation
na_interpolation(x,option="linear")

# Impute the missing values with spline interpolation
round(na_interpolation(x,option="spline"),2)

# Impute the missing values with na\_interpolation
na_interpolation(x,option="stine")

# Impute the missing values with na_kalman
# (tsAirgap is an example time series provided by the imputeTS package)
imp <- na_kalman(tsAirgap)
View(tsAirgap)

#Code for visualization
plotNA.imputations(tsAirgap,imp, tsAirgapComplete)

# Example Code 'plotNA.distribution'
# (tsAirgap is an example time series provided by the imputeTS package)
# Visualize the missing values in this time series
plotNA.distribution(tsAirgap)

# Example Code 'plotNA.distributionBar'
# (tsHeating is an example time series provided by the imputeTS package)
# Visualize the missing values in this time series
View(tsHeating)
plotNA.distributionBar(tsHeating, breaks = 20)

#Example Code 'plotNA.imputations'
# (tsAirgap is an example time series provided by the imputeTS package)
# Step 1: Perform imputation for x using na\_mean
tsAirgap.imp <- na_mean(tsAirgap)
View(tsAirgap.imp)
# Step 2: Visualize the imputed values in the time series
plotNA.imputations(tsAirgap, tsAirgap.imp)



###################################################################
#FINAL
##################################################################
library(forecast)

#To view original dataset as provided in the package
tsAirgap

#Converting the dataset into dataframe 
air<-data.frame(values=tsAirgap)

#To view summary of the missing values in the dataset
statsNA(tsAirgap)

vector_na=c(5,9,21,23,66,87,88,89,107,111,132,137)
vector_na

#To plot the distribution of missing values in the dataset
plotNA.distribution(tsAirgap)

#Assigning the 'tsAirgapComplete' dataset as the actual values in our dataframe
air$Actual<-tsAirgapComplete

#==========MEAN IMPUTATION===================#
#Creating new column in the dataframe for mean imputation
air$Mean=round(na_mean(air$values),2)

#Ploting the time series with imputed values
plotNA.imputations(tsAirgap,air$Mean)

#Ploting the time series with imputed as well as the actual values 
plotNA.imputations(tsAirgap,air$Mean,tsAirgapComplete)
#accuracy(air$Mean,tsAirgapComplete,test=TRUE)

#==========MEDIAN IMPUTATION===================#
#Creating new column in the dataframe for mean imputation
air$median=round(na_mean(air$values,option="median"),2)

#Ploting the time series with imputed values
plotNA.imputations(tsAirgap,air$median)
#accuracy(air$median,tsAirgapComplete,test=TRUE)

#==========MODE IMPUTATION===================#
#Creating new column in the dataframe for mean imputation
air$Mode=round(na_mean(air$values,option="mode"),2)

#Ploting the time series with imputed values
plotNA.imputations(tsAirgap,air$Mode)
#accuracy(air$Linear,tsAirgapComplete,test=TRUE)

#==========LINEAR INTERPOLATION===================#
#Creating new column in the dataframe for mean imputation
air$Linear=round(na_interpolation(air$values,option="linear"),2)

#Ploting the time series with imputed as well as the actual values 
plotNA.imputations(tsAirgap,air$Linear,tsAirgapComplete)
accuracy(air$Linear,tsAirgapComplete,test=TRUE)
#accuracy(air$Linear,tsAirgapComplete, test =is.na(air$values))

#==========SPLINE INTERPOLATION===================#
#Creating new column in the dataframe for mean imputation
air$Spline=round(na_interpolation(air$values,option="spline"),2)

#Ploting the time series with imputed as well as the actual values 
plotNA.imputations(tsAirgap,air$Spline,tsAirgapComplete)
accuracy(air$Linear,tsAirgapComplete,test=TRUE)

#==========STINE INTERPOLATION===================#
#Creating new column in the dataframe for mean imputation
air$Stine=round(na_interpolation(air$values,option="stine"),2)

#Ploting the time series with imputed as well as the actual values 
plotNA.imputations(tsAirgap,air$Stine,tsAirgapComplete)

#==========KALMAN SMOOTHING INTERPOLATION===================#
#Creating new column in the dataframe for mean imputation
air$kalman=round(na_kalman(air$values),2)

#Ploting the time series with imputed as well as the actual values 
plotNA.imputations(tsAirgap,air$kalman,tsAirgapComplete)

#==========SEADEC INTERPOLATION===================#
#Creating new column in the dataframe for mean imputation
air$Seadec=round(na_seadec(air$values),2)

#Ploting the time series with imputed as well as the actual values 
plotNA.imputations(tsAirgap,air$Seadec,tsAirgapComplete)

#storing the dataframe into '.csv' into the current direcrtory
write.csv(air,"TSAirGap.csv")


############################################################
