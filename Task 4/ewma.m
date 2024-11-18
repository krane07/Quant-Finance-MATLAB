% USER DEFINED FUNCTION FOR COMPUTING AN EWMA CONDITIONAL COVARIANCE MATRIX FORECAST 
function cv=ewma(retm)
% Getting no. of returns and no. of stocks(if the supplied retm is a portfolio)
[num_row,num_col]=size(retm); 

% Defining lambda.
lambda=0.94;

% Preallocating to increase speed
wght_lambda = zeros(num_row,1);

% Computing weights
for i=1:num_row
    wght_lambda(i,1)=lambda.^(num_row-i);
end

% Preallocating to increase speed
wght_retm = zeros(num_row,num_col);

for j=1:num_col
    wght_retm(:,j)=sqrt(wght_lambda).*retm(:,j);
end

mfac=(1-lambda)/(1-lambda.^num_row);
r=sqrt(mfac)*wght_retm;

%Compute the covariance.
cv=r'*r;

end
