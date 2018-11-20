PROJECT_ROOT='../..'
TEXT=$PROJECT_ROOT/corpus/gec-paper

python $PROJECT_ROOT/fairseq/preprocess.py \
    --source-lang en \
    --target-lang gec \
    --trainpref $TEXT/paper-train \
    --validpref $TEXT/paper-valid \
    --testpref $TEXT/paper-test \
    --destdir $PROJECT_ROOT/data-bin/gec-paper/ \
    --workers 4
