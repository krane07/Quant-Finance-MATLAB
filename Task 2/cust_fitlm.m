% CUSTOM FUNCTION FOR fitting linear regression model to data

function [beta, se, t_stat, ssr] = cust_fitlm(x,y,drift)

n = size(y,1);
if size(y,2)>1
    error("The supplied matrix of y should be of size (n x 1) rather (1 x n)");
end

if size(x,1)~=n
    error("Number of observations of independent and dependent variable should be equal");
end

%Adding column of ones if 
if drift
    X = [ones(n,1) x];
end

%Computing Beta
beta = inv(X'*X)*X'*y;

%Computing Fitted values
y_hat = X*beta;

%Computing Fitted Error(residual)
residual = y-y_hat; %Compute the residuals (fitted errors).

%Computing Residual sum of square (SSR)
ssr = sum(residual'*residual);

%Computing Standard error (SE)
cov_var = var(residual)*inv(X'*X); %Estimate the covariance matrix
se = sqrt(diag(cov_var));

%Computing T-statistics (t-stats)
t_stat = beta./se;
end
