terraform {
  backend "azurerm" {
    key                 = "terraform.tfstate"    
  }
}

provider "azurerm" {
    version = "~>2.13.0"
    features {}    
}
