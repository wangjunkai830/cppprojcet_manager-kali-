# cppprojcet_manager

A simple cpp project manager for beginner.
Loate the script in your directory where you create your project.

## Create Project
sh .cpm_project $project_name

It will create a directory for your project. In the directory, there are source_files/ head_files/ obj_files/, which used to locate your source codes, head files and obj codes respectively.

## Compile Project
sh .cpm_compile $project_name

You will find your execution file in release/

## Run Project
sh .cpm_run $project_name
