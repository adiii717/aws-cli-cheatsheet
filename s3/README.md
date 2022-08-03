## Retrieve files from s3 with the Content-type using AWS CLI



#!/bin/bash
ContentType="application/octet-stream"
BUCKET=mybucket
MAX_ITME=100 
OBJECT_LIST="$(aws s3api list-objects --bucket $BUCKET --query 'Contents[].[Key]' --max-items=$MAX_ITME --output text | tr '\n' ' ' )"; 
for KEY in ${OBJECT_LIST}
do  
aws s3api head-object --bucket $BUCKET --key $KEY --query "[\``echo $KEY`\`,ContentType]"  --output text | grep "$ContentType"
done  
