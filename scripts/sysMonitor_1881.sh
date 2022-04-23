#!/system/bin/sh

logPath="/data/log/sysMonitor"
while [ "1" == "1" ]
do
    mkdir -p "${logPath}"
    if [ -d "${logPath}" ]; then
        break
    fi

    sleep 1
done

iFileId="5"
rm -f "${logPath}/${iFileId}.txt"
while [ ${iFileId} -gt 0 ]
do
    dstFile="${logPath}/${iFileId}.txt"
    iFileId=`expr ${iFileId} - 1`
    mv "${logPath}/${iFileId}.txt" "${dstFile}"
done

outputFile="${logPath}/0.txt"
rm -f "${outputFile}"
while [ "1" == "1" ]
do
    sleep 1
	echo "###### `date "+%Y-%m-%d %H:%M:%S"`" >> "${outputFile}"
    echo "c" | busybox top -n 1 >> "${outputFile}"
done