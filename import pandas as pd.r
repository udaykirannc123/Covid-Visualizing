import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
file_path = 'complete.csv'
data = pd.read_csv(file_path)

# Ensure numeric data types for specific columns
data['New recovered'] = pd.to_numeric(data['New recovered'], errors='coerce')
data['Death'] = pd.to_numeric(data['Death'], errors='coerce')
data['Cured/Discharged/Migrated'] = pd.to_numeric(data['Cured/Discharged/Migrated'], errors='coerce')

# Top 10 states by new recovered cases
top_states_recovered = data.nlargest(10, 'New recovered')

# 1. Bar Plot: Top 3 states by confirmed COVID-19 cases
plt.figure(figsize=(12, 6))
plt.bar(top_states_recovered['Name of State / UT'], top_states_recovered['Total Confirmed cases'], color='green')
plt.title('Top 3 Indian States by Total Confirmed COVID-19 Cases')
plt.xlabel('State / Union Territory')
plt.ylabel('Total Confirmed Cases')
plt.xticks(rotation=45)
plt.show()

# 2. Line Plot: New cases in top states
plt.figure(figsize=(12, 6))
plt.plot(top_states_recovered['Name of State / UT'], top_states_recovered['New cases'], marker='o', color='blue', linestyle='-')
plt.title('New COVID-19 Cases in Top States')
plt.xlabel('State / Union Territory')
plt.ylabel('New Cases')
plt.xticks(rotation=45)
plt.show()

# 3. Pie Chart: Distribution of New Recovered Cases Across India
state_recovery_data = data.groupby('Name of State / UT')['New recovered'].sum()
plt.figure(figsize=(8, 8))
plt.pie(state_recovery_data, labels=state_recovery_data.index, autopct='%1.1f%%', startangle=140, colors=plt.cm.Pastel1.colors)
plt.title('Distribution of New Recovered Cases Across India')
plt.show()