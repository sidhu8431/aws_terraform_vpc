data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_vpc" "default" {
  default = true
}
data "aws_route_table" "default_rt" {
  vpc_id = data.aws_vpc.default.id
}