provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_instance" "EC2_test" {
    ami           = "ami-0c7eb81e6fe66fd84"
    instance_type = "t2.micro"

    tags = {
        Name = "EC2_test_instance"  # EC2 인스턴스 이름 설정
    }
}
