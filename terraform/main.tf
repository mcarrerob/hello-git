#config AZ provider

provider "azurerm" {
  features {}
}

#create RG

resource "azurerm_resource_group" "rg" {
  name     = "rg-cloud-project"
  location = "westeurope"
}

#create Virtual Network

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-cloud-project"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet_web" {
  name                 = "subnet-web"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}