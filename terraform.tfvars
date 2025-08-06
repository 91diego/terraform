virginia_cidr           = "10.10.0.0/16"
public_subnet_public_ip = true

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env"         = "dev"
  "owner"       = "DG"
  "cloud"       = "AWS"
  "IAC"         = "terraform"
  "IAV_Version" = "v1.12.2"
  "project"     = "cerberus"
  "region"      = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"
