resource "aws_instance" "Firstinstance" {
  ami = "${var.ami}"

  instance_type = "${var.instance_type}"

  tags = {
    Name = "First-EC2-Instance-Terraform"
  }
}

resource "aws_instance" "Seconsinstance" {
  ami = "ami-003634241a8fcdec0"

  instance_type = "t2.micro"

  tags = {
    Name = "Second-EC2-Instance-Terraform"
  }
}
