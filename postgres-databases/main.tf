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

module "klivar_dev" {
  source        = "./klivar-database-and-user"
  instance_name = "dev"
}

module "klivar_play" {
  source        = "./klivar-database-and-user"
  instance_name = "play"
}
