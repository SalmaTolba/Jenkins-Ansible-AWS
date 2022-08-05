resource "aws_db_subnet_group" "mysql-subnet-group" {
  name       = "mysql-subnet-group"
  subnet_ids = [module.network_module.private_subnet_id_1, module.network_module.private_subnet_id_2]
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "salma"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name        = aws_db_subnet_group.mysql-subnet-group.name
  vpc_security_group_ids      = [aws_security_group.sg-all.id]
}

resource "aws_elasticache_subnet_group" "sub-group1" {
  name       = "sub-group1"
  subnet_ids = [module.network_module.private_subnet_id_1, module.network_module.private_subnet_id_2]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_elasticache_cluster" "elastic" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.sub-group1.name
  security_group_ids   = [aws_security_group.sg-all.id]
}  