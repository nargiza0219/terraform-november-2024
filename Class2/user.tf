resource "aws_iam_user" "lb" {
  for_each = toset(["jenny", "jisuu", "lisa", "rose", "jenny", "lisa"])
  name = each.value 
}

 

# resource aws_iam_user lb {
#     name = "lisa"
# }

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

#   users = [
#     aws_iam_user.user_one.name,
#     aws_iam_user.user_two.name,
#   ]

 users = [
    for i in aws_iam_user.lb : i.name 
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "blackpink"
}

resource aws_iam_user "manual"{
    name = "hello"
}
#terraform import aws_iam_user.manual hello