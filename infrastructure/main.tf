# EC2 instance resource definition
resource "aws_instance" "backend" {
  ami           = "ami-0c55b159cbfafe1f0"  # Replace with the latest Amazon Linux AMI
  instance_type = "t2.micro"  # You can adjust the instance type
  key_name      = env.EC2_KEY_NAME  # EC2 key pair name for SSH access

  tags = {
    Name = "FastAPI-Backend"
  }

  security_groups = [aws_security_group.sg.id]

  # User data for instance initialization
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install python3.8
              sudo yum install -y python3-pip
              pip3 install uvicorn fastapi git

              # Clone your FastAPI repo from GitHub (ensure it's public or provide your credentials)
              cd /home/ec2-user
              git clone https://github.com/IsaMukadam/Business-Socials-Centralised-Data-Application.git
              cd backend

              # Start the FastAPI app using Uvicorn
              nohup uvicorn app.main:app --host 0.0.0.0 --port 8000 &
              EOF
}

# Security group to allow inbound traffic
resource "aws_security_group" "sg" {
  name_prefix = "backend-sg-"

  # SSH access (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access for FastAPI (port 8000)
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
