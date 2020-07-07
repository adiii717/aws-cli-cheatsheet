### Get latest snapshot

```
aws ec2 describe-snapshots  --query "sort_by(Snapshots, &StartTime)[-1].{SnapshotId:SnapshotId,StartTime:StartTime}"
```

#### output
```
{
    "SnapshotId": "snap-123456", 
    "StartTime": "2020-07-07T13:57:05.982Z"
}
```

### Get snapshot owned by my me

```
MY_ACCOUNT_ID=123456789 aws ec2 describe-snapshots  --filter "Name=owner-id,Values=$MY_ACCOUNT_ID" --query "sort_by(Snapshots, &StartTime)[-1].{SnapshotId:SnapshotId,StartTime:StartTime}"
```
