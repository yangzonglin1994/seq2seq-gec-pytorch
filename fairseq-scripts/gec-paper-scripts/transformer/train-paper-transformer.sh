PROJECT_ROOT='../../..'
DATASET='gec-paper'
MODEL=transformer
CHECKPOINT_DIR=$PROJECT_ROOT/checkpoints/$DATASET/$MODEL

test ! -e $CHECKPOINT_DIR && mkdir -p $CHECKPOINT_DIR

CUDA_VISIBLE_DEVICES=0 python $PROJECT_ROOT/fairseq/train.py \
  $PROJECT_ROOT/data-bin/$DATASET/ \
  -a transformer --optimizer adam --lr 0.0005 -s en -t gec \
  --label-smoothing 0.1 --dropout 0.1 --max-tokens 1000 \
  --min-lr '1e-09' --lr-scheduler inverse_sqrt --weight-decay 1e-5 \
  --criterion label_smoothed_cross_entropy --max-update 200000 \
  --warmup-updates 4000 --warmup-init-lr '1e-07' \
  --adam-betas '(0.9, 0.98)' \
  --save-dir $CHECKPOINT_DIR/
