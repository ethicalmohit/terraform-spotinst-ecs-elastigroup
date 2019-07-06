resource "aws_iam_role" "external" {
  name = "Spotinst-Role"

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
          "sts:ExternalId": "spotinst:aws:extid:fq2zib3nj4000000"
        }
      }
    }
  ]
}
EOF
}

data "template_file" "external" {
  template = "${file("${path.module}/ecs_policy.json")}"
}

resource "aws_iam_policy" "ecs" {
  name        = "Spotinst-Policy"
  description = "A test policy"
  policy      = "${data.template_file.external.rendered}"
}

resource "aws_iam_role_policy_attachment" "ecs-attach" {
  role       = "${aws_iam_role.external.name}"
  policy_arn = "${aws_iam_policy.ecs.arn}"
}
