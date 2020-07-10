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

```

