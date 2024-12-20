resource "aws_db_instance" "postgres_db" {
  allocated_storage    = 5
  engine               = "postgres"
  engine_version       = "13"
  instance_class       = "db.t2.micro"
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true

  tags = {
    Name = "PostgresDB"
  }
}
