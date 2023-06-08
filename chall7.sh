#!/usr/bin/env python3

import os

def generate_directory_structure(new):
    for (root, dirs, files) in os.walk(new):
        print("Root directory:", root)
        print("Subdirectories:", dirs)
        print("Files:", files)
        print()

def main():
    user_input = input("Enter the directory path: ")
    generate_directory_structure(user_input)

if __name__ == "__main__":
    main()
  
