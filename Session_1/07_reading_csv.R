
url_path <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
data <- read.csv(url_path, header=FALSE)

print(head(data))

## Your turn!
## Add lines of code that will read "../Data/Books.csv".  
## This file is available locally AND it does have header
## information included in the file.