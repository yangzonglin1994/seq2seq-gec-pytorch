PROJECT_ROOT='../..'
CORPUS=$PROJECT_ROOT/corpus

./transform-paper.py \
    -train_srcdir $CORPUS/lang-8-en-1.0/ \
    -valid_m2fname $CORPUS/conll-2013-testset/original/data/official-preprocessed.m2 \
    -test_m2fname $CORPUS/conll14st-test-data/noalt/official-2014.combined.m2 \
    -out_dir $CORPUS/gec-paper
