dir_name=$1
tar -zcvf "./$dir_name.tar.gz"  "$dir_name/" && mv "$dir_name.tar.gz" /mnt/e/
