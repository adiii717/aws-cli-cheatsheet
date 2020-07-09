## Security-Group

### Get SG base for particular region

```
export region=us-east-1 && aws ec2 describe-security-groups --region=$region --filters Name=ip-permission.cidr,Values='0.0.0.0/0' --query "SecurityGroups[*].{Name:GroupName,vpc:VpcId,sg:GroupId,Region:\``echo $region`\` }" --output table
```


### Get SG For all region 

```
#!/bin/bash

for region in $(aws ec2 describe-regions --query "Regions[].RegionName" --output text); do 
    echo "SG for region ${region}"
    aws ec2 describe-security-groups --region=$  --filters Name=ip-permission.cidr,Values='0.0.0.0/0' --query "SecurityGroups[*].{Name:GroupName,vpc:VpcId,sg:GroupId,Region:\``echo $region`\` }" --output table
done

```


### Output:
```
---------------------------------------------------------------------------------------
|                               DescribeSecurityGroups                                |
+-------------------------------+------------+------------------------+---------------+
|             Name              |  Region    |          sg            |      vpc      |
+-------------------------------+------------+------------------------+---------------+
|  launch-wizard-17             |  us-west-2 |  sg-12345  |  vpc-12345 |

```
