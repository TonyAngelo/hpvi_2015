### tables and plots 

# write full html table output to file
write(print(xtable(senateHPVI, caption="Minnesota Senate Districts hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/senate_hpvi_table_2015.html")
write(print(xtable(houseHPVI, caption="Minnesota House Districts hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/house_hpvi_table_2015.html")

# write ten most conservative and liberal districts html table output to file
write(print(xtable(arrange(senateHPVI,rpvi)[1:10,1:4], caption="10 Most Republican Minnesota Senate Districts by hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/senate_hpvi_most_rep_table_2015.html")
write(print(xtable(arrange(houseHPVI,rpvi)[1:10,1:4], caption="10 Most Republican Minnesota House Districts by hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/house_hpvi_most_rep_table_2015.html")
write(print(xtable(arrange(senateHPVI,desc(rpvi))[1:10,1:4], caption="10 Most DFL Minnesota Senate Districts by hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/senate_hpvi_most_dfl_table_2015.html")
write(print(xtable(arrange(houseHPVI,desc(rpvi))[1:10,1:4], caption="10 Most DFL Minnesota House Districts by hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/house_hpvi_most_dfl_table_2015.html")

# write the twenty most competitive districts html table output to file
write(print(xtable(arrange(senateHPVI,abs(rpvi))[1:20,1:4], caption="20 Most Competitive Minnesota Senate Districts by hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/senate_hpvi_most_comp_table_2015.html")
write(print(xtable(arrange(houseHPVI,abs(rpvi))[1:20,1:4], caption="20 Most Competitive Minnesota House Districts by hPVI"), 
            caption.placement='top', type="html", include.rownames=FALSE), "./output/house_hpvi_most_comp_table_2015.html")


# histogram plots

# add a factor variable for coloring hist bars
houseHPVI$hpvi_color <- as.factor((houseHPVI[,5]>0)*1)
senateHPVI$hpvi_color <- as.factor((senateHPVI[,5]>0)*1)

# create the pngs
png(file="./output/house_hpvi_hist_2015.png",width=500,height=500,units="px")
ggplot(data=houseHPVI, aes(rpvi, fill=hpvi_color)) + 
    geom_histogram(breaks=c(-50,-40,-30,-20,-10,0,10,20,30,40,50)) + 
    scale_fill_manual(values = c("red", "blue")) + 
    ylab("Number of Districts") + 
    xlab("hPVI") + 
    ggtitle("Minnesota House District hPVI Distribution") +
    theme(legend.position = "none",
          plot.title = element_text(size = rel(2)))
dev.off(which = dev.cur())

png(file="./output/senate_hpvi_hist_2015.png",width=500,height=500,units="px")
ggplot(data=senateHPVI, aes(rpvi, fill=hpvi_color)) + 
    geom_histogram(breaks=c(-50,-40,-30,-20,-10,0,10,20,30,40,50)) + 
    scale_fill_manual(values = c("red", "blue")) + 
    ylab("Number of Districts") + 
    xlab("hPVI") + 
    ggtitle("Minnesota Senate District hPVI Distribution") +
    theme(legend.position = "none",
          plot.title = element_text(size = rel(2)))
dev.off(which = dev.cur())

# district bar graph
ggplot(data=senateHPVI, aes(x=district, y=rpvi, fill=party)) + geom_bar(colour="black", stat="identity")
