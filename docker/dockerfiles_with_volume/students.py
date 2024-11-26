# file2.py

import csv
import os

# Define file path for storing student data
file_path = '/data/students.csv'

# Sample data (id, name, class)
students_data = [
    {'id': 101, 'name': 'Tom', 'class': 'Math'},
    {'id': 102, 'name': 'Jerry', 'class': 'Science'},
    {'id': 103, 'name': 'Mickey', 'class': 'English'}
]

def write_students_to_file():
    # Check if the file already exists
    file_exists = os.path.exists(file_path)
    
    # Open the file in append mode, or create it if it doesn't exist
    with open(file_path, mode='w', newline='') as file:
        fieldnames = ['id', 'name', 'class']
        writer = csv.DictWriter(file, fieldnames=fieldnames)
        
        # Write headers only if the file does not exist
        if not file_exists:
            writer.writeheader()
        
        # Write data to the file
        writer.writerows(students_data)
        print("Students data written to:", file_path)

if __name__ == "__main__":
    write_students_to_file()
