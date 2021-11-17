# EC2 AWS CLI command

### Query instance ID, instance IP, LaunchTime, Tags

```
aws ec2 describe-instances --query 'Reservations[].Instances[].{InstanceId:InstanceId,LaunchTime:LaunchTime,Tags:Tags[?Key==`Name`].Value|[0],PrivateIpAddress:PrivateIpAddress}' --output table

```

#### Output
```
------------------------------------------------------------------------------------------------------------------------------
|                                                      DescribeInstances                                                     |
+---------------------+----------------------------+-------------------+-----------------------------------------------------+
|     InstanceId      |        LaunchTime          | PrivateIpAddress  |                        Tags                         |
+---------------------+----------------------------+-------------------+-----------------------------------------------------+
|  i-1234234234dsf        |  2017-09-25T22:18:20+00:00 |  10.0.0.243       |  demp                                            |

```

### Query AMI being used by instance and describe AMI details

```shell
#Get list of EC2 instance
echo "Getting EC2"
EC2_LIST=$(aws ec2 describe-instances --query 'Reservations[].Instances[].{InstanceId:InstanceId}' --output text | tr '\n' ' ')
#Get list of AMI used by ec2
echo "Getting AMI"
LIST_AMI_ID=$(aws ec2 describe-instances --query 'Reservations[].Instances[].{ImageId:ImageId,InstanceId:InstanceId}' --output text | tr '\n' ' ')

EC2_LIST_ARRAY=($EC2_LIST)
LIST_AMI_ID_ARRAY=($LIST_AMI_ID)

for index in ${!LIST_AMI_ID_ARRAY[*]}; do

echo "Get details for AMI ${LIST_AMI_ID_ARRAY[$index]}"
#Get details of AMI
AMI_DETAILS=$(aws ec2 describe-images --image-ids ${LIST_AMI_ID_ARRAY[$index]} --query 'Images[].{CreationDate:CreationDate,Tags:Tags[]}')
echo "Instance having ID ${EC2_LIST_ARRAY[$index]} using  AMI ID ${LIST_AMI_ID_ARRAY[$index]}  Details: $AMI_DETAILS"

done
```
