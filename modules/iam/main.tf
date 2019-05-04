resource "aws_iam_role" "external" {
  name = "spotinst-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {
      "AWS": "arn:aws:iam::922761411349:*"
    },
    "Action": "sts:AssumeRole"
  }
}
EOF
}
