First create a S3 bucket to hold terraform remote tf state.

Add below poilicy to bucket 

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::023811923777:user/vinod"
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::my-dev-tf-state"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::023811923777:user/vinod"
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::my-dev-tf-state/tf-state/rds-postgres-prod"
        }
    ]
}

==================================
Run below commands in order
terraform get
terraform init
terraform validate
terraform plan -input=false -var-file="terraform.tfvars.json"
terraform apply -auto-approve -input=false -var-file="terraform.tfvars.json"

To destroy resources use below command
terraform destroy