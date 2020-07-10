### AWS ECR

### List image tags for singel repository

```
aws ecr list-images --repository-name stage/nodejs --query "imageIds[].imageTag"
```

#### Output

```
[
    "latest",
    "dev",
    "tes"
]

```

### List all repository Name

```
aws ecr describe-repositories --query "repositories[].repositoryName"

```
#### Output

```
[
    "app1",
    "app2"
]

```

### List All repository images

```
#!/bin/sh
REGION=us-west-2
REPO_LIST=$(aws ecr describe-repositories --query "repositories[].repositoryName" --output text --region $REGION);
for repo in $REPO_LIST; do
    echo "list image for $repo"
        aws ecr list-images --repository-name $repo --region $REGION
done

### Move All repository from Account A to Account B
```
#!/bin/bash
TARGET_ACCOUNT_REGION="us-west-2"
DESTINATION_ACCOUNT_REGION="us-west-2"
DESTINATION_ACCOUNT_BASE_PATH="123456.dkr.ecr.$DESTINATION_ACCOUNT_REGION.amazonaws.com/"
REPO_LIST=($(aws ecr describe-repositories --query 'repositories[].repositoryUri' --output text --region $TARGET_ACCOUNT_REGION))
REPO_NAME=($(aws ecr describe-repositories --query 'repositories[].repositoryName' --output text --region $TARGET_ACCOUNT_REGION))
for repo_url in ${!REPO_LIST[@]}; do
    echo "list image for ${REPO_LIST[$repo_url]} in Account Target"
        # required once login
        aws ecr get-login-password --region $TARGET_ACCOUNT_REGION | docker login --username AWS --password-stdin ${REPO_LIST[$repo_url]}
        # destination account login, make sure profile set for accoutn destination
        aws ecr get-login-password --region $DESTINATION_ACCOUNT_REGION --profile destination_account | docker login --username AWS --password-stdin ${REPO_LIST[$repo_url]}
        echo "star pulling image ${REPO_LIST[$repo_url]} from Target account"
        echo "repo_name is ${REPO_NAME[$repo_url]}"
          docker pull ${REPO_LIST[$repo_url]}
        # Create repo in destination account, remove this line if already created
        aws ecr create-repository --repository-name ${REPO_NAME[$repo_url]}
        docker tag   ${REPO_LIST[$repo_url]} $DESTINATION_ACCOUNT_BASE_PATH/${REPO_NAME[$repo_url]} 
        docker push $DESTINATION_ACCOUNT_BASE_PATH/${REPO_NAME[$repo_url]} 
done
```

```

