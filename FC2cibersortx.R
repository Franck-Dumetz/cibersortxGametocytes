#! /usr/bin/env R

# Install required package
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("edgeR")

# Load edgeR
library(edgeR)

# --- Step 1: Load FeatureCounts Data ---

# Replace this with your actual file path
# Example assumes tab-delimited file with annotation columns in the first 6 columns
count_data <- read.delim("PATH_TO_count-table", row.names = 1, header=TRUE, skip = 1)

# --- Step 2: Remove annotation columns if needed ---

# Check the first few column names to confirm
head(colnames(count_data))

# Adjust this line based on where your actual count columns start
count_data <- count_data[, 7:ncol(count_data)]

# --- Step 3: Create DGEList Object ---

dge <- DGEList(counts = count_data)

# --- Step 4: Calculate CPM Values ---

# Raw CPM
cpm_counts <- cpm(dge)

# Log2-CPM
#log_cpm_counts <- cpm(dge, log = TRUE)

# --- Step 5: Save Output ---
cpm_counts_out <- data.frame(GeneID = rownames(cpm_counts), cpm_counts)
#log_cpm_counts_out <- data.frame(GeneID = rownames(log_cpm_counts), log_cpm_counts)

write.table(cpm_counts_out, "path/Pf_Count_RPM_cibersort.txt", sep = "\t", quote = FALSE, row.names = TRUE, col.names = TRUE)
#write.table(log_cpm_counts_out, "log2CPM_transformed_counts.csv", sep = "\t", quote = FALSE)
