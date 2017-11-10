#!/mnt/software/bin/R

#Version:1.0
#This R script will take in the interval coverage profiles of all samples and do hierarchical clustering 
#so as to idenitfy samples that are clustered together based on coverage profiles

#load libraries
library(corrplot)

#get user argument
args <- commandArgs(TRUE)
input_file = args[1]
date = args[2]
prefix = args[3]

#read input
table <- read.table(input_file, header=TRUE,sep="\t", row.names=4)

#remove the first 3 columns because the information is combined in the rownames
tt <-table[,-c(1,2,3)]

# hierarchical clustering
transpose_tt <- t(tt)
d<-dist(transpose_tt)
clusters <- hclust(d)
hfile <- paste(prefix,"_hclust_",date,".ps",sep="")
postscript(hfile)
plot(clusters)
dev.off()
