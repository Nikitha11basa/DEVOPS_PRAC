# file1.py

import csv
import os

# Define file path for storing member data
file_path = '/data/members.csv'

# Sample data (eno, name, age)
members_data = [
    {'eno': 1, 'name': 'John', 'age': 25},
    {'eno': 2, 'name': 'Alice', 'age': 30},
    {'eno': 3, 'name': 'Bob', 'age': 22}
]

def write_members_to_file():
    # Check if the file already exists
    file_exists = os.path.exists(file_path)
    
    # Open the file in append mode, or create it if it doesn't exist
    with open(file_path, mode='w', newline='') as file:
        fieldnames = ['eno', 'name', 'age']
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        
        # Write headers only if the file does not exist
        if not file_exists:
            writer.writeheader()
        
        # Write data to the file
        writer.writerows(members_data)
        print("Members data written to:", file_path)

if __name__ == "__main__":
    write_members_to_file()
