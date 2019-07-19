# Script for converting json to env
# e.g userId: 1337 ==> USERID=1337
curl -s https://jsonplaceholder.typicode.com/todos/1 | jq |
while read line
do
  echo $line | awk -F: '{if ($1!="{" && $1!="}") print toupper($1)"="$2}' | sed 's/"//g' | sed 's/,//g' | sed 's/= /=/g'
done