#!/usr/bin/env python

import argparse
import os
import shutil


def process_lang8(src_dir, out_dir, dataset):
    entry_fname = os.path.join(src_dir, 'entries.' + dataset)
    src_fname = os.path.join(out_dir, 'paper-' + dataset + '.en')
    tgt_fname = os.path.join(out_dir, 'paper-' + dataset + '.gec')
    with open(entry_fname, 'r') as entry_file, \
            open(src_fname, 'w') as src_out, \
            open(tgt_fname, 'w') as tgt_out:
        for line in entry_file:
            line = line.strip()
            if len(line) == 0:
                continue

            parts = line.split("\t")
            sentence = parts[4]
            num_corrections = int(parts[0])
            # correct to correct
            if num_corrections == 0:
                src_out.write("{}\n".format(sentence))
                tgt_out.write("{}\n".format(sentence))
            else:
                for i in range(num_corrections):
                    correction = parts[5+i]
                    src_out.write("{}\n".format(sentence))
                    tgt_out.write("{}\n".format(correction))


def m2_to_ori(m2_fname, ori_fname,
              open_encoding='utf-8', save_encoding='utf-8'):
    with open(m2_fname, 'r', encoding=open_encoding) as m2_file, \
            open(ori_fname, 'w', encoding=save_encoding) as ori_file:
        for line in m2_file:
            if line.startswith('S'):
                tmp_list = line.split()
                line = ' '.join(tmp_list[1:])
                ori_file.write(line + '\n')


def process_conll14_testset(m2_fname, out_dir, dataset='test'):
    src_fname = os.path.join(out_dir, 'paper-' + dataset + '.en')
    tgt_fname = os.path.join(out_dir, 'paper-' + dataset + '.gec')
    m2_to_ori(m2_fname, src_fname)
    shutil.copyfile(src_fname, tgt_fname)


def process_conll13_testset(m2_fname, out_dir, dataset='valid'):
    process_conll14_testset(m2_fname, out_dir, dataset)


def main(opt):
    process_lang8(opt.train_srcdir, opt.out_dir, 'train')
    process_conll13_testset(opt.valid_m2fname, opt.out_dir, 'valid')
    process_conll14_testset(opt.test_m2fname, opt.out_dir, 'test')


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description='transform-paper.py',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-train_srcdir', required=True, help="Path to train files")
    parser.add_argument('-valid_m2fname', required=True, help="Url to valid m2 file")
    parser.add_argument('-test_m2fname', required=True, help="Url to test m2 file")
    parser.add_argument('-out_dir', required=True, help="Path for transformed data files")

    opt = parser.parse_args()
    main(opt)
