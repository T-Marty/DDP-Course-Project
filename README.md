# Coursera _Developing Data Products_ Course Project
## User Guide
## Introduction
The portfolio simulation app allows you to construct simple portfolios using a 
combination of securities, and estimates how that portfolio would have performed 
based on past return data.

## Usage
#### Portfolio Weights
Simply use the sliders to adjust the relative position sizing for each of the 
securities. 

For example, selecting a portfolio weight of 0.4 for GOLD, a weight 
of 0.6 for ASX, and zero for all others, will reflect the return of a portfolio 
consisting of 40% GOLD (the commodity) and 60% ASX (a basket of Australian stocks).
If portfolio weights are chosen that sum to a value greater than 1, the weights 
are rescaled so that they sum to 1. This basically means that you can't invest 
more than 100% of your wealth.

#### Rebalancing Frequency
Use the drop-down list to select the frequency at which you would like to 
balance your portfolio.


If you initially invest 40% of your wealth in GOLD and 60% in the ASX, after a 
period of time, as the securities move up and down, your wealth will no longer 
be a 40/60 split. This is because if the ASX rises while GOLD falls, you have 
gained wealth invested in the ASX and lost wealth invested in GOLD. Rebalancing
refers to the process of buying and selling shares to bring our portfolio weights
back to our original selection. In these example we would need to sell some ASX 
and buy some GOLD to return to our original 40/60 split. Rebalancing frequency 
decides how often this process is performed. Transaction costs are not included 
in this app, so frequent rebalancing would cost more in reality.
 
#### Analyse Portfolio Button
Clicking this button will simulate the portfolio for the data range provided and 
display some useful statistics related to the performance of the selected 
portfolio. If weights are changed, the 'Analyse Portfolio' button will need 
to be clicked again to recalculate the statistics.

### Additional Information
#### Security Codes
All the listed securities are exchange-traded funds (ETFs) traded on the 
Australian Stock Exchange. Search for "[security code] ASX" in your search
engine information about these securities will be provided.

#### Portfolio Statistics
* Annualised Return: The average yearly return on the simulated portfolio.
* Sharpe Ratio: This provides a measure of reward/risk, a higher value 
indicates less volatility for the same amount of reward (returns).
* Maximum Drawdown: This shows you how the largest decrease in cumulative returns
your portfolio would have experienced.
* Recovery Time: Recovery time tells you how long it took to get your money back
 after the maximum drawdown.
