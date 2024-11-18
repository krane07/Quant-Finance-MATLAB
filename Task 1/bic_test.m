% USER DEFINED FUNCTION TO GET OPTIMAL VALUE OF P AND Q BY COMPARING BIC
% VALUE
function [eff_p,eff_q,bic,minValue] = bic_test(data,p_value,q_value)

p_value = p_value + 1;
q_value = q_value +1;
% Preallocating to increase speed
bic = zeros(p_value,q_value);
for i=1:p_value
    for j=1:q_value
        %creating model
        est_mdl = arima(i-1,1,j-1);
        % Estimating parameters
        [fit,~,logL] = estimate(est_mdl,data,'Display','off');

        % here (i + j -1), 1 is subtracted instead of adding it 
        % when suppling no. of parameters to aicbic() function,
        % the values of j and i are initialized as 1 at the start
        % of the loop so already they are incremented by 1.
        [~,bic(i,j)] = aicbic(logL,i + j -1, size(data,1)); % Calculating and Storing BIC value
        clear logL;
        clear fit;
    end
end

[minValue, index] = min(bic(:));
% Convert linear index to subscript indices
[eff_p, eff_q] = ind2sub(size(bic), index);
% Since the indexing in MATLAB starts from 1 we minus the row and
% column indices by 1 to get p and q values
eff_p = eff_p - 1;
eff_q = eff_q - 1;
end