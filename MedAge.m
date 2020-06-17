## Copyright (C) 2020 Nicola Neophytou
## Author: Nicola Neophytou
## Created: 2020-05-15

# find median Age values for each PClass 

function [medianAge] = calculateMedian (data, classColumn, ageColumn)
 
 # isolate 1st Class passengers from data 
 Class1 = data;
 # get index of data corresponding to PClass > 1
 idx = any(Class1(:,classColumn) > 1.0, 2);
 # remove these data 
 out = Class1(idx,:);
 # left only with entries of PClass = 1
 Class1(idx,:) = [];
 
 # Get median age for 1st Class passengers
 Median1_allFeatures = median(Class1);
 Median1 = Median1_allFeatures(:,ageColumn);
 
 # 2nd Class passengers
 Class2 = data;
 idx = any(Class2(:,classColumn) ~= 2.0, 2);
 out = Class2(idx,:);
 Class2(idx,:) = [];
 
 # Get median age for 2nd Class 
 Median_allFeatures = median(Class2);
 Median2 = Median_allFeatures(:,ageColumn);
 
 # 3rd Class passengers
 Class3 = data;
 idx = any(Class3(:,classColumn) < 3.0, 2);
 out = Class3(idx,:);
 Class3(idx,:) = [];
 
 # Get median age for 3rd Class 
 Median_allFeatures = median(Class3);
 Median3 = Median_allFeatures(:,ageColumn);
 
 # create vector of median values for all three Classes
 medianAge = [Median1; Median2; Median3];

endfunction
