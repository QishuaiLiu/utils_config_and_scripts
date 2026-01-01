#!/usr/bin/bash

log_dir=$1
echo "passed ${log_dir}"

## create log dir
while true
do
  mkdir -p "${log_dir}"
  if [ -d "${log_dir}" ]; then
    break
  fi
  sleep 1
done

## create log file
iFileId="5"
rm -f "${log_dir}/${iFileId}.txt"
while [ ${iFileId} -gt 0 ]
do
  dstFile="${log_dir}/${iFileId}.txt"
  iFileId=`expr ${iFileId} - 1`
  curFile="${log_dir}/${iFileId}.txt"
  if [ -f ${curFile} ]; then
    mv "${log_dir}/${iFileId}.txt" "${dstFile}"
  fi
done

## write stat info
outputFile="${log_dir}/0.txt"
rm -f "${outputFile}"

while true 
do
  sleep 1
  echo "#### `date "+%Y-%m-%d %H:%M:%S"`" >> ${outputFile}
  top -H -b -n 1|head -25 >> ${outputFile}
done
