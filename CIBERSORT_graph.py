import pandas as pd
import matplotlib.pyplot as plt

# --- Load data ---
df = pd.read_table('PATH/CIBERSORTxGEP_Job24_Fractions-Adjusted_short.txt')

# Separate sample names and numeric data
samples = df['Mixture']
data = df.drop(columns='Mixture')

# Normalize to proportions so bars sum to 1
data_normalized = data.div(data.sum(axis=1), axis=0)

# --- Plot ---
fig, ax = plt.subplots(figsize=(15, 6))

bottom = pd.Series([0]*len(data_normalized))

# Define colors (extend if you want more)
colors = [
    '#4c72b0', '#dd8452', '#55a868', '#c44e52', '#8172b3',
    '#937860', '#da8bc3', '#8c8c8c', '#ccb974', '#64b5cd'
]

for i, column in enumerate(data_normalized.columns):
    ax.bar(
        samples,
        data_normalized[column],
        bottom=bottom,
        label=column,
        color=colors[i % len(colors)]
    )
    bottom += data_normalized[column]

# Aesthetics
ax.set_ylabel('Fraction')
ax.set_xticks(range(len(samples)))
ax.set_xticklabels(samples, rotation=90, fontsize=8)
ax.legend(loc='upper right', bbox_to_anchor=(1.2, 1))

plt.tight_layout()

# --- Save figure ---
plt.savefig("/Users/fdumetz/Downloads/my_stacked_barplot.png", dpi=300, bbox_inches='tight')
plt.close()

print("Figure saved as /Users/fdumetz/Downloads/my_stacked_barplot.png")
