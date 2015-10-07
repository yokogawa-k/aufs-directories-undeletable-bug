```console
debian-jessie:~/aufs-test# cat /proc/mounts
sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
udev /dev devtmpfs rw,relatime,size=10240k,nr_inodes=61036,mode=755 0 0
devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
tmpfs /run tmpfs rw,nosuid,relatime,size=101112k,mode=755 0 0
/dev/sda1 / ext4 rw,relatime,errors=remount-ro,data=ordered 0 0
securityfs /sys/kernel/security securityfs rw,nosuid,nodev,noexec,relatime 0 0
tmpfs /dev/shm tmpfs rw,nosuid,nodev 0 0
tmpfs /run/lock tmpfs rw,nosuid,nodev,noexec,relatime,size=5120k 0 0
tmpfs /sys/fs/cgroup tmpfs ro,nosuid,nodev,noexec,mode=755 0 0
cgroup /sys/fs/cgroup/systemd cgroup rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/lib/systemd/systemd-cgroups-agent,name=systemd 0 0
pstore /sys/fs/pstore pstore rw,nosuid,nodev,noexec,relatime 0 0
cgroup /sys/fs/cgroup/cpuset cgroup rw,nosuid,nodev,noexec,relatime,cpuset 0 0
cgroup /sys/fs/cgroup/cpu,cpuacct cgroup rw,nosuid,nodev,noexec,relatime,cpu,cpuacct 0 0
cgroup /sys/fs/cgroup/blkio cgroup rw,nosuid,nodev,noexec,relatime,blkio 0 0
cgroup /sys/fs/cgroup/memory cgroup rw,nosuid,nodev,noexec,relatime,memory 0 0
cgroup /sys/fs/cgroup/devices cgroup rw,nosuid,nodev,noexec,relatime,devices 0 0
cgroup /sys/fs/cgroup/freezer cgroup rw,nosuid,nodev,noexec,relatime,freezer 0 0
cgroup /sys/fs/cgroup/net_cls,net_prio cgroup rw,nosuid,nodev,noexec,relatime,net_cls,net_prio 0 0
cgroup /sys/fs/cgroup/perf_event cgroup rw,nosuid,nodev,noexec,relatime,perf_event 0 0
cgroup /sys/fs/cgroup/hugetlb cgroup rw,nosuid,nodev,noexec,relatime,hugetlb 0 0
systemd-1 /proc/sys/fs/binfmt_misc autofs rw,relatime,fd=22,pgrp=1,timeout=300,minproto=5,maxproto=5,direct 0 0
hugetlbfs /dev/hugepages hugetlbfs rw,relatime 0 0
debugfs /sys/kernel/debug debugfs rw,relatime 0 0
mqueue /dev/mqueue mqueue rw,relatime 0 0
rpc_pipefs /run/rpc_pipefs rpc_pipefs rw,relatime 0 0
none /root/aufs-test/merge aufs rw,relatime,si=281b3cc259ea3b9 0 0

debian-jessie:~/aufs-test# find /sys/module/aufs/ -type f | xargs head
==> /sys/module/aufs/parameters/brs <==
1

==> /sys/module/aufs/parameters/debug <==
0

==> /sys/module/aufs/parameters/sysrq <==
a

==> /sys/module/aufs/parameters/allow_userns <==
N

==> /sys/module/aufs/version <==
4.2-20150928
head: cannot open ‘/sys/module/aufs/uevent’ for reading: Permission denied

debian-jessie:~/aufs-test# find /sys/fs/aufs/ -type f | xargs head
==> /sys/fs/aufs/si_281b3cc259ea3b9/br0 <==
/root/aufs-test/layer04=rw

==> /sys/fs/aufs/si_281b3cc259ea3b9/br1 <==
/root/aufs-test/layer03=ro+wh

==> /sys/fs/aufs/si_281b3cc259ea3b9/br2 <==
/root/aufs-test/layer02=ro+wh

==> /sys/fs/aufs/si_281b3cc259ea3b9/br3 <==
/root/aufs-test/layer01=ro+wh

==> /sys/fs/aufs/si_281b3cc259ea3b9/xi_path <==
/root/aufs-test/layer04/.aufs.xino

==> /sys/fs/aufs/si_281b3cc259ea3b9/brid0 <==
512

==> /sys/fs/aufs/si_281b3cc259ea3b9/brid1 <==
513

==> /sys/fs/aufs/si_281b3cc259ea3b9/brid2 <==
514

==> /sys/fs/aufs/si_281b3cc259ea3b9/brid3 <==
515

debian-jessie:~/aufs-test# uname -a
Linux debian-jessie 4.2.1-2-aufs #1 SMP Mon Sep 28 22:01:19 JST 2015 x86_64 GNU/Linux

debian-jessie:~/aufs-test# zgrep CONFIG_AUFS /proc/config.gz
CONFIG_AUFS_FS=y
# CONFIG_AUFS_BRANCH_MAX_127 is not set
# CONFIG_AUFS_BRANCH_MAX_511 is not set
CONFIG_AUFS_BRANCH_MAX_1023=y
# CONFIG_AUFS_BRANCH_MAX_32767 is not set
CONFIG_AUFS_SBILIST=y
CONFIG_AUFS_HNOTIFY=y
CONFIG_AUFS_HFSNOTIFY=y
CONFIG_AUFS_EXPORT=y
CONFIG_AUFS_INO_T_64=y
CONFIG_AUFS_XATTR=y
CONFIG_AUFS_FHSM=y
CONFIG_AUFS_RDU=y
CONFIG_AUFS_SHWH=y
CONFIG_AUFS_BR_RAMFS=y
CONFIG_AUFS_BR_FUSE=y
CONFIG_AUFS_POLL=y
CONFIG_AUFS_BR_HFSPLUS=y
CONFIG_AUFS_BDEV_LOOP=y
CONFIG_AUFS_DEBUG=y
CONFIG_AUFS_MAGIC_SYSRQ=y
```
