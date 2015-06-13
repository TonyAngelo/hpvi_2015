## get legislator info

require(XML)
require(httr)
require(RJSONIO)

# function that takes a url and returns an xml document object
getParsedHTML <- function(url){
    html <- GET(url)
    content <- content(html,as="text")
    fromJSON(content)
}

getChamberMemberInfo <- function(chamber){
    url_start <- "openstates.org/api/v1//legislators/?state=mn&chamber="
    url_end <- "&active=true&apikey=4a26c19c3cae4f6c843c3e7816475fae"
    url <- paste(url_start,chamber,url_end,sep="")
    
    json <- getParsedHTML(url)
    info <- as.data.frame(do.call(rbind, lapply(json, function(x) cbind(x$full_name,x$district,x$party))), stringsAsFactors=FALSE)
    names(info) <- c("name","district","party")
    info$party <- sapply(info$party, function(x) if(x=="Democratic-Farmer-Labor") {"DFL"} else {"R"})
    info$district <- sapply(info$district, 
        function(x) if((chamber=="lower" & nchar(x)<3) | (chamber=="upper" & nchar(x)<2)){paste("0",x,sep="")} 
                    else {x})
    arrange(info,district)
}