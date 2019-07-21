# file: .cpm_compile.sh
# decription: a file of cppproject_manager_kaliv1.0 which is a simple cpp proector manager.
#             usged to compile cpp project
# usage: sh .cpm_compile.sh $project_name
# author: freely
# date: 2019.07.21
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
if [ "$#" -ne "1" ];
then
    echo "usage: sh .cpm_compile.sh \$project_name"
    exit 1
fi
cd $1
test -e makefile && make && exit 0
#rm -f makefile
cat .config | sed '1d;$d' > makefile
#RELEASE="$(cat .config | grep "RELEASE" | cut -d "=" -f 2)"
#exe file
exe="$(cat .config | grep "exe" | cut -d "=" -f 2)"
echo "exe=\$(RELEASE)/$exe" >> makefile
#obj file
SOURCE_FILES="$(cat .config | grep "SOURCE_FILES" | cut -d "=" -f 2)"
#OBJ_FILES="$(cat .config | grep "OBJ_FILES" | cut -d "=" -f 2)"
obj="$(ls $SOURCE_FILES)"
OIFS=$IFS
IFS='
'
objs=$obj
for x in $objs
do
    newobj="$newobj\$(OBJ_FILES)/$(echo "$x" | cut -d "." -f 1).o "
done
IFS=$OIFS
echo "obj=$newobj" >> makefile

#make
set="\n\n.PHONY: all clean\n\
all:\$(exe)\n\
\$(exe):\$(obj)\n\
\tg++ -o \$(exe) \$(obj)\n\
\$(OBJ_FILES)/%.o:\$(SOURCE_FILES)/%.cpp\n\
\t\$(CC) -I \$(HEAD_FILES) \$(CFLAG) -c \$^ -o \$@\n\
clean:\n\
\trm -f \$(RELEASE)/* \$(OBJ_FILES)/*"
echo $set >> makefile
make
