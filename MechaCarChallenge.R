#DELIVERABLE-1
#Use the library() function to load the dplyr package.
library(tidyverse)

#Import and read in the MechaCar_mpg.csv file as a dataframe
mechacar=read_csv('MechaCar_mpg.csv')


#Perform linear regression using the lm() function. In the lm() function, pass in all six variables 
#(i.e., columns), and add the dataframe you created in Step 4 as the data parameter.
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mechacar)

#Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(vehicle_length~vehicle_weight+spoiler_angle+ground_clearance+AWD+mpg,data=mechacar))



#DELIVERABLE-2

#In your MechaCarChallenge.RScript, import and read in the Suspension_Coil.csv file as a table.
suspension_coil <- read_csv('Suspension_Coil.csv')
head(suspension_coil)

#Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, 
#variance, and standard deviation of the suspension coil’s PSI column.

total_summary <- suspension_coil%>%summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
total_summary

#Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot 
#by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_coil%>%group_by(Manufacturing_Lot)%>%summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')
lot_summary

#Deliverable-3

#In your MechaCarChallenge.RScript, write an RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically 
#different from the population mean of 1,500 pounds per square inch.
t.test(suspension_coil$PSI,mu=1500)

#Next, write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each 
#manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot1")$PSI,mu=1500)
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot2")$PSI,mu=1500)
t.test(subset(suspension_coil,Manufacturing_Lot=="Lot3")$PSI,mu=1500)



