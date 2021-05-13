
import pandas
import numpy


def getDots():
    dot_df = pandas.read_csv(filepath_or_buffer='./dots.csv')
    dot_df = dot_df.drop(labels=['order'], axis=1)
    return dot_df


def run():
    dot_df = getDots()
    print(dot_df)


if __name__ == '__main__':
    run()