% USER DEFINED FUNCTION TO GET LOG(PRICES) AND DATES CONVERTED TO MATLAB DATES
function [log_data, date_data] = log_pop(file_loc, file_name, sheet_name, range)
    
% Saving the path of current directory
current_directory = pwd; 

% Loading the the directory where the data file is present
cd(file_loc);

% Loading price
[data] = readmatrix(file_name,'Sheet', sheet_name, 'Range', range);

% The dates in all the data sets is in column A, So replacing the column with 'A'
ch = range(1);
range1 = strrep(range, ch,'A');
[raw_date] = readmatrix(file_name,'Sheet', sheet_name, 'Range', range1);

% Converting the Excel date number to a MATLAB date number.
date_data = datetime(raw_date, 'ConvertFrom','excel');

% Checking whether the data is structured with precedence given to older values. 
if date_data(1) > date_data(end)
    % Flipping the array up to down
    date_data = flipud(date_data);
    data = flipud(data);
end
% Taking Natural log
[log_data] = log(data);

% Changing back to the previous directory
cd(current_directory);
