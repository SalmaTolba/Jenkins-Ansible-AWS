resource "tls_private_key" "instance" {
  algorithm = "RSA"
}

resource "aws_key_pair" "instance" {
  key_name   = "test-keypair"
  public_key = tls_private_key.instance.public_key_openssh
  tags = {
    Name = "test-keypair"
  }
}