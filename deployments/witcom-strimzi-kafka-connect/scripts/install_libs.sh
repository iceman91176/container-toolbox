#!/bin/bash
FILES=/tmp/*.xml
for f in $FILES
do
  base=`basename $f`
  modname=${base%.*}
  echo "Processing $f file... ${modname}"
  mkdir -p $JARS_DIR/${modname}
  mvn -f $f dependency:copy-dependencies -DincludeScope=runtime -DoutputDirectory=$JARS_DIR/${modname};
done


