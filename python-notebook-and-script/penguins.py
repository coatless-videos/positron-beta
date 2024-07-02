# %%

# File Download Helper
def download_file(url, filename=None):
    import requests
    from urllib.parse import urlsplit


    if filename is None:
           # Extract the last part of the URL to use as the filename
         filename = urlsplit(url).path.split('/')[-1]
 
    # Download the file from the URL
    response = requests.get(url)
    
    # Check if the request was successful
    if response.status_code == 200:
        # Save the content to a file
        with open(filename, 'wb') as file:
            file.write(response.content)
        print(f"File downloaded successfully and saved as {filename}")
    else:
        print(f"Failed to download file. Status code: {response.status_code}")

# %% 
url_penguins = "https://github.com/coatless/raw-data/raw/main/penguins.csv"
download_file(url_penguins)

# %% 
import pandas as pd
penguins = pd.read_csv('penguins.csv')

# %%
penguins.head()

# %%
from plotnine import ggplot, aes, geom_point, labs

(
  ggplot(penguins)
  + aes(x = "flipper_length_mm", y = "bill_length_mm", color = "species")
  + geom_point()
  + labs(
    title = "Bill Length (mm) vs. Flipper length (mm)",
    x = "Flipper Length (mm)",
    y = "Bill length (mm)"
  )
)

# %% 

import seaborn as sns
import matplotlib.pyplot as plt

# Load data from Seaborn
penguins = sns.load_dataset("penguins")

# Construct scatterplot by groups
sns.scatterplot(
  data = penguins,
  x = "flipper_length_mm",
  y = "bill_length_mm",
  hue = "species"
)

# Modify seaborn graph by using matplotlib functions
plt.title('Bill Length (mm) vs. Flipper length (mm)')
plt.xlabel('Flipper length (mm)')
plt.ylabel('Bill length (mm)')

plt.show()

# %%
# Import the necessaries libraries
import plotly.express as px

# Explicitly set the renderer
# https://plotly.com/python/renderers/
import plotly.io as pio
pio.renderers.default = "vscode"
# ^^ Set to VS Code in script mode

# Load data from Seaborn
import seaborn as sns
penguins = sns.load_dataset("penguins")

# Create Scatterplot
fig = px.scatter(
  penguins,
  # Variables
  x = "flipper_length_mm", y = "bill_length_mm", color = "species",
  color_discrete_sequence = ['red', 'green', 'blue'],
  # Data in hover
  hover_data = ['flipper_length_mm', 'bill_length_mm'],
  # Manually set labels with Python dictionary
  # "variable": "New Display Label"
  labels = {
    'flipper_length_mm': 'Flipper length (mm)',
    'bill_length_mm': 'Bill length (mm)',
    'species': "Penguin Species"
  },
  # Main title of plot
  title = "Bill Length (mm) vs. Flipper length (mm)"
)

# Display the figure
fig.show()