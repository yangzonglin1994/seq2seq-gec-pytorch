PROJECT_ROOT='../..'
TEXT=$PROJECT_ROOT/corpus/lang-8-fairseq

python $PROJECT_ROOT/fairseq/preprocess.py \
    --source-lang en \
    --target-lang gec \
    --trainpref $TEXT/lang8-train \
    --validpref $TEXT/lang8-valid \
    --testpref $TEXT/lang8-test \
    --destdir $PROJECT_ROOT/data-bin/lang-8-fairseq \
    --workers 4
