module "library_component" {
  source = "../modules/library-component"

  availability_zone = var.availability_zone

  key_pair_name = var.key_pair_name
  private_key_path = var.private_key_path
  public_key_path = var.public_key_path

  vpc_cidr_block_range = var.vpc_cidr_block_range
  public_subnet_cidr_block_range = var.public_subnet_cidr_block_range

  environment_tag = var.environment_tag
}