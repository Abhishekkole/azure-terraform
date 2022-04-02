
module "acr" {
  source                   = "../modules/acr"
  
}

module "staticwebsite" {
  source                   = "../modules/staticwebsite"
}

module "ad" {
  source                   = "../modules/ad"

}

module "mysql" {
  source                   = "../modules/mysql"
}


module "k8cluster" {
  source                   = "../modules/k8cluster"
}


module "keyvault" {
  source                   = "../modules/keyvault"
  database_name            = module.mysql.db_name
  acr-name                 = module.acr.acr_registry_name
}
