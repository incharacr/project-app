resource "aws_instance" "MyInstance" {
  ami           = "ami-0af2f764c580cc1f9"
  instance_type = "t2.micro"
  
  tags = {
    Name = "Terraform-Docker"
  }
}
