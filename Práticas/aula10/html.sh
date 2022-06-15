#!/bin/bash
# This is a comment
echo "List of files:"
ls -lA

FILE_LIST="`ls *.html`"
echo FILE_LIST: ${FILE_LIST}

RESULT=""
for file in ${FILE_LIST}
do
    FIRST_LINE=`head -1 ${file}`
    RESULT=${RESULT}${FIRST_LINE}$'\n'
done

echo ${RESULT} | cat > FILE_HEADS

echo "${RESULT}"
echo "Script done."