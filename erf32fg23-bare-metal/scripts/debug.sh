make build;
make flash;
make debug &> build/sever.log & \
gdb -ex "target remote localhost:2331" -ex "monitor reset" -ex "load" -ex "break main" build/nosdk_tz_app.elf
