

au_wr_dir_need_wh

```c:fs/aufs/i_op_del.c
 24 /*
 25  * decide if a new whiteout for @dentry is necessary or not.
 26  * when it is necessary, prepare the parent dir for the upper branch whose
 27  * branch index is @bcpup for creation. the actual creation of the whiteout will
 28  * be done by caller.
 29  * return value:
 30  * 0: wh is unnecessary
 31  * plus: wh is necessary
 32  * minus: error
 33  */
 34 int au_wr_dir_need_wh(struct dentry *dentry, int isdir, aufs_bindex_t *bcpup)
 35 {
 36 	int need_wh, err;
 37 	aufs_bindex_t bstart;
 38 	struct super_block *sb;
 39
 40 	sb = dentry->d_sb; /* super_block: The root of the dentry tree */
 41 	bstart = au_dbstart(dentry);
 42 	if (*bcpup < 0) {
 43 		*bcpup = bstart;
 44 		if (au_test_ro(sb, bstart, d_inode(dentry))) {
 45 			err = AuWbrCopyup(au_sbi(sb), dentry);
 46 			*bcpup = err;
 47 			if (unlikely(err < 0))
 48 				goto out;
 49 		}
 50 	} else
 51 		AuDebugOn(bstart < *bcpup
 52 			  || au_test_ro(sb, *bcpup, d_inode(dentry)));
 53 	AuDbg("bcpup %d, bstart %d\n", *bcpup, bstart);
 54
 55 	if (*bcpup != bstart) {
 56 		err = au_cpup_dirs(dentry, *bcpup);
 57 		if (unlikely(err))
 58 			goto out;
 59 		need_wh = 1;
 60 	} else {
 61 		struct au_dinfo *dinfo, *tmp;
 62
 63 		need_wh = -ENOMEM;
 64 		dinfo = au_di(dentry);
 65 		tmp = au_di_alloc(sb, AuLsc_DI_TMP);
 66 		if (tmp) {
 67 			au_di_cp(tmp, dinfo);
 68 			au_di_swap(tmp, dinfo);
 69 			/* returns the number of positive dentries */
 70 			need_wh = au_lkup_dentry(dentry, bstart + 1, /*type*/0);
 71 			au_di_swap(tmp, dinfo);
 72 			au_rw_write_unlock(&tmp->di_rwsem);
 73 			au_di_free(tmp);
 74 		}
 75 	}
 76 	AuDbg("need_wh %d\n", need_wh);
 77 	err = need_wh;
 78
 79 out:
 80 	return err;
 81 }
```
 

au_dbstart

```c:fs/aufs/dentry.h
166 static inline aufs_bindex_t au_dbstart(struct dentry *dentry)
167 {
168 	DiMustAnyLock(dentry);
169 	return au_di(dentry)->di_bstart;
170 }
```

au_di

```c:fs/aufs/dentry.h
 94 static inline struct au_dinfo *au_di(struct dentry *dentry)
 95 {
 96 	return dentry->d_fsdata; /* fs-specific data */
 97 }
```

aufs_bindex_t

```c:include/uapi/linux/aufs_type.h
 49 #ifdef CONFIG_AUFS_BRANCH_MAX_127
 50 typedef int8_t aufs_bindex_t;
 51 #define AUFS_BRANCH_MAX 127
 52 #else
 53 typedef int16_t aufs_bindex_t;
 54 #ifdef CONFIG_AUFS_BRANCH_MAX_511
 55 #define AUFS_BRANCH_MAX 511
 56 #elif defined(CONFIG_AUFS_BRANCH_MAX_1023)
 57 #define AUFS_BRANCH_MAX 1023
 58 #elif defined(CONFIG_AUFS_BRANCH_MAX_32767)
 59 #define AUFS_BRANCH_MAX 32767
 60 #endif
 61 #endif
```
 

au_dinfo

```c:fs/aufs/dentry.h
 35 struct au_dinfo {
 36 	atomic_t		di_generation;
 37
 38 	struct au_rwsem»	di_rwsem;
 39 	aufs_bindex_t»--	di_bstart, di_bend, di_bwh, di_bdiropq;
 40 	unsigned char»--	di_tmpfile; /* to allow the different name */
 41 	struct au_hdentry»--*di_hdentry;
 42 } ____cacheline_aligned_in_smp;
```

dentry

```c:kernel/include/linux/dcache.h
108 struct dentry {
109 	/* RCU lookup touched fields */
110 	unsigned int d_flags;»--	/* protected by d_lock */
111 	seqcount_t d_seq;»--	/* per dentry seqlock */
112 	struct hlist_bl_node d_hash;	/* lookup hash list */
113 	struct dentry *d_parent;	/* parent directory */
114 	struct qstr d_name;
115 	struct inode *d_inode;»-	/* Where the name belongs to - NULL is
116 					 * negative */
117 	unsigned char d_iname[DNAME_INLINE_LEN];	/* small names */
118 
119 	/* Ref lookup also touches following */
120 	struct lockref d_lockref;»--/* per-dentry lock and refcount */
121 	const struct dentry_operations *d_op;
122 	struct super_block *d_sb;»--/* The root of the dentry tree */
123 	unsigned long d_time;»--	/* used by d_revalidate */
124 	void *d_fsdata;»		/* fs-specific data */
125 
126 	struct list_head d_lru;»	/* LRU list */
127 	struct list_head d_child;»--/* child of parent list */
128 	struct list_head d_subdirs;»/* our children */
129 	/*
130 	 * d_alias and d_rcu can share memory
131 	 */
132 	union {
133 		struct hlist_node d_alias;»-/* inode alias list */
134 	 »--struct rcu_head d_rcu;
135 	} d_u;
136 };
```


