module "rg" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.vnets

}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Modules/azurerm_subnet"
  subnets    = var.subnets
}

module "pips" {
  depends_on = [module.rg]
  source     = "../../Modules/PublicIP"
  publicIPs  = var.publicIPs
}

module "vms" {
  depends_on       = [module.pips, module.subnet, module.NSG]
  source           = "../../Modules/azurerm_virual_machine"
  virtual_machines = var.virtual_machines

}
module "NSG" {
  depends_on = [module.rg]
  source     = "../../Modules/nsg"
  nsg        = var.nsg

}