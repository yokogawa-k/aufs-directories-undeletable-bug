# aufs のディレクトリが削除できない現象ついてのまとめ

ディレクトリの whiteout ファイルが一部の条件で生成されない

## 一部の条件とは

以下の様なディレクトリ

```
/
`-layer04
`-layer03
  `- bar （ディレクトリ）
`-layer02
  `- .wh.bar （bar が削除されているということを管理する aufs のシステムファイル = whiteout ファイル）
`-layer01
  `- bar （ディレクトリ）
```

これらを aufs でマウントする（layer04ディレクトリは書き込み可能とする）

```console
mount -t aufs -o br:layer04=rw:layer03=ro+wh:layer02=ro+wh:layer01=ro+wh none ./merge
```

**layer01** を一番下にしてその上に **layer02**、さらにその上に **layer03**、そして最後に **layer04** が書き込み可能でマウントしている。
つまり、この場合、`ls -l merge` すると **layer03/bar** がみえる。

そこで、`touch merge/bar` する。こうすると、**layer03/bar** が **layer04/bar** にコピーされた後に日付が更新される。

つづいて `rm -rf merge/bar` する。こうすると、**layer04/bar** が削除され同時に **layer04/.wh.bar** (whiteoutファイル) が作成されるのが正しいように考えられるが、whiteout が出来上がらない現象が発生

## 検証環境

`test-script.sh` を利用すると再現可能

- kernel 3.16.0.4(debian jessie)
- kernel 4.2.1 + aufs-4.2-20150928

上記環境で発生を確認

`test-script.sh` の出力

```console
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/layer01’
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/layer02’
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/layer03’
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/layer04’
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/merge’
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/layer01/bar’
removed directory: ‘/root/aufs-directories-undeletable-bug/merge/bar’
/root/aufs-directories-undeletable-bug/layer01
└── bar
/root/aufs-directories-undeletable-bug/layer02
├── .wh..wh.aufs
├── .wh..wh.orph
├── .wh..wh.plnk
└── .wh.bar
/root/aufs-directories-undeletable-bug/layer03
/root/aufs-directories-undeletable-bug/layer04
/root/aufs-directories-undeletable-bug/merge

3 directories, 2 files
mkdir: created directory ‘/root/aufs-directories-undeletable-bug/merge/bar’
/root/aufs-directories-undeletable-bug/layer01
└── bar
/root/aufs-directories-undeletable-bug/layer02
├── .wh..wh.aufs
├── .wh..wh.orph
├── .wh..wh.plnk
└── .wh.bar
/root/aufs-directories-undeletable-bug/layer03
├── .wh..wh.aufs
├── .wh..wh.orph
├── .wh..wh.plnk
└── bar
/root/aufs-directories-undeletable-bug/layer04
/root/aufs-directories-undeletable-bug/merge

6 directories, 3 files
total 12
drwxr-xr-x 10 root root 4096 10月  7 18:45 .
drwxr-xr-x  8 root root 4096 10月  7 18:45 ..
drwxr-xr-x  2 root root 4096 10月  7 18:45 bar
total 12
drwxr-xr-x 11 root root 4096 10月  7 18:45 .
drwxr-xr-x  8 root root 4096 10月  7 18:45 ..
drwxr-xr-x  2 root root 4096 10月  7 18:45 bar
removed directory: ‘/root/aufs-directories-undeletable-bug/merge/bar’
total 12
drwxr-xr-x 10 root root 4096 10月  7 18:45 .
drwxr-xr-x  8 root root 4096 10月  7 18:45 ..
drwxr-xr-x  2 root root 4096 10月  7 18:45 bar
```

## このレポジトリの各ファイルについて

- [テストスクリプト](./test-script.sh)
- [kernel 4.2.1 の環境での sysfs などの情報](./info-4.2.1.log.md)
- [debug on の時のログ](./debug-log.md)
- [コードリーディングのメモ](./code-reading-memo.md)
