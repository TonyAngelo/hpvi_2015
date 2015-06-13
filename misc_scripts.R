# function that takes a url and returns an xml document object
getParsedHTML <- function(url){
    html <- GET(url)
    content <- content(html,as="text")
    htmlParse(content, asText=TRUE)
}

## get the current house member names/party/district
# get the html from the page with house member page links
parsedHouseHtml <- getParsedHTML("http://www.house.leg.state.mn.us/members/hmem.asp")
# pull out the names/districts/parties of the members
house_names <- xpathSApply(parsedHouseHtml, "//b", xmlValue)[2:268][c(TRUE,FALSE)]
# get the individual values
district <- sapply(house_names, function(x) gsub("[A-Za-z '\\.\\)]+ \\(", "", gsub(", [A-Z]+\\)$", "", x)), USE.NAMES = FALSE)
party <- sapply(house_names, function(x) gsub(".*, ", "", gsub("\\)$", "", x)), USE.NAMES = FALSE)
name <- sapply(house_names, function(x) gsub(" \\([0-9AB]{3}, [A-Z]+\\)", "", x), USE.NAMES = FALSE)
# an extra clean up step to account for nicknames
name <- sapply(name, function(x) gsub(" \\([A-Za-z\\.]+\\)", "", x), USE.NAMES = FALSE)


# get rid of variables not longer needed
rm("district", "name", "party", "house_names", "legdata", "parsedHouseHtml")

## get the senate member names/party/district
# get the html from the page with senate member page links
parsedSenateHtml <- getParsedHTML("http://www.senate.leg.state.mn.us/members/")
# pull out the p tag with the relevant info
senate_names <- getNodeSet(parsedSenateHtml, "//p")[1:67]
# get the member name/party/district element
senate_names <- sapply(senate_names, FUN=function(x) xmlChildren(x)$a)
senate_names <- sapply(senate_names, FUN=function(x) xmlValue(x))
# get the individual values
district <- sapply(senate_names, function(x) gsub(", [A-Z]+\\)$", "", gsub("^.* \\(", "", x)), USE.NAMES = FALSE)
name <- sapply(senate_names, function(x) gsub(" \\([0-9]+, [A-Z]+\\)$", "", x), USE.NAMES = FALSE)
party <- sapply(senate_names, function(x) gsub("\\)$", "", gsub("^.* \\([0-9]+, ", "", x)), USE.NAMES = FALSE)