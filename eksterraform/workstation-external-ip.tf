# Workstation External IP

data "http" "workstation-external-ip" {
  url = "http://ipv4.icanhazip.com"
}

# local station ip
locals {
  workstation-external-cidr = "${chomp(data.http.workstation-external-ip.body)}/32"
}
