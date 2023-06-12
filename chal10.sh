# Create a new .txt file
file_path = "example.txt"
file = open(file_path, "w")

# Append three lines to the file
file.write("This is line 1.\n")
file.write("This is line 2.\n")
file.write("This is line 3.\n")

# Close the file
file.close()

# Open the file again to read the first line
file = open(file_path, "r")
first_line = file.readline()
print("First line:", first_line)

# Close the file
file.close()

# Delete the .txt file
import os
os.remove(file_path)
