##sleep 5s&& xdotool keydown Shift
for i in `seq 1 10`
do
sleep 7h&& rsync -avrP rsync://mirrors.tuna.tsinghua.edu.cn/archlinux/ /mnt/extra/repo
done
