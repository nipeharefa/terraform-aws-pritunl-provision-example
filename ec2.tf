resource "aws_spot_instance_request" "cheap_worker" {
  count = 0
  ami           = "ami-00e912d13fbb4f225"
  spot_price    = "0.0088"
  instance_type = "t2.small"

  subnet_id = var.subnet_id

  security_groups = [
    aws_security_group.ingress-ssh-test.id
  ]

  key_name = var.ssh-key

  user_data_base64 = base64encode(file("user-data.sh"))

  tags = {
    Name    = "CheapWorkerBar"
    Version = "0.0.1"
  }
}