#!/bin/sh
# it will list image against repository for us-west-region
REGION=us-west-2
REPO_LIST=$(aws ecr describe-repositories --query "repositories[].repositoryName" --output text --region $REGION);
for repo in $REPO_LIST; do
    echo "list image for $repo"
        aws ecr list-images --repository-name $repo --region $REGION
done
