import os

# Declare and initialize variables

# you can use os. system to execute the Bash command
os.system("ls")

# Assigned Variables
ip = os.system ("ip -c a")
user= os.system("whoami")
specs = os.system("lshw -short")

#Printing listed variables
print(ip)
print(user)
print(specs)
