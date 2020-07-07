echo "Hello World!"
dir_files=$(ls)
echo ${dir_files}
for filename in $dir_files 
do
    echo ${filename}
done