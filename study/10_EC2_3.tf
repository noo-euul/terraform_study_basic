provider "aws" {
  region = "ap-northeast-2"  # 리전 설정
}

# 보안 그룹 정의
resource "aws_security_group" "example" {
  name        = "example_sg"
  description = "Allow HTTP, HTTPS, and SSH traffic"

  # Ingress (들어오는 트래픽 허용)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # SSH 허용
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTP 허용
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # HTTPS 허용
  }

  # Egress (나가는 트래픽 허용)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # 모든 트래픽 허용
  }

  tags = {
    Name = "example_sg"
  }
}

# EC2 인스턴스 정의
resource "aws_instance" "EC2_test" {
  ami           = "ami-0c7eb81e6fe66fd84"  # AMI ID
  instance_type = "t2.micro"
  key_name      = "soldesk_key"  # 키페어 이름
  security_groups = [aws_security_group.example.name]  # 보안 그룹 연결

  tags = {
    Name = "EC2_test1"  # 태그 이름 설정
  }
}
