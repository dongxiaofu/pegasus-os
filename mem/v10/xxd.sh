#! /bin/bash

echo "shell arguments demo:"
echo "the first argument: $0"
echo "the second argument: $1"


if [ $1 == root ]
then
	echo "查看根目录"
	xxd  -u -a -g 1 -c 16 -l 0x200  -s +11535360 80m.img
elif [ $1 == 1 ]
then
	echo "查看第一个文件"
	xxd  -u -a -g 1 -c 16 -l 0x200  -s +12583936 80m.img
elif [ $1 == 2 ]
then
	echo "查看第二个文件"
	xxd  -u -a -g 1 -c 16 -l 0x200  -s +13632512 80m.img
elif [ $1 == 3 ]
then
	echo "查看第三个文件"
	xxd  -u -a -g 1 -c 16 -l 0x200  -s +14681088 80m.img
elif [ $1 == 4 ]
then
	echo "查看第四个文件"
	xxd  -u -a -g 1 -c 16 -l 0x200  -s +15729664 80m.img
elif [ $1 == 5 ]
then
	echo "查看第五个文件"
	xxd  -u -a -g 1 -c 16 -l 0x200  -s +16778240 80m.img
else
	echo "invalid"
fi
