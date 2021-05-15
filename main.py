
import os
import pandas
import numpy


def getDots():
    dot_df = pandas.read_csv(
        filepath_or_buffer='./dots.csv',
        dtype={
            'order':    'object',
            'key':      'object',
            '<':        'object',
            'astre':    'object',
            'country':  'object',
            'city':     'object',
            'mass':     'float',
            'utc':      'object'
        },
        parse_dates=['utc'],
    )
    dot_df = dot_df.drop(labels=['order'], axis=1)
    return dot_df


def clearScreen():
   if os.name == 'posix':
      os.system('clear')
   else:
      os.system('cls')


def display(df):
    clearScreen()
    rows, columns = os.popen('stty size', 'r').read().split()
    sep = '-' * int(columns)
    print(sep)
    print(df)
    print(sep)
    print(df.dtypes)
    print(sep)
    print('shape :', df.shape, 'size', df.size)
    print(sep)


def run():
    dot_df = getDots()
    display(df=dot_df)


if __name__ == '__main__':
    run()
