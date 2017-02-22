## Get filesystem block size
tune2fs -l /dev/sda1 | grep -i "block siz"
