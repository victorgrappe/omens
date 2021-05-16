
import pandas
import numpy
from scipy import sparse

import term


def getDots(path):
    dot_df = pandas.read_csv(
        filepath_or_buffer=path,
        dtype='object',
    )
    dot_df = dot_df.drop(labels=['order'], axis=1)
    dot_df.insert(0, 'index', numpy.arange(dot_df.shape[0]))
    print(dot_df); term.separtor()
    return dot_df


def toArray(dot_df):

    def getDotKey(dot_df):
        dot_key_aa = dot_df['key'].to_numpy()
        return dot_key_aa

    def getDotCls(dot_df):
        dot_key_ds = dot_df[['index', 'key']].set_index(keys=['key'], drop=True, append=False, inplace=False, verify_integrity=True)['index']

        dot_cls_df = dot_df[['index', '<']][dot_df['<'].notnull()]
        dot_cls_df['<'] = dot_cls_df['<'].map(arg=dot_key_ds, na_action='ignore')

        dot_cls_I_a = dot_cls_df['<'].to_numpy()
        dot_cls_J_a = dot_cls_df['index'].to_numpy()
        dot_cls_V_a = numpy.full((dot_cls_I_a.shape[0],), 1, dtype='int64')

        dot_cls_to_aa = sparse.coo_matrix((dot_cls_V_a, (dot_cls_I_a, dot_cls_J_a)), shape=(dot_df.shape[0], dot_df.shape[0])).toarray()
        #dot_cls_from_aa = - dot_cls_to_aa.transpose()
        dot_cls_aa = dot_cls_to_aa #+ dot_cls_from_aa
        return dot_cls_aa

    dot_key_a = getDotKey(dot_df=dot_df)
    dot_cls_aa = getDotCls(dot_df=dot_df)
    return dot_key_a, dot_cls_aa


def run():
    term.clear()
    dot_df = getDots(path='./dots.csv')
    dot_key_a, dot_cls_aa = toArray(dot_df=dot_df)
    print(dot_key_a); term.separtor()
    print(dot_cls_aa); term.separtor()


if __name__ == '__main__':
    run()
