#### command:

```
aws ec2 describe-subnets --query 'Subnets[*].{Subnet_ID:SubnetId,Name:Tags[?Key==`Name`].Value}'  --output json
```

#### Output

```
    {
        "Subnet_ID": "subnet-12356",
        "Name": [
            "prod"
        ]
    }
```


#### Complete JSON response

```
{
    "Subnets": [
        {
            "AvailabilityZone": "us-west-2b",
            "AvailabilityZoneId": "usw2-az2",
            "AvailableIpAddressCount": 238,
            "CidrBlock": "10.0.1.0/24",
            "DefaultForAz": false,
            "MapPublicIpOnLaunch": false,
            "State": "available",
            "SubnetId": "subnet-12345",
            "VpcId": "vpc-12345",
            "OwnerId": "123456789",
            "AssignIpv6AddressOnCreation": false,
            "Ipv6CidrBlockAssociationSet": [],
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "prod"
                }
            ],
            "SubnetArn": "arn:aws:ec2:us-west-2:123456789:subnet/subnet-123456"
        }
       
 ```
