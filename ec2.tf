data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = module.network_module.public_subnet_id_1
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = aws_key_pair.instance.key_name
  provisioner "local-exec" {
    command = "touch ${self.id}"
  }
}
resource "aws_instance" "myapp" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = module.network_module.private_subnet_id_1
  vpc_security_group_ids = [aws_security_group.allow_ssh3000.id]
  key_name               = aws_key_pair.instance.key_name
}
