# Quant-Finance-MATLAB
Comprehensive MATLAB project featuring stock return forecasting, exchange rate analysis, portfolio optimization using the Markowitz model, and Value at Risk (VaR) computation for financial risk assessment.

## The following 3 datasets were utilised.
### Data Set 1
The dataset comprises daily price data from four US firms, spanning the period from December 31, 2010, to December 30, 2022.
Namely,
- JNJ
- MSFT
- NFLX
- NKE
### Data Set 2
The dataset comprises monthly price data from four US firms, spanning the period from December 2010 to December 2022.
Namely,
- CAT
- JPM
- NVDA
- WMT
### Data Set 3
The dataset comprises monthly data on the GBPUSD spot exchange rate (1998:01-2021:06) and GBPUSD forward exchange rate (1998:01-2021:06).

## Below are the tasks
**Task 1:** Pick one of the stocks from data set 1 and compute the natural logarithm of the price series for this stock. Use the Box-Jenkins methodology to estimate an appropriate time series model for the log-price series and investigate the forecasting ability of the model.

**Task 2:**

**(a):** Using appropriate hypothesis tests, analyse whether the natural logarithm of GBPUSD spot exchange rate from data set 3 is consistent with the random walk model.

**(b):** Using the natural logarithm of the GBPUSD spot and forward exchange rates from data set 3, test the forward rate unbiasedness (FRU) hypothesis.

**Task 3:** Using data set 2 and assuming a one-year investment horizon, no borrowing, and no short sales, investigate the optimal portfolio weights for a portfolio of the four stocks and a single risk-free asset (use any sensible values for the coefficient of risk aversion and risk-free rate).

**Task 4** Using data set 1:

**(a):** Use the RiskMetrics or Historical Simulation approach to compute the one-day ahead return-VaR for one of the stocks over the period 03/01/22-30/12/22 and conduct backtesting.

**(b):** Use the RiskMetrics or Historical Simulation approach to compute the one-day ahead return-VaR for an equally weighted portfolio of the four stocks over the period 03/01/22-30/12/22 and conduct backtesting.

## Instructions to run the project

**Set Up Your Environment**  
   Ensure MATLAB is installed on your system, and all required toolboxes (e.g., Statistics and Machine Learning Toolbox, Econometrics Toolbox) are available.
   
### Task 1

### How to Run the Project

1. **Prepare the Data**  
   - Place the necessary data file (`JNJ.xlsx`) in a directory accessible to the MATLAB script.
   - Update the file location paths in the script to match your data's location. Modify the following line in the script:
     ```matlab
     file_location = 'Your file location\Data set 1';
     ```

2. **Run the Script**  
   - Open MATLAB.
   - Navigate to the directory containing the script.
   - Execute the script by typing its filename in the MATLAB Command Window (e.g., `>> Task1Script`).

3. **Optional: Save Outputs**  
   - Uncomment the `saveas` and `writematrix` lines in the script to save graphs and computed data (e.g., descriptive statistics, ADF test results, BIC values).

4. **Understand the Outputs**  
   - The script performs several tasks:
     - **Data Visualization**: Generates and plots the Johnson & Johnson stock prices.
     - **Descriptive Statistics**: Computes and optionally saves statistics such as mean, median, variance, etc.
     - **Model Identification and Estimation**: Uses ARIMA modelling techniques to identify and estimate optimal parameters for the data.
     - **Diagnostic Testing**: Tests the residuals to validate the model's assumptions.
     - **Forecasting**: Performs multi-period forecasting of the stock prices and evaluates model accuracy using MSE.
   - Examine the plots and statistics displayed during execution for insights.

5. **Adjust Parameters (Optional)**  
   - You can modify ARIMA model parameters or BIC search ranges (`bic_test` function) to experiment with different configurations.

6. **User-Defined Functions**  
   - Ensure the custom functions (`log_pop`, `desc_stat`, `bic_test`, and `mse_cal`) are included in the same directory or MATLAB path. These functions are essential for the script's execution.

7. **Dependencies**  
   - Ensure the script and functions have access to the required MATLAB toolboxes and functions such as `adftest`, `autocorr`, and `arima`.


### Task 2

#### 1. **Set Up Your Environment**
   - Verify that all required files and datasets are downloaded and placed in appropriate directories.
   - Check that all custom functions (`log_pop`, `cust_fitlm`, etc.) are included in the same directory or accessible through MATLAB's path.

---

#### 2. **Run Task 2a**

##### Step 2.1: Load the Required Data
   - Open the MATLAB script for Task 2.
   - Update the directory paths in the script:
     ```matlab
     cd('Set location of your default directory');
     file_location = 'Your file location\Data set 3';
     ```
   - Replace the placeholder paths with the actual paths to your datasets.

##### Step 2.2: Plot and Analyze Spot Rate Returns
   - Execute the script up to the following line:
     ```matlab
     plot(date_2(2:end,1),spot_dif);
     ```
   - Verify that the plot titled **"Figure 2.1: 1 period returns of GBPUSD spot rate"** appears. If needed, uncomment the line to save the figure:
     ```matlab
     % saveas(gcf,"fig21.jpg");
     ```

##### Step 2.3: Perform Statistical Tests
   - Run the ADF and VR tests for the spot price series by executing the corresponding lines. The results are stored in variables like `adf_rw`, `adf_rwt`, `vr_test`, and `vr_test2`.
   - Optionally, uncomment the following lines to save test results in Excel format:
     ```matlab
     % writematrix(adf_rw,"Task 2 ADF test.xlsx");
     % writematrix(vr_test,"Task 2 VR test 1.xlsx");
     ```

---

#### 3. **Run Task 2b**

##### Step 3.1: Load the Forward Price Data
   - Update the file location for the forward price dataset:
     ```matlab
     file_location = 'Your file location\Data set 3';
     ```
   - Replace placeholders with the actual path to the forward price data file.

##### Step 3.2: Conduct Regression Analysis
   - Execute the script to compute regression parameters (`beta`), standard errors, \( t \)-tests, and the sum of squared residuals (SSR).
   - Use the following key outputs for validation:
     - Regression coefficients (\( \alpha, \beta \)).
     - \( t \)-statistics and \( F \)-test values to assess statistical significance.
     - Critical values (\( t_{\text{crit}}, f_{\text{crit}} \)) for hypothesis testing.

##### Step 3.3: Save Regression Analysis Results
   - Optionally, uncomment the following line to save regression results in Excel format:
     ```matlab
     % writematrix(reg,"Task 2 reg analysis.xlsx");
     ```

---

#### 4. **Verify Outputs**
   - Ensure all figures (e.g., **Figure 2.1**) and results match expected outcomes.
   - Cross-check exported test results (`.xlsx` files) for completeness and correctness.

---

#### 5. **Customize or Extend**
   - Modify inputs, parameters, or hypotheses as necessary for your analysis.
   - Adapt or expand the script for additional tests or datasets.

### Task 3

#### 1. **Set Up Your Environment**
   - Ensure MATLAB is installed and all required libraries (e.g., for portfolio optimization) are available.
   - Confirm that datasets for the stocks (**CAT**, **JPM**, **NVDA**, **WMT**) are downloaded and placed in the specified directory.
   - Check that custom functions like `log_pop` are available in the working directory or MATLAB path.

---

#### 2. **Run Task 3**

##### Step 2.1: Load the Data
   - Open the MATLAB script for Task 3.
   - Update the directory paths:
     ```matlab
     cd('Set location of your default directory');
     file_location = 'Your file location\Matlab assignment\Data set 2';
     ```
   - Replace placeholders with the actual paths to the data files.

##### Step 2.2: Calculate Monthly Returns
   - Execute the section of the script that calculates monthly returns:
     ```matlab
     return_price = stock_price(2:end,:) - stock_price(1:end-1,:);
     ```
   - Verify that the `return_price` matrix contains the monthly returns for all four stocks.

##### Step 2.3: Calculate Annualized Mean, Variance, and Covariance
   - Run the code to compute the annualized mean returns and covariance matrix:
     ```matlab
     asset_mean = 12 .* mean(return_price);
     asset_covar = 12 .* cov(return_price);
     ```
   - Optionally, uncomment the following lines to save these results as Excel files:
     ```matlab
     % writematrix(asset_mean,"Task 3 asset mean.xlsx");
     % writematrix(asset_covar,"Task 3 asset covariance.xlsx");
     ```

##### Step 2.4: Perform Portfolio Optimization
   - Create the portfolio object and set the asset moments:
     ```matlab
     port = Portfolio;
     port = setAssetMoments(port, asset_mean, asset_covar);
     port = setDefaultConstraints(port);
     ```
   - Estimate efficient frontier weights and compute the associated risk and return:
     ```matlab
     port_wts = estimateFrontier(port, num_port);
     [port_risk, port_ret] = estimatePortMoments(port, port_wts);
     ```
   - Store the portfolio weights, risks, and returns in a table for analysis. Save the table if needed:
     ```matlab
     % writematrix(Final_table,"Task 3 portfolio weights.xlsx");
     ```

##### Step 2.5: Plot the Efficient Frontier
   - Plot the efficient frontier:
     ```matlab
     plotFrontier(port, num_port);
     ```
   - If needed, uncomment the following line to save the plot:
     ```matlab
     % saveas(gcf,"fig31.jpg");
     ```

---

#### 3. **Compute Optimal Risky and Final Portfolios**

##### Step 3.1: Define Parameters
   - Set the risk-free rate, borrowing rate, and risk aversion level:
     ```matlab
     rf_rate = 0.07;  % Risk-free rate
     br = NaN;        % Borrowing rate (assumed unavailable)
     ra = 6;          % Risk aversion coefficient
     ```

##### Step 3.2: Compute Optimal Portfolio
   - Use `portalloc` to compute the optimal risky and final portfolio characteristics:
     ```matlab
     [orp_risk, orp_ret, orp_wts, orp_fraction, ofp_risk, ofp_ret] = portalloc(port_risk, port_ret, port_wts', rf_rate, br, ra);
     ```
   - Store results for the Optimal Risky Portfolio (ORP) and Optimal Final Portfolio (OFP). Save these results if needed:
     ```matlab
     % writematrix(orp,"Task 3 orp.xlsx");
     % writematrix(ofp,"Task 3 ofp.xlsx");
     ```

##### Step 3.3: Plot the Capital Allocation Line
   - Plot the Capital Allocation Line (CAL) along with the efficient frontier:
     ```matlab
     portalloc(port_risk, port_ret, port_wts', rf_rate, br, ra);
     ```
   - Customize the plot with titles, labels, and legends:
     ```matlab
     title({'Figure 3.2: Asset allocation: four stocks and a risk-free asset'}, 'FontSize', 10, 'FontName', 'Calibri');
     ylabel('E(r_P)', 'FontSize', 10, 'FontName', 'Calibri');
     xlabel('\sigma_P', 'FontSize', 10, 'FontName', 'Calibri');
     legend('efficient frontier', 'OFP', 'ORP', 'CAL', Location='Best');
     ```
   - Uncomment the following line to save the graph:
     ```matlab
     % saveas(gcf,"fig32.jpg");
     ```

---

#### 4. **Verify Outputs**
   - **Excel Files**: Confirm that Excel files for the asset mean, covariance, portfolio weights, and optimal portfolios are saved correctly.
   - **Plots**: Check the efficient frontier plot and CAL plot for accuracy.
   - **Console Outputs**: Verify that the ORP and OFP values match expectations.

---

#### 5. **Customize or Extend**
   - Adjust the number of portfolios (`num_port`), the risk aversion level (`ra`), or the risk-free rate (`rf_rate`) to experiment with different scenarios.
   - Include additional assets or alternative constraints if needed.

### Task 4
### Task 4a: Value-at-Risk (VaR) for Microsoft Stock

#### 1. **Set Up Your Environment**
   - Ensure the **Microsoft (MSFT)** stock dataset is placed in the specified directory.
   - The user-defined functions (`log_pop`, `RiskMetric`, `ewma`) must be accessible in the current MATLAB directory or path.

---

#### 2. **Execute Task 4a**
   - Open the MATLAB script for Task 4a and update the file paths:
     ```matlab
     cd('Set location of your default directory');
     file_location = 'Your file location\Data set 1';
     ```

##### Step 2.1: Load MSFT Data
   - Load stock prices using the `log_pop` function:
     ```matlab
     [msft_price, date_3] = log_pop(file_location, 'MSFT.xlsx', 'MSFT', 'F2:F3022');
     ```
   - Calculate the returns:
     ```matlab
     ret = msft_price(2:end,1) - msft_price(1:end-1,1);
     adjDate_1 = date_3(2:end,1);
     ```

##### Step 2.2: Forecast VaR Using RiskMetrics
   - Call the `RiskMetric` function with the return data:
     ```matlab
     [fvar] = RiskMetric(ret, 212);
     ```

##### Step 2.3: Plot VaR
   - Generate a graph of forecasted VaR values:
     ```matlab
     plot(adjDate_1(end-211:end,1), fvar, 'LineWidth', 1);
     title({'Figure 4.1 Microsoft return-VaR, 03/01/2022 - 12/30/2022,', ...
            'RiskMetrics using an EWMA volatility forecast'}, ...
            'FontSize', 10, 'FontName', 'Calibri');
     ylabel("Return-VaR");
     xlabel("Days");
     datetick('x', 'mmm');
     ```
   - Uncomment the following line to save the graph:
     ```matlab
     % saveas(gcf, "fig41.jpg");
     ```

##### Step 2.4: Backtest the VaR Model
   - Create a `varbacktest` object and apply statistical tests:
     ```matlab
     vbt = varbacktest(ret(end-211:end,1), fvar, 'VaRLevel', 0.99);
     POF_TestResults = pof(vbt, 'TestLevel', 0.99);
     CCI_TestResults = cci(vbt, 'TestLevel', 0.99);
     CC_TestResults = cc(vbt, 'TestLevel', 0.99);
     ```

   - Verify test results in the MATLAB console for validation of the model.

---

### Task 4b: Portfolio VaR

#### 1. **Set Up Your Environment**
   - Ensure datasets for all four stocks (**JNJ, MSFT, NFLX, NKE**) are available in the directory.
   - The user-defined functions (`log_pop`, `RiskMetric`, `ewma`) must be accessible.

---

#### 2. **Execute Task 4b**
   - Open the MATLAB script for Task 4b and update the file paths:
     ```matlab
     file_location = 'Your file location\Data set 1';
     ```

##### Step 2.1: Load Portfolio Data
   - Load stock prices for the portfolio:
     ```matlab
     [portfolio_1(:,1), date_4] = log_pop(file_location, 'JNJ.xlsx', 'JNJ', 'F2:F3022');
     [portfolio_1(:,2), ~] = log_pop(file_location, 'MSFT.xlsx', 'MSFT', 'F2:F3022');
     [portfolio_1(:,3), ~] = log_pop(file_location, 'NFLX.xlsx', 'NFLX', 'F2:F3022');
     [portfolio_1(:,4), ~] = log_pop(file_location, 'NKE.xlsx', 'NKE', 'F2:F3022');
     ```
   - Compute portfolio returns:
     ```matlab
     port_ret = portfolio_1(2:end, :) - portfolio_1(1:end, :);
     adjDdate_2 = date_4(2:end,1);
     ```

##### Step 2.2: Forecast Portfolio VaR
   - Call the `RiskMetric` function for portfolio returns:
     ```matlab
     fvarPort = RiskMetric(port_ret, 212);
     ```

##### Step 2.3: Plot Portfolio VaR
   - Generate a graph of the forecasted VaR values:
     ```matlab
     plot(adjDdate_2(end-211:end,1), fvarPort, 'LineWidth', 1);
     title({'Figure 4.2: Portfolio return-VaR, 03/01/2022 - 12/30/2022,', ...
            'RiskMetrics using an EWMA volatility forecast'}, ...
            'FontSize', 10, 'FontName', 'Calibri');
     ylabel("Return-VaR");
     xlabel("Days");
     datetick('x', 'mmm');
     ```
   - Uncomment the following line to save the graph:
     ```matlab
     % saveas(gcf, "fig42.jpg");
     ```

##### Step 2.4: Backtest the Portfolio VaR Model
   - Create a `varbacktest` object and apply statistical tests:
     ```matlab
     vbt_port = varbacktest(port_ret(end-211:end,1), fvarPort, 'VaRLevel', 0.99);
     POF_portTR = pof(vbt_port, 'TestLevel', 0.99);
     CCI_portTR = cci(vbt_port, 'TestLevel', 0.99);
     CC_portTR = cc(vbt_port, 'TestLevel', 0.99);
     ```

   - Verify test results in the MATLAB console to assess model validity.

---

### 3. **Verify Outputs**
   - **Graphs**: Confirm that both Figure 4.1 (MSFT VaR) and Figure 4.2 (Portfolio VaR) are plotted correctly.
   - **Backtest Results**: Ensure the outputs from `pof`, `cci`, and `cc` tests meet expectations for both individual stock and portfolio VaR models.

---

### 4. **Customize or Extend**
   - Experiment with different VaR confidence levels (e.g., 95%) or forecast windows in the `RiskMetric` function.
   - Incorporate additional assets into the portfolio for broader analysis.
