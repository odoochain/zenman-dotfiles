screen_name="aria2c";
screen -dmS $screen_name;
cmd="aria2c --conf-path=/home/myf/.aria2/aria2.conf";
screen -x -S $screen_name -p 0 -X stuff "$cmd";
screen -x -S $screen_name -p 0 -X stuff '\n';
