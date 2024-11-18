% USER DEFINED FUNCTION TO CALCULATE DESCRIPTIVE STATISTICS
function stat = desc_stat(data)
% Calculating Minimum value
stat(1,1) = "Minimum"; stat(1,2) = min(data);
% Calculating 1st Quartile 
stat(2,1) = "1st Quartile"; stat(2,2) = prctile(data, 25);
% Calculating Median
stat(3,1) = "Median"; stat(3,2) = median(data);
% Calculating Mean
stat(4,1) = "Mean"; stat(4,2) = mean(data);
% Calculating 3rd Quartile
stat(5,1) = "3rd Quartile"; stat(5,2) = prctile(data, 75);
% Calculating Maximum value
stat(6,1) = "Maximum"; stat(6,2) = max(data);
% Calculating Standard Deviation
stat(7,1) = "Standard Deviation"; stat(7,2) = std(data);
% Calculating Variance
stat(8,1) = "Variance"; stat(8,2) = var(data);
% Calculating Kurtosis
stat(9,1) = "Kurtosis"; stat(9,2) = kurtosis(data);
% Calculating Skewness
stat(10,1) = "Skewness"; stat(10,2) = skewness(data);
end
