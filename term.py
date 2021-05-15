import os

def clear():
   if os.name == 'posix':
      os.system('clear')
   else:
      os.system('cls')

def separtor():
    rows, columns = os.popen('stty size', 'r').read().split()
    separator = '-' * int(columns)
    print(separator)
