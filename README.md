# run_KUCI

[KUCI](https://nlp.ist.i.kyoto-u.ac.jp/?KUCI)で[BERTの日本語事前学習済みモデル](https://huggingface.co/cl-tohoku/bert-base-japanese-whole-word-masking)をファインチューニングするためのスクリプト.

## 設定

requirements.txtをpipでインストールする.(以下のコマンドでインストールできる.)

```bash
bash install.sh
```

## 学習

以下のコマンドでジョブ発行する.

```bash
qsub -g $ID_GROUP train.sh
```