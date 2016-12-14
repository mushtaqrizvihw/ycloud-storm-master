file=$1
yamlFile=`echo $file | cut -d. -f1 | sed 's!$!.yaml!'`
rm -f $yamlFile
for i in `cat $file | grep =`
do
  hasBracket=`echo $i | grep "=\["`
  if [ "x$hasBracket" == "x" ]; then
    echo "  $i" | sed 's!=!: "!' | sed 's!$!"!' >> $yamlFile
  else
    echo "Found bracket"
    echo "  $i" | sed 's!=\[!: ["!' | sed 's!\]$!"]!' >> $yamlFile
  fi
done
