resource "aws_instance" "NewInstances" {
  ami           = "ami-0af2f764c580cc1f9"
  instance_type = "t2.micro"
  key_name      = "singapore"
  
  tags = {
    Name = "Terraform_Docker"
  }
}
