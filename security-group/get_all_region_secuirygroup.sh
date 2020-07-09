#!/bin/bash
# Get all available region
for region in $(aws ec2 describe-regions --query "Regions[].RegionName" --output text); do 
    echo "SG for region ${region}"
    # print SG per region
    aws ec2 describe-security-groups --region=$  --filters Name=ip-permission.cidr,Values='0.0.0.0/0' --query "SecurityGroups[*].{Name:GroupName,vpc:VpcId,sg:GroupId,Region:\``echo $region`\` }" --output table
done

