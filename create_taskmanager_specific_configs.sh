scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${scriptdir}
confdir=${scriptdir}/build-target/conf

for i in {31..50}; do
  ibdir=${confdir}/ib${i}
  mkdir ${ibdir}
  ls ${confdir} | grep -v "^ib" | while read file; do
    cp ${confdir}/${file} ${ibdir}
  done
  echo "taskmanager.host: ib${i}" >> ${ibdir}/flink-conf.yaml
done
