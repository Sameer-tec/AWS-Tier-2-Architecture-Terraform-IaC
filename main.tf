module "EC2" {
    source = "./module/ec2"
    instance_type = var.instance_type
    public_subnet_id = module.vpc.my_public_subnet_id
    security_group_web = module.security.web_sg_id
    project_name = var.project_name
    db_host = module.rds.db_endpoint
    db_username = var.db_username
    db_password = module.secret.db_password
    db_name = var.db_name







  
}




module "vpc" {
    source = "./module/vpc"
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidrs = var.private_subnet_cidrs
    aws_region = var.aws_region
    

    








  
}





module "security" {
    source = "./module/security_groups"
    vpc_id = module.vpc.vpc_id
    
  
}



module "secret" {
    source = "./module/secret"
    db_username = var.db_username
    db_name     = var.db_name
    project_name = var.project_name

}



module "rds" {
    source = "./module/rds" 
    project_name = var.project_name
    db_username = var.db_username
    db_name = var.db_name
    db_instance_class = var.db_instance_class
    db_password = module.secret.db_password
    db_security_group_id = module.security.db_sg_id
    db_private_subnet_ids = module.vpc.private_subnet_ids


    db_allocated_storage = var.db_allocated_storage
    db_engine_version = var.db_engine_version


 }