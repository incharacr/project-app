resource "aws_instance" "NewInstances" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  
  tags = {
    Name = "Terraform-Docker"
  }
}
