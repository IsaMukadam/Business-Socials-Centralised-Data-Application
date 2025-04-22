provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "business-socials-frontend"
  acl = "public-read"
}

resource "aws_instance" "backend_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (Free Tier eligible)
  instance_type = "t2.micro"

  tags = {
    Name = "business-socials-backend"
  }
}

resource "aws_iam_role" "s3_access_role" {
  name = "s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  inline_policy {
    name   = "s3_access_policy"
    policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action   = ["s3:PutObject", "s3:GetObject"],
          Effect   = "Allow",
          Resource = "arn:aws:s3:::business-socials-frontend/*"
        }
      ]
    })
  }
}

output "ec2_public_ip" {
  value = aws_instance.backend_instance.public_ip
  description = "The public IP address of the EC2 instance."
}