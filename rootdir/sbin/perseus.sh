#!/system/xbin/busybox sh

mount -t rootfs -o remount,rw rootfs

echo 2 > /sys/devices/system/cpu/sched_mc_power_savings

for i in /sys/block/*/queue/add_random;do echo 0 > $i;done

echo 0 > /proc/sys/kernel/randomize_va_space

echo "0x0FA4 0x0404 0x0170 0x1DB9 0xF233 0x040B 0x08B6 0x1977 0xF45E 0x040A 0x114C 0x0B43 0xF7FA 0x040A 0x1F97 0xF41A 0x0400 0x1068" > /sys/class/misc/wolfson_control/eq_sp_freqs

echo 11 > /sys/class/misc/wolfson_control/eq_sp_gain_1
echo -7 > /sys/class/misc/wolfson_control/eq_sp_gain_2
echo 4 > /sys/class/misc/wolfson_control/eq_sp_gain_3
echo -10 > /sys/class/misc/wolfson_control/eq_sp_gain_4
echo -0 > /sys/class/misc/wolfson_control/eq_sp_gain_5

echo 1 > /sys/class/misc/wolfson_control/switch_eq_speaker

echo 480 > /sys/devices/platform/pvrsrvkm.0/sgx_dvfs_max_lock
echo 50 > /sys/class/devfreq/exynos5-busfreq-mif/polling_interval
echo 70 > /sys/class/devfreq/exynos5-busfreq-mif/time_in_state/upthreshold

chmod 755 /res/synapse/uci

ln -s /res/synapse/uci /sbin/uci
/sbin/uci

chmod 755 /res/synapse/actions/*

mkdir -p /mnt/ntfs
chmod 777 /mnt/ntfs
mount -o mode=0777,gid=1000 -t tmpfs tmpfs /mnt/ntfs

mount -t rootfs -o remount,ro rootfs
