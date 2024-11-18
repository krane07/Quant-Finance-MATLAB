% USER DEFINED FUNCTION TO CALCULATE VaR USING RISKMETRICS APPROACH
function for_var = RiskMetric(ret,nDays)
% Getting no. of returns and no. of stocks(if the supplied ret is a portfolio)
[nr,nc] = size(ret);

%Computing the z quantile.
z_quant = norminv(0.01,0,1);

% Defining vector of weights
wght = (1/nc)*ones(nc,1);

% Preallocating to increase speed
for_var = zeros(nDays,1);

for nl=nr-nDays:nr-1
    %Computing the EWMA conditional variance forecast using custom ewma function.
    [cv] = ewma(ret(1:nl,:));
    
     % Calculating Variance of a portfolio/single stock
     wght_cv = wght'*cv*wght;

     % Calculating volatality for a portfolio/single stock
     v_for  = sqrt(wght_cv); 

    % Computing the VaR.
    rq = z_quant*v_for;
    
    % Convert to >0 and collect in for_var.
    for_var(nl-nr+nDays+1,1) = -rq;
end
