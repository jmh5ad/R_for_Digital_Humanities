

filename <- "../Data/austen-emma-excerpt.txt"
raw_text <- paste(readLines(filename),  collapse="\n")

count <- stringr::str_count(raw_text, "Emma")
print(count)