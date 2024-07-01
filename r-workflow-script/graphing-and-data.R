# Modified from:
# https://plotly.com/ggplot2/contour-plots/

# Install R packages
install.packages(c("plotly", "ggplot2", "reshape2"))

# Load libraries
library(plotly)
library(reshape2)

# Load data from the {datasets} package included with R
data(volcano, package = "datasets")

# Reshape data from wide to long
df <- melt(volcano)

# Construct graph with ggplot2
p <- ggplot(df, aes(Var1, Var2, z= value)) +
  stat_contour(geom="polygon",aes(fill=stat(level))) +
  scale_fill_distiller(palette = "Spectral", direction = -1)

# Graph with ggplot2
p

# Convert to plotly
ggplotly(p)
