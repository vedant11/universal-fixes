# transfer machineimage, packed with snapshot to S3
aws ec2 create-store-image-task \
    --image-id ami-id \
    --bucket bucketid # check how to restore: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ami-store-restore.html