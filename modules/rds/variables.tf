variable "DB_SG_ID" {}
variable "PRI_SUB_5_A_ID" {}
variable "PRI_SUB_6_B_ID" {}
variable "DB_USERNAME" {}
variable "DB_PASSWORD" {}

variable "DB_SUB_NAME" {
  default = "2-tier-app-db-subnet-group"
}
variable "DB_NAME" {
  default = "test"
}