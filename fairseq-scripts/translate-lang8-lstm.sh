MODEL_DIR=../checkpoints/lstm

python ../fairseq/generate.py \
    ../data-bin/lang-8-fairseq/ \
    --path $MODEL_DIR/checkpoint_best.pt \
    --batch-size 128 \
    --beam 5
