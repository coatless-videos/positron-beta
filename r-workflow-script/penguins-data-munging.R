# Install packages
install.packages(c("dplyr", "ggplot2", "plotly", "gt"))

# Load data ----
# Location of the data
url_penguins <- "https://github.com/coatless/raw-data/raw/main/penguins.csv"

# Download the data
download.file(url_penguins, "penguins.csv")

# Read the data in
penguins <- read.csv("penguins.csv")

# Check first 5 observations
head(penguins)

# Check last 5 observations
tail(penguins)

# Overview with glimpse
dplyr::glimpse(penguins)

# Cast sex to a factor
penguins$sex_factor <- as.factor(penguins$sex)

# View data using the interactive editor
View(penguins)

# Obtain a standard summary
summary(penguins)

# How about with skim?
skimr::skim(penguins)

# Install package, try again
install.packages("skimr")

# Graph the data with ggplot2
ggplot(data = penguins) +
  aes(x = flipper_length_mm, y = body_mass_g) +
  geom_point(aes(color = sex))

# Create a graph with base R
plot(penguins$flipper_length_mm, penguins$body_mass_g)

# Add a subset with a pipe
penguins %>%
  filter(!is.na(sex_factor)) %>%
  ggplot(aes(bill_depth_mm, bill_length_mm, color = sex_factor, size = body_mass_g)) +
  geom_point(alpha = 0.5) +
  facet_wrap(~species)

# View interactive
plotly::ggplotly()

# Count penguins by Species, where they reside, and their sex.
penguin_counts <- penguins |> 
  dplyr::group_by(species, island, sex_factor) |> 
  dplyr::count()

# Show counts inside of a gt table
penguin_counts %>%
  gt::gt()

