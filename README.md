# 2 tier Application deployment through terraform 

## 🖥️ Installation
Prerequisite:
- Terraform installed
- AWS CLI installed
- AWS IAM user with administrative access

👉 let install dependency to deploy the application 

```sh
cd main
terraform init 
```

**Note**: we need public key and private key for our server so follow below procedure.

```sh
cd modules/key/
ssh-keygen.exe 
```
above command ask for key name then give `client_key` it will create pair of keys one public and one private. you can give any name you want but then you need to edit the terraform file

edit below file according to your configuration
```sh
vim main/backend.tf
```
add below code in book_shop_app/backend.tf
```sh
terraform {
  backend "s3" {
    bucket = "BUCKET_NAME"
    key    = "backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamoDB_TABLE_NAME"
  }
}
```
### Lets setup the variable for our Infrastructure
create one file with the name of `terraform.tfvars` 
```sh
vim main/terraform.tfvars
```

add below contents into `main/terraform.tfvars` file
```javascript
REGION                  = ""
PROJECT_NAME            = ""
VPC_CIDR                = ""
PUB_SUB_1_A_CIDR        = ""
PUB_SUB_2_B_CIDR        = ""
PRI_SUB_3_A_CIDR        = ""
PRI_SUB_4_B_CIDR        = ""
PRI_SUB_5_A_CIDR        = ""
PRI_SUB_6_B_CIDR        = ""
DB_USERNAME             = ""
DB_PASSWORD             = ""
CERTIFICATE_DOMAIN_NAME = ""
ADDITIONAL_DOMAIN_NAME  = ""
```

##  Now we are ready to provision our infrastructure on AWS cloud ⛅
Get into project directory 
```sh
cd main
```

Type below command to validate the syntax and configuration of your Terraform files
```sh
terraform validate
```

Type below command to see plan of the exection 
```sh
terraform plan
```

Type the below command to executes the actions proposed in a terraform plan
```sh
terraform apply 
```

type `yes`, it will prompt you for permission..

## 🏠 Architecture
 ![terraform](https://github.com/satyam19arya/2-tier-Application-architecture-using-terraform/assets/77580311/3fe7c9c5-6044-49a6-b7f2-35b4e5367630)

