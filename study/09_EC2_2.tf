provider "aws" {                      
  region = "ap-northeast-2"   # 리전 지정
}
 
resource "aws_instance" "test1" {  # resource "<PROVIDER_TYPE>" "<NAME>"
  ami = "ami-04c535bac3bf07b9a"      # AWS 의 AMI ID
  instance_type  = "t2.micro"  
}
resource "aws_instance" "test2" {   # resource "<PROVIDER_TYPE>" "<NAME>"
  ami    = "ami-04c535bac3bf07b9a" # AWS 의 AMI ID
  instance_type  = "t2.micro"  
}