import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import linregress

def draw_plot():
    # Read data from file
  data = pd.read_csv('epa-sea-level.csv')

    # Create scatter plot
  plt.figure(figsize=(10, 6))
  plt.scatter(data['Year'], data['CSIRO Adjusted Sea Level'], color='b', alpha=0.7, label='Original Data')

    # Create first line of best fit
  slope, intercept, r_value, p_value, std_err = linregress(data['Year'], data['CSIRO Adjusted Sea Level'])
  line_x = list(range(1880, 2051))
  line_y = [slope * x + intercept for x in line_x]
  plt.plot(line_x, line_y, color='r', label='Line of Best Fit (1880-2050)')

    # Create second line of best fit
  recent_data = data[data['Year'] >= 2000]
  slope_recent, intercept_recent, _, _, _ = linregress(recent_data['Year'], recent_data['CSIRO Adjusted Sea Level'])
  line_x_recent = list(range(2000, 2051))
  line_y_recent = [slope_recent * x + intercept_recent for x in line_x_recent]
  plt.plot(line_x_recent, line_y_recent, color='g', label='Line of Best Fit (2000-2050)')

    # Add labels and title
  plt.xlabel('Year')
  plt.ylabel('Sea Level (inches)')
  plt.title('Rise in Sea Level')
  plt.legend()
    
    # Save plot and return data for testing (DO NOT MODIFY)
  plt.savefig('sea_level_plot.png')
  return plt.gca()