# Write a code to convert CSV file to excel file
# Write the option to sort and search the data in the excel file
# Write the option to plot the data in the excel file
# also make GUI interface for the same

import csv
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import sys
import os
import tkinter as tk
from tkinter import filedialog

# Function to convert CSV file to excel file
def csv_to_excel():
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    print(file_path)
    df = pd.read_csv(file_path)
    df.to_excel('output.xlsx', index=False)
    print("CSV file converted to excel file")

# Function to sort the data in the excel file
def sort_data():
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    print(file_path)
    df = pd.read_excel(file_path)
    print("Enter the column name to sort the data")
    col_name = input()
    df = df.sort_values(col_name)
    df.to_excel('output.xlsx', index=False)
    print("Data sorted successfully")

# Function to search the data in the excel file
def search_data():
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    print(file_path)
    df = pd.read_excel(file_path)
    print("Enter the column name to search the data")
    col_name = input()
    print("Enter the value to search")
    value = input()
    df = df[df[col_name] == value]
    df.to_excel('output.xlsx', index=False)
    print("Data searched successfully")

# Function to plot the data in the excel file
def plot_data():
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    print(file_path)
    df = pd.read_excel(file_path)
    print("Enter the column name to plot the data")
    col_name = input()
    plt.plot(df[col_name])
    plt.show()

# Function to exit the program
def exit_program():
    sys.exit()

# Function to display the menu
def display_menu():
    print("1. Convert CSV file to excel file")
    print("2. Sort the data in the excel file")
    print("3. Search the data in the excel file")
    print("4. Plot the data in the excel file")
    print("5. Exit the program")
    print("Enter your choice")

# Main function
def main():
    while True:
        display_menu()
        choice = int(input())
        if choice == 1:
            csv_to_excel()
        elif choice == 2:
            sort_data()
        elif choice == 3:
            search_data()
        elif choice == 4:
            plot_data()
        elif choice == 5:
            exit_program()
        else:
            print("Invalid choice")

if __name__ == "__main__":
    main()