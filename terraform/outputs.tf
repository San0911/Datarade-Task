output "ec2_public_ip" {
  value = aws_instance.ubuntu_minikube.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.postgres_db.endpoint
}
