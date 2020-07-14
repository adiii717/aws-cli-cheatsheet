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
