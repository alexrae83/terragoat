provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "4cb06480156da09e3c3130236be48def9cdd409a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-15 20:20:28"
    git_last_modified_by = "alexrae83@gmail.com"
    git_modifiers        = "alexrae83"
    git_org              = "alexrae83"
    git_repo             = "terragoat"
    yor_trace            = "255f30e2-ff74-49cf-9633-2e6696e9ff54"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "4cb06480156da09e3c3130236be48def9cdd409a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-15 20:20:28"
    git_last_modified_by = "alexrae83@gmail.com"
    git_modifiers        = "alexrae83"
    git_org              = "alexrae83"
    git_repo             = "terragoat"
    yor_trace            = "e10c8e4f-edda-4253-a202-e8304ccb2385"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
