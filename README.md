# aufs のディレクトリが削除できない現象ついてのまとめ

ディレクトリの whiteout ファイルが一部の条件で生成されない

## 一部の条件とは

以下の様なディレクトリ

```
layer04
layer03
`- foo （ディレクトリ）
layer02
`- ..wh.foo （foo が削除されているということを管理する aufs のシステムファイル = whiteout ファイル）
layer01
`- foo （ディレクトリ）
```

これらを aufs でマウントする（layer04ディレクトリは書き込み可能とする）

```console
mount -t aufs -o br:layer04=rw:layer03=ro+wh:layer02=ro+wh:layer01=ro+wh none ./merge
```

**layer01** を一番下にしてその上に **layer02**、さらにその上に **layer03**、そして最後に **layer04** が書き込み可能でマウントしている。
つまり、この場合、`ls -l merge` すると **layer03/foo** がみえる。

そこで、`touch merge/foo` する。こうすると、**layer03/foo** が **layer04/foo** にコピーされた後に日付が更新される。

つづいて `rm -rf merge/foo` する。こうすると、**layer04/foo** が削除され同時に **layer04/..wh.foo** (whiteoutファイル) が作成されるのが正しいように考えられるが、whiteout が出来上がらない現象が発生

## 検証環境

test-script.sh を利用すると再現可能

- kernel 3.16.0.4(debian jessie)
- kernel 4.2.1 + aufs-4.2-20150928

上記環境で発生を確認

## このレポジトリの各ファイルについて

- [テストスクリプト](./test-script.sh)
- [kernel 4.2.1 の環境での sysfs などの情報](./info-4.2.1.log.md)
- [debug on の時のログ](./debug-log.md)
- [コードリーディングのメモ](./code-reading-memo.md)
