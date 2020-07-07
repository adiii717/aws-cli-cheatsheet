### Get latest snapshot

aws ec2 describe-snapshots  --query "sort_by(Snapshots, &StartTime)[-1].{SnapshotId:SnapshotId,StartTime:StartTime}"

### Get snapshot owned by my me
MY_ACCOUNT_ID=123456789 aws ec2 describe-snapshots  --filter "Name=owner-id,Values=$MY_ACCOUNT_ID" --query "sort_by(Snapshots, &StartTime)[-1].{SnapshotId:SnapshotId,StartTime:StartTime}"
