# List All users against user pool id

```
aws cognito-idp list-users --user-pool-id  us-west-demoid
```

# Get multiple users from pool id

```
aws cognito-idp list-users --user-pool-id  us-west-demo --query 'Users[?Username==`user1` || Username==`user2`]'

```
