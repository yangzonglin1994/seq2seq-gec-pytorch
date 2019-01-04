#!/bin/bash

if [ $# != 1 ]; then
    echo 'Usage: sys.out.fname'
    exit -1
fi

MODEL=$1
PROJECT_ROOT='../..'
CORPUS=$PROJECT_ROOT/corpus

SYSTEM=./$MODEL/conll-2014-test.out
GOLD=$CORPUS/conll14st-test-data/noalt/official-2014.combined.m2

./m2scorer -v $SYSTEM $GOLD
