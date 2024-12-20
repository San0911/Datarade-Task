resource "aws_instance" "ubuntu_minikube" {
  ami           = var.ubuntu_ami_id
  instance_type = "t2.medium"
  key_name      = var.key_name
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "Minikube-Ubuntu"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y curl conntrack apt-transport-https docker.io",
      "sudo systemctl start docker",
      "curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
      "sudo install minikube-linux-amd64 /usr/local/bin/minikube",
      "minikube start --driver=none",
      "sudo apt-get install -y kubectl"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file(var.private_key_path)
    }
  }
}

output "ec2_public_ip" {
  value = aws_instance.ubuntu_minikube.public_ip
}
