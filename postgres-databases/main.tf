terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1"
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3"
    }
  }
}

provider "postgresql" {
  host     = "localhost"
  username = "postgres"
  database = "postgres"
  port     = 5432
}



module "klivar_play" {
  source        = "./klivar-database-and-user"
  instance_name = "play"
}

module "klivar_playground" {
  source        = "./klivar-database-and-user"
  instance_name = "playground"
}

# ------------------------------------------

module "klivar_prod" {
  source        = "./klivar-database-and-user"
  instance_name = "prod"
}

module "klivar_develop" {
  source        = "./klivar-database-and-user"
  instance_name = "develop"
}


module "klivar_playg" {
  source        = "./klivar-database-and-user"
  instance_name = "playg"
}
# note: the module name is klivar_dev, not klivar_develop as in the outputs.tf file with new version
module "klivar_dev" {
  source        = "./klivar-database-and-user"
  instance_name = "dev"
}