# Let's say your big data is in a data frame:
big_data <- read.delim("path_to_raw_sc_count_table", check.names = FALSE)

# Get the column names
col_names <- colnames(big_data)

# Unique groups (e.g., cell types or sample labels)
unique_names <- unique(col_names)

# Create an empty list to store selected column indices
selected_cols <- c()

# Loop through each unique name and sample 100 columns
for (name in unique_names) {
  cols <- which(col_names == name)
  if (length(cols) > 100) {
    sampled <- sample(cols, 100)
  } else {
    sampled <- cols  # if fewer than 100, keep all
  }
  selected_cols <- c(selected_cols, sampled)
}

# Subset the dataset
subset_data <- big_data[, selected_cols]

# Write the result to a new file
write.table(subset_data, "GamscRNA2024_subset.tsv", sep = "\t", quote = FALSE, row.names = FALSE)

