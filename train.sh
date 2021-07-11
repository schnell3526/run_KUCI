#!/bin/bash

#$ -l rt_G.small=1
#$ -l h_rt=3:00:00
#$ -j y
#$ -cwd

source /etc/profile.d/modules.sh
export LD_LIBRARY_PATH=$HOME/lib/:$LD_LIBRARY_PATH

module load gcc/9.3.0
module load python/3.8/3.8.7
module load cuda/11.0
module load cudnn/8.2/8.2.1
module load nccl/2.9/2.9.9-1

source /groups1/gcc50435/ito/work/bin/activate



python /groups1/gcc50435/ito/work/run_KUCI/train.py \
--model_name_or_path "cl-tohoku/bert-base-japanese-whole-word-masking" \
--do_train \
--do_eval \
--train_file "/groups1/gcc50435/ito/dataset/KUCI/train2.json" \
--validation_file "/groups1/gcc50435/ito/dataset/KUCI/test2.json" \
--learning_rate 5e-5 \
--num_train_epochs 3 \
--output_dir /groups1/gcc50435/ito/work/run_KUCI/result/out \
--cache_dir /groups1/gcc50435/ito/work/run_KUCI/result/cache \
--per_gpu_eval_batch_size=16 \
--per_device_train_batch_size=16 \
--max_seq_length 128 \
--pad_to_max_length