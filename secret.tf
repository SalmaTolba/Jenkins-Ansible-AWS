# Creates and stores ssh key used creating an EC2 instance
resource "aws_secretsmanager_secret" "secretnew3" {
  name = "secretnew3"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "smnew3" {
  secret_id     = aws_secretsmanager_secret.secretnew3.id
  secret_string = tls_private_key.instance.private_key_pem
}