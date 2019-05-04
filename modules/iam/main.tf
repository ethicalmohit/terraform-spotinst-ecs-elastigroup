resource "aws_iam_role" "external" {
  name = "spotinst-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::922761411349:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "spotinst:aws:extid:3w72ms42i8000000"
        }
      }
    }
  ]
}
EOF
}

