resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames


  tags = merge(
    var.common_tags,
    {
      Name = local.vpc_name
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.igw_tags,
    var.common_tags,
    {
      Name = local.igw_name
    }
  )
}

resource "aws_eip" "elastic_ip" {

  domain = "vpc"
   tags = {
    Name = "NAT-Gateway-EIP"
  }
}



resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet[0].id

  tags = merge(var.common_tags,
    var.nat_tags,
    {
      Name = "NAT-gateway"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr[count.index]
  map_public_ip_on_launch = true
  availability_zone       = local.az_zone[count.index]
  tags = merge(var.public_subnet_tags,
    var.common_tags, {
     Name = "${local.public_subnet_name}-${local.az_zone[count.index]}"
    }
  )
}
resource "aws_subnet" "private_subnet_cidr" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = local.az_zone[count.index]
  tags = merge(var.private_subnet_tags, var.common_tags, {
    Name = "${local.private_subnet_name}-${local.az_zone[count.index]}"
    }
  )
}
resource "aws_subnet" "database_subnet_cidr" {
  count             = length(var.database_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_cidr[count.index]
  availability_zone = local.az_zone[count.index]
  tags = merge(var.database_subnet_tags, var.common_tags, {
    Name = "${local.database_subnet_name}-${local.az_zone[count.index]}"
    }
  )
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = merge( var.common_tags, var.public_rt_tags, {
    Name = local.public_rt_name
  }
   )
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
   tags = merge( var.common_tags, var.private_rt_tags, {
    Name = local.private_rt_name
  }
   )
}

resource "aws_route_table" "database_rt" {
  vpc_id = aws_vpc.main.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
   tags = merge( var.common_tags, var.database_rt_tags, {
    Name = local.database_rt_name
  }
   )
}

resource "aws_route_table_association" "public_assocation" {
    count = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_assocation" {
    count = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet_cidr[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "database_assocation" {
    count = length(var.database_subnet_cidr)
  subnet_id      = aws_subnet.database_subnet_cidr[count.index].id
  route_table_id = aws_route_table.database_rt.id
}

resource "aws_db_subnet_group" "RDS" {
  
  subnet_ids = aws_subnet.database_subnet_cidr[*].id
  # name = "${local.database_subnet_name}-db_subnet_group"
  tags = merge( 
    var.common_tags,
    var.aws_db_subnet_group_rds,
    {
    Name = "${local.database_subnet_name}-db_subnet_group"
  }
  )
}


#peering connection

resource "aws_vpc_peering_connection" "peering" {
  count = var.is_vpc_peering_request ? 1 : 0
  auto_accept   = true
  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.main.id
  tags = merge (
    var.common_tags,
    var.peering_tags,
    {
      Name = "${local.vpc_name}-default-vpc"
    }
  )
}



# route assoications

resource "aws_route" "public_peering_connection" {
  count = var.is_vpc_peering_request ? 1 : 0
  route_table_id            = data.aws_route_table.default_rt.id
  # destination_cidr_block    = aws_subnet.public_subnet.id
  destination_cidr_block = aws_subnet.public_subnet[count.index].cidr_block

  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}


resource "aws_route" "private_peering_connection" {
  count = var.is_vpc_peering_request ? 1 : 0
  route_table_id            = data.aws_route_table.default_rt.id
  destination_cidr_block    = aws_subnet.private_subnet_cidr[count.index].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "database_peering_connection" {
  count = var.is_vpc_peering_request ? 1 : 0
  route_table_id            = data.aws_route_table.default_rt.id
  destination_cidr_block    = aws_subnet.database_subnet_cidr[count.index].cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

# default vpc peering
 

resource "aws_route" "default_peering_connection" {
  count = var.is_vpc_peering_request ? 1 : 0
  route_table_id            = data.aws_route_table.default_rt.id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
