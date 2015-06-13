# 2015 Minnesota hPVI

hPVI, a version of Charlie Cook's PVI, was [created in 2010](http://minn-donkey.blogspot.com/2010/07/pvi-breakdown-by-county.html) for use in analysing the partisan tendencies of Minnesota legislative districts.

CSV files of 2015 hPVI can be found in the "output" folder.

*What is PVI?*

>The Cook Partisan Voting Index (Cook PVI) is a measurement of how strongly a United States congressional district leans toward the Democratic or Republican Party, compared to the nation as a whole. The Cook Political Report introduced the PVI in August 1997 to better gauge the competitiveness of each district using the 1992 and 1996 presidential elections as a baseline. The index is based on analysis by the Center for Voting and Democracy (now FairVote) for its July 1997 Monopoly Politics report. [wikipedia](https://en.wikipedia.org/wiki/Cook_Partisan_Voting_Index)

*How is PVI calculated?*

>PVIs are calculated by comparing the district's average Democratic or Republican Party's share of the two-party presidential vote in the past two presidential elections to the nation's average share of the same. The national average for 2004 and 2008 was 51.2% Democratic to 48.8% Republican. For example, in Alaska's at-large congressional district, the Republican candidate won 63% and 61% of the two-party share in the 2004 and 2008 presidential elections, respectively. Comparing the average of these two results (62%) against the average national share (49%), this district has voted 13 percentage points more Republican than the country as a whole, or R+13. [wikipedia](https://en.wikipedia.org/wiki/Cook_Partisan_Voting_Index)

*How is hPVI different from PVI*

First of all hPVI is measuring the partisan voting tendancies of Minnesota Legislative districts, not congressional districts like PVI does. Also, hPVI uses a different set of data from PVI. Like PVI, hPVI uses data from the most recent Presidential election. But where PVI also uses data from the Presidential election before that, hPVI instead uses data from the most recent Gubanatorial election.

The main reason for this change is that the data from most recent Gubanatorial election (2014) is six years fresher than the data from two Presidential elections ago (2008).

The Gubanatorial data also has the advantage of always being offset from the Presidential data by two years, unlike say data from US Senate races which may occur in Presidential years.

A case could be made to use data from other constitutional office races that happen concurrently with Gubanatorial elections; Secretary of State, Attorney General and Auditor. Whatever the possible merits of using one (or all three) of those races, the Gubanatorial data seems to best fit with the spirt of the origional PVI metric.

The other way in which hPVI differs from PVI is that after PVI calculates the districts average it compares that average to the average of the whole country, so the final metric is in relation to the average of the country. The first few runs of hPVI were calculated in a similar fasion, except instead of comparing legislative districts against the whole country they were compared against the whole state.

I stopped comparing districts to the state in 2013 because it was actually hurting the predictive value of the metric. 

*How is hPVI calculated?*

2015 hPVI uses the 2014 Gubanatorial election and the 2012 Presidential elections for their data. To get a districts hPVI you calculate the DFLs share of the two-party vote in the district and then subtract .5 from the total. The result is the districts hPVI. For presentation purposes this gets rounded to the nearest whole number and if it's positive a D gets put in front of it and if it's negative an R gets put in front of it (and the negative removed).