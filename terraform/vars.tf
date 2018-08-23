variable "public_key_path" {
  description = "Path where is your public key"
  default = ""
}

variable "private_key" {
  description = "Path where is your keypair"
  default= ""
}

variable "key_name" {
  description = "The AWS key pair name"
  default = ""
}

variable "access_key" {
  description = "The AWS access key."
  default     = ""
}

variable "secret_key" {
  description = "The AWS secret key."
  default     = ""
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = ""
}

variable "ec2-user" {
  default= ""
}