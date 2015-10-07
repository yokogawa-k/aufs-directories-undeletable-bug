#### touch ${MERGE}/bar

```
kernel: aufs h_d_revalidate:853:touch[1084]: DEBUG: b1, bar
kernel: aufs h_d_revalidate:853:touch[1084]: DEBUG: b1, bar
kernel: aufs au_wbr_create_tdp:300:touch[1084]: DEBUG: b0
kernel: aufs au_wr_dir:509:touch[1084]: DEBUG: bstart 1, bcpup 0
kernel: aufs au_fhsm_wrote:135:touch[1084]: DEBUG: b0, force 0
kernel: aufs au_cpup_xattr:145:touch[1084]: DEBUG: err 0, ssz 0
kernel: aufs au_do_ren_after_cpup:652:touch[1084]: DEBUG: .wh..wh.bar.0004 bar
```

#### ls -la ${MERGE}

```
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs aufs_iterate:473:ls[1085]: DEBUG: /, ctx{filldir, 0}
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer04, ctx{fillvdir, 0}
kernel: aufs au_nhash_append_wh:249:ls[1085]: DEBUG: .wh.orph
kernel: aufs au_nhash_append_wh:249:ls[1085]: DEBUG: .wh.plnk
kernel: aufs au_nhash_append_wh:249:ls[1085]: DEBUG: .wh.aufs
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer04, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer03, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:ls[1085]: DEBUG: ..
kernel: aufs au_nhash_test_known_wh:206:ls[1085]: DEBUG: .wh.orph
kernel: aufs test_known:223:ls[1085]: DEBUG: bar
kernel: aufs au_nhash_test_known_wh:206:ls[1085]: DEBUG: .wh.plnk
kernel: aufs au_nhash_test_known_wh:206:ls[1085]: DEBUG: .wh.aufs
kernel: aufs test_known:223:ls[1085]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer03, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer02, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:ls[1085]: DEBUG: ..
kernel: aufs au_nhash_test_known_wh:206:ls[1085]: DEBUG: .wh.orph
kernel: aufs au_nhash_append_wh:249:ls[1085]: DEBUG: bar
kernel: aufs au_nhash_test_known_wh:206:ls[1085]: DEBUG: .wh.plnk
kernel: aufs au_nhash_test_known_wh:206:ls[1085]: DEBUG: .wh.aufs
kernel: aufs test_known:223:ls[1085]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer02, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer01, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:ls[1085]: DEBUG: ..
kernel: aufs test_known:223:ls[1085]: DEBUG: bar
kernel: aufs test_known:223:ls[1085]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:ls[1085]: DEBUG: layer01, ctx{fillvdir, 9223372036854775807}
kernel: aufs seek_vdir:801:ls[1085]: DEBUG: offset 0
kernel: aufs au_vdir_fill_de:863:ls[1085]: DEBUG: .., off0, i11, dt4
kernel: aufs au_vdir_fill_de:863:ls[1085]: DEBUG: bar, off16, i12, dt4
kernel: aufs au_vdir_fill_de:863:ls[1085]: DEBUG: ., off32, i2, dt4
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, bar
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, bar
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, bar
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, bar
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1085]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1085]: DEBUG: err -61
kernel: aufs aufs_iterate:473:ls[1085]: DEBUG: /, ctx{filldir, 48}
kernel: aufs seek_vdir:801:ls[1085]: DEBUG: offset 48
```

#### rm -vrf ${MERGE}/bar

```
kernel: aufs h_d_revalidate:853:rm[1086]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:rm[1086]: DEBUG: b1, bar
kernel: aufs h_d_revalidate:853:rm[1086]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:rm[1086]: DEBUG: b1, bar
kernel: aufs aufs_iterate:473:rm[1086]: DEBUG: bar, ctx{filldir, 0}
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{fillvdir, 0}
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:rm[1086]: DEBUG: ..
kernel: aufs test_known:223:rm[1086]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{fillvdir, 9223372036854775807}
kernel: aufs seek_vdir:801:rm[1086]: DEBUG: offset 0
kernel: aufs au_vdir_fill_de:863:rm[1086]: DEBUG: .., off0, i2, dt4
kernel: aufs au_vdir_fill_de:863:rm[1086]: DEBUG: ., off16, i12, dt4
kernel: aufs aufs_iterate:473:rm[1086]: DEBUG: bar, ctx{filldir, 32}
kernel: aufs seek_vdir:801:rm[1086]: DEBUG: offset 32
kernel: aufs h_d_revalidate:853:rm[1086]: DEBUG: b0, bar
kernel: aufs h_d_revalidate:853:rm[1086]: DEBUG: b1, bar
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{test_empty_cb, 0}
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{test_empty_cb, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{test_empty_cb, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:rm[1086]: DEBUG: bar, ctx{test_empty_cb, 9223372036854775807}
kernel: aufs au_wr_dir_need_wh:53:rm[1086]: DEBUG: bcpup 0, bstart 0
kernel: aufs au_wr_dir_need_wh:76:rm[1086]: DEBUG: need_wh 0
```

#### ls -la ${MERGE}

```
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs aufs_iterate:473:ls[1087]: DEBUG: /, ctx{filldir, 0}
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer04, ctx{fillvdir, 0}
kernel: aufs au_nhash_append_wh:249:ls[1087]: DEBUG: .wh.orph
kernel: aufs au_nhash_append_wh:249:ls[1087]: DEBUG: .wh.plnk
kernel: aufs au_nhash_append_wh:249:ls[1087]: DEBUG: .wh.aufs
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer04, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer03, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:ls[1087]: DEBUG: ..
kernel: aufs au_nhash_test_known_wh:206:ls[1087]: DEBUG: .wh.orph
kernel: aufs au_xino_new_ino:672:ls[1087]: DEBUG: i12
kernel: aufs au_nhash_test_known_wh:206:ls[1087]: DEBUG: .wh.plnk
kernel: aufs au_nhash_test_known_wh:206:ls[1087]: DEBUG: .wh.aufs
kernel: aufs test_known:223:ls[1087]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer03, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer02, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:ls[1087]: DEBUG: ..
kernel: aufs au_nhash_test_known_wh:206:ls[1087]: DEBUG: .wh.orph
kernel: aufs au_nhash_append_wh:249:ls[1087]: DEBUG: bar
kernel: aufs au_nhash_test_known_wh:206:ls[1087]: DEBUG: .wh.plnk
kernel: aufs au_nhash_test_known_wh:206:ls[1087]: DEBUG: .wh.aufs
kernel: aufs test_known:223:ls[1087]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer02, ctx{fillvdir, 9223372036854775807}
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer01, ctx{fillvdir, 9223372036854775807}
kernel: aufs test_known:223:ls[1087]: DEBUG: ..
kernel: aufs test_known:223:ls[1087]: DEBUG: bar
kernel: aufs test_known:223:ls[1087]: DEBUG: .
kernel: aufs vfsub_iterate_dir:543:ls[1087]: DEBUG: layer01, ctx{fillvdir, 9223372036854775807}
kernel: aufs seek_vdir:801:ls[1087]: DEBUG: offset 0
kernel: aufs au_vdir_fill_de:863:ls[1087]: DEBUG: .., off0, i11, dt4
kernel: aufs au_vdir_fill_de:863:ls[1087]: DEBUG: ., off16, i2, dt4
kernel: aufs au_vdir_fill_de:863:ls[1087]: DEBUG: bar, off32, i12, dt4
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b0, layer04
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, layer03
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b2, layer02
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b3, layer01
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs au_lkup_dentry:216:ls[1087]: DEBUG: positive
kernel: aufs au_new_inode:379:ls[1087]: DEBUG: i12
kernel: aufs au_new_inode:385:ls[1087]: DEBUG: 8, new 1
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, bar
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, bar
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs h_d_revalidate:853:ls[1087]: DEBUG: b1, bar
kernel: aufs au_lgxattr:247:ls[1087]: DEBUG: err -61
kernel: aufs aufs_iterate:473:ls[1087]: DEBUG: /, ctx{filldir, 48}
kernel: aufs seek_vdir:801:ls[1087]: DEBUG: offset 48
```

#### 普通の rm

```
kernel: aufs h_d_revalidate:853:rm[1181]: DEBUG: b1, bar
kernel: aufs h_d_revalidate:853:rm[1181]: DEBUG: b1, bar
kernel: aufs aufs_iterate:473:rm[1181]: DEBUG: bar, ctx{filldir, 0}
kernel: aufs vfsub_iterate_dir:543:rm[1181]: DEBUG: bar, ctx{fillvdir, 0}
kernel: aufs vfsub_iterate_dir:543:rm[1181]: DEBUG: bar, ctx{fillvdir, 9223372036854775807}
kernel: aufs seek_vdir:801:rm[1181]: DEBUG: offset 0
kernel: aufs au_vdir_fill_de:863:rm[1181]: DEBUG: .., off0, i2, dt4
kernel: aufs au_vdir_fill_de:863:rm[1181]: DEBUG: ., off16, i12, dt4
kernel: aufs aufs_iterate:473:rm[1181]: DEBUG: bar, ctx{filldir, 32}
kernel: aufs seek_vdir:801:rm[1181]: DEBUG: offset 32
kernel: aufs h_d_revalidate:853:rm[1181]: DEBUG: b1, bar
kernel: aufs vfsub_iterate_dir:543:rm[1181]: DEBUG: bar, ctx{test_empty_cb, 0}
kernel: aufs vfsub_iterate_dir:543:rm[1181]: DEBUG: bar, ctx{test_empty_cb, 9223372036854775807}
kernel: aufs au_wbr_create_tdp:300:rm[1181]: DEBUG: b0
kernel: aufs au_wr_dir_need_wh:53:rm[1181]: DEBUG: bcpup 0, bstart 1
kernel: aufs au_wr_dir_need_wh:76:rm[1181]: DEBUG: need_wh 1
kernel: aufs au_fhsm_wrote:135:rm[1181]: DEBUG: b0, force 0
```

