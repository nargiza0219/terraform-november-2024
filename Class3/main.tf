provider "aws" {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")

}


resource "aws_instance" "web" {
  ami           = "ami-08970251d20e940b0"
  instance_type = "t2.micro"
#   availability_zone = "us-east-2c"
  subnet_id = "subnet-029308788556e065a"
  key_name = aws_key_pair.deployer.key_name


  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

}


