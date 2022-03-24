# Dyads

```
# Read in Individual Data
data <- read.csv("~/Desktop/example.csv")

# Read in the functions
source("~/Desktop/Dyad Data Restructure Functions.R")

# or even easier
library(devtools)
source_url("https://raw.githubusercontent.com/kitdouble/dyads/main/Scripts/Dyad%20Data%20Restructure%20Functions.R")

# Individual to Dyad Structure
ind_to_dyad(data = data,CoupleID = "CoupleID", Distinguisher = "Gender", labels = c("M","F"))

# Individual to Pairwise Structure
ind_to_pair(data = data, CoupleID = "CoupleID")


# e.g. with ARC data
df <- ind_to_dyad(data = mydata, CoupleID = "Couple_ID", Distinguisher = "T1A_Demo_Gender", labels = c("Male", "Female"), Between_dyad_vars = c("Prolific_ID","Partner_ID", "Couple_ID", "Role"))

```
