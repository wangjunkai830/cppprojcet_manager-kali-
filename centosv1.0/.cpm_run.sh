# file: .cpm_run.sh
# decription: a file of cppproject_manager_centosv1.0 which is a simple cpp proector manager.
#             usged to run cpp project
# usage: sh .cpm_run.sh $project_name
# author: freely
# date: 2019.07.21
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
if [ "$#" -ne "1" ];
then
    echo "usage: sh .cpm_run.sh \$project_name"
    exit 1
fi
./$1/release/$1.out
