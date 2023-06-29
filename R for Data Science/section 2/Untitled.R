# Import the necessary libraries
library(tidyverse)
library(tm)
library(LDAvis)
library(RColorBrewer)

# Read in the CSV file
data <- read.csv("COVID-19_CNN.csv", stringsAsFactors = FALSE)

# Perform text preprocessing on the "content" column
data_clean <- data %>%
  select(content) %>%
  mutate(content = iconv(content, to = "latin1", sub = "byte")) %>%
  mutate(content = tolower(content)) %>%
  mutate(content = removePunctuation(content)) %>%
  mutate(content = removeNumbers(content)) %>%
  mutate(content = removeWords(content, stopwords("english"))) %>%
  mutate(content = stripWhitespace(content))

# Check if any rows have been removed during text preprocessing
if (nrow(data_clean) != nrow(data)) {
  print("Some rows were removed during text preprocessing.")
}

# Create a DocumentTermMatrix
dtm <- DocumentTermMatrix(data_clean$content)

# Compute the sparsity of the matrix
sparsity <- 1 - (sum(dtm != 0) / length(dtm))

# Print the sparsity
print(sparsity)

# Set a threshold for removing parsing terms
sparse_limit <- 0.99

# Remove parsing terms if the sparsity is above the threshold
if (sparsity > sparse_limit) {
  dtm <- removeSparseTerms(dtm, sparse_limit = sparse_limit)
  sparsity <- 1 - (sum(dtm != 0) / length(dtm))
  print(paste0("Sparse terms removed. New sparsity: ", sparsity))
}

# Remove rows that contain only zeroes
dtm <- dtm[rowSums(as.matrix(dtm)) > 0, ]

#set k as an input parameter 
k <- 3

#Check if the k value passed to LDA() is not too high relative to the number of documents(rows) in the dtm
if(k > nrow(dtm)){
  k <- nrow(dtm)
  print("k value is too high, it is adjusted to ", k)
}

# Perform topic modeling
library(topicmodels)
lda_model <- LDA(dtm, k = k)

# Prepare the data for visualization
vis_data <- createDtm(dtm, lda_model)

# Create the visualization
library(LDAvis)
vis_lda <- vis(vis_data, out.dir = ".", file = "lda_vis.html", open = FALSE)

# Print the visualization
vis_lda
