// Provider specific configs
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

// Security Group Resource for Module
resource "aws_security_group" "main_security_group" {
    name = "${var.security_group_name}"
    description = "Security Group ${var.security_group_name}"
    vpc_id = "${var.vpc_id}"

    // allow traffic for TCP 636
    ingress {
        from_port = 636
        to_port = 636
        protocol = "tcp"
        cidr_blocks = ["${var.source_cidr_block}"]
    }

}
