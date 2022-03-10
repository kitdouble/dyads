# Dyads

`# Read in Individual Data
data <- read.csv("~/Desktop/example.csv")
source("~/Desktop/Dyad Data Restructure Functions.R")


# Individual to Dyad Structure
ind_to_dyad(data = data,CoupleID = "CoupleID", Distinguisher = "Gender", labels = c("M","F"))

# Individual to Pairwise Structure
ind_to_pair(data = data, CoupleID = "CoupleID")
`
