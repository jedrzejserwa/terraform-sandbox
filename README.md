# Terraform sandbox
Playground for terraform infrastructure as a code.

Creates:
* AWS Network (VPC, Public subnet, Route table)
* AWS SG for VPC
* AWS EC2 t3 micro instance

## Run:

### Requirements

#### Terraform
* required_version = ">= 0.12"

#### AWS
* *terraform-sadnbox-infrastructure-state-s3* S3 bucket
* IAM user permission policies for EC2, VPC, S3
* config file with *terraform_sandbox* profile
* credentials file with *terraform_sandbox* profile

Apply commands in proper environment directory (dev)

### Build
```
sh build_dev.sh
```

### Destroy
```
sh destroy_dev.sh
```


### License MIT