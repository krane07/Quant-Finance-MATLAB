% FUNCTION TO CALCULATE MEAN SQUARED FORECAST ERROR
function [mse] = mse_cal(actual_val,forecasted_val)
% Get the size of actual data
actual_size = length(actual_val);

% Check if no. of observation and no. of forecated value is equal or not
if(actual_size~=length(forecasted_val))
    % Gives an error if different
    error("The length of the actual array and forecasted array does not match");
end

% Setting sum of squared error to 0
sum_squared_error = 0;

% Preallocating to increase speed
mse = zeros(actual_size,1);

for i=1:actual_size
    % Calculating squared error for each observation and forecast
    a = ( (actual_val(i,1) - forecasted_val(i,1)).^2 );
    % Summing up the squared error in each iteration
    sum_squared_error = sum_squared_error + a;
    % Calculating MSE for each forecasted value
    mse(i,1) = sum_squared_error ./ (i);
end
end