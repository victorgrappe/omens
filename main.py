
import pandas
import numpy

import term

def getDots():
    dot_df = pandas.read_csv(
        filepath_or_buffer='./dots.csv',
        dtype='object',
    )
    dot_df = dot_df.drop(labels=['order'], axis=1)
    return dot_df


def split(df):
    inc_coll = list(df.columns.values)
    inc_coll.remove('key')
    inc_coll.remove('<')
    key_df = df[['key']]
    hier_df = df[['<']]
    inc_df = df[inc_coll]
    return key_df, hier_df, inc_df


def run():
    term.clear()
    dot_df = getDots()
    print(dot_df); term.separtor()

    key_df, hier_df, inc_df = split(df=dot_df)
    print(key_df); term.separtor()


if __name__ == '__main__':
    run()
