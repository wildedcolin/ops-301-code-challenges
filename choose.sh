#!/bin/bash

while true; do
    clear
    echo "Menu:"
    echo "1. Hello world"
    echo "2. Ping self"
    echo "3. IP info"
    echo "4. Exit"
    read -p "Please enter your choice: " choice

    case $choice in
        1)
            echo "Hello world!"
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        2)
            ping -c 1 127.0.0.1
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        3)
            ifconfig
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            read -n 1 -s -r -p "Press any key to continue..."
            ;;
    esac
done