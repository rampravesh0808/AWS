resource "aws_vpc_dhcp_options" "mydhcp" {
  domain_name         = "${var.DnsZoneName}"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    Name = "My internal name"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  vpc_id          = "${aws_vpc.mainvpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp.id}"
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "mainvpc" {
  name    = "${var.DnsZoneName}"
  vpc {
    vpc_id  = "${aws_vpc.mainvpc.id}"
  }
}
