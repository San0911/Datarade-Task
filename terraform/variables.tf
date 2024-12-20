variable "ubuntu_ami_id" {
  default = "ami-0d5eff06f840b45e9" # Ubuntu 20.04 in us-east-1
}

variable "key_name" {
  default = "mykeypair"
}

#variable "private_key_path" {
#}

variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
