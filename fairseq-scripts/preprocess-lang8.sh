TEXT=../corpus/lang-8-fairseq

python ../fairseq/preprocess.py \
    --source-lang en \
    --target-lang gec \
    --trainpref $TEXT/lang8-train \
    --validpref $TEXT/lang8-valid \
    --testpref $TEXT/lang8-test \
    --destdir ../data-bin/lang-8-fairseq \
    --workers 4
